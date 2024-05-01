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

        SqlConnection conn = new SqlConnection("Data Source=DESKTOP-17A1195\\SQLEXPRESS;initial catalog=SEProject;integrated security=true"); //connection string
        conn.Open();

        string query = "select COUNT(T_ID) as NUM FROM DegreeToken";

        SqlCommand cm, cm2;

        cm = new SqlCommand(query, conn);
        int count = 0;

        count = Convert.ToInt32(cm.ExecuteScalar());

        count++;

        cm.Dispose();
        conn.Close();
        conn.Open();

        DateTime now =DateTime.Now;

        string query1 = "INSERT INTO DegreeToken (T_ID, F_ID, FYP_DECISION, FINANCE_DECISION, T_STATUS, FYP_COMMENT, FINANCE_COMMENT) VALUES " +
            "(@T_ID, @F_ID, @FYP_DECISION, @FINANCE_DECISION, @T_STATUS, @FYP_COMMENT, @FINANCE_COMMENT)";
        cm = new SqlCommand(query1, conn);

        string query2 = "INSERT INTO DATES (T_ID, StartingDateFYP) VALUES " +
            "(@T_ID, @StartingDateFYP)";
        cm2 = new SqlCommand(query2, conn);


        // Adding parameters
        cm.Parameters.AddWithValue("@T_ID", count);
        cm.Parameters.AddWithValue("@F_ID", selectedID);
        cm.Parameters.AddWithValue("@FYP_DECISION", "Pending");
        cm.Parameters.AddWithValue("@FINANCE_DECISION", "Pending");
        cm.Parameters.AddWithValue("@T_STATUS", "Request is delivered to FYP committee");
        cm.Parameters.AddWithValue("@FYP_COMMENT", " ");
        cm.Parameters.AddWithValue("@FINANCE_COMMENT", " ");


        //Adding parameters for 2nd query
        cm2.Parameters.AddWithValue("@T_ID", count);
        cm2.Parameters.AddWithValue("@StartingDateFYP", now);


        cm.ExecuteNonQuery();
        cm2.ExecuteNonQuery();

        cm.Dispose();
        cm2.Dispose();
        conn.Close();

        Server.Transfer("Home.aspx");


    }
}