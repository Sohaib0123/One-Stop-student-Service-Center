using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

public partial class AdminView_Token : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void submitButton_Click(object sender, EventArgs e)
    {

        string selectedID = DropDownList1.SelectedValue;
        string selectedStatus = DropDownList2.SelectedValue;
        string feedback = Request.Form["Feedback"];

        SqlConnection conn = new SqlConnection("Data Source=DESKTOP-17A1195\\SQLEXPRESS;initial catalog=SEProject;integrated security=true"); //connection string
        conn.Open();

        string query = "select COUNT(T_ID) as NUM FROM ComplaintToken";

        SqlCommand cm, cm1;

        cm = new SqlCommand(query, conn);
        int count = 0;

        count = Convert.ToInt32(cm.ExecuteScalar());

        count++;

        cm.Dispose();
        conn.Close();
        conn.Open();

        string query1 = "INSERT INTO ComplaintToken (T_ID, C_ID, C_STATUS, C_FEEDBACK, GENERATION_DATE) VALUES " +
            "(@T_ID, @C_ID, @C_STATUS, @C_FEEDBACK, @GENERATION_DATE)";
        cm = new SqlCommand(query1, conn);

        string query2 = "UPDATE ComplaintForm SET C_STATUS = 'Completed' WHERE C_ID = @C_ID;";
        cm1 = new SqlCommand(query2, conn);

        DateTime now = DateTime.Now;

        // Adding parameters
        cm.Parameters.AddWithValue("@T_ID", count);
        cm.Parameters.AddWithValue("@C_ID", selectedID);
        cm.Parameters.AddWithValue("@C_STATUS", selectedStatus);
        cm.Parameters.AddWithValue("@C_FEEDBACK", feedback);
        cm.Parameters.AddWithValue("@GENERATION_DATE", now);

        cm1.Parameters.AddWithValue("@C_ID", selectedID);


        cm.ExecuteNonQuery();
        cm1.ExecuteNonQuery();

        cm1.Dispose();
        conn.Close();

        Server.Transfer("Home.aspx");


    }
}