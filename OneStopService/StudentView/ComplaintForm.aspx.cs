using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class StudentView_ComplaintForm : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void submitButton_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection("Data Source=DESKTOP-17A1195\\SQLEXPRESS;initial catalog=SEProject;integrated security=true"); //connection string
        conn.Open();
        //MessageBox.Show("Connection Open");
        SqlCommand cm, cm2, cm3;
        DateTime now = DateTime.Now;
        string name = Request.Form["Name"];
        string email = Request.Form["Email"];
        string rollNo = Request.Form["RollNo"];
        string department = Request.Form["Department"];
        string desc = Request.Form["TextBox1"];
        
        string query2 = "select COUNT(F_ID) as NUM FROM DegreeIssuanceForm";

        string query3 = "select U_ID from USERS where U_EMAIL = (select top 1 email from loggedInSucessfully order by loggedTime desc)";
        cm3 = new SqlCommand(query3, conn);

        int userid = Convert.ToInt32(cm3.ExecuteScalar());

        cm2 = new SqlCommand(query2, conn);
        int count = 0;

        count = Convert.ToInt32(cm2.ExecuteScalar());

        count++;

        cm2.Dispose();
        conn.Close();
        conn.Open();

        string query = "Insert into ComplaintForm (C_ID, U_ID, C_Name, C_Email, C_RollNo, C_Dept, C_Description, C_Status, C_Submission) Values " +
            "(@C_ID, @U_ID, @C_NAME, @C_EMAIL, @RollNo, @C_Dept, @C_Description, @C_Status, @C_Submission)";
        cm = new SqlCommand(query, conn);

        // Adding parameters
        cm.Parameters.AddWithValue("@C_ID", count);
        cm.Parameters.AddWithValue("@U_ID", userid);
        cm.Parameters.AddWithValue("@C_NAME", name);
        cm.Parameters.AddWithValue("@C_Dept", department);
        cm.Parameters.AddWithValue("@C_EMAIL", email);
        cm.Parameters.AddWithValue("@RollNo", rollNo);
        cm.Parameters.AddWithValue("@C_Description", desc);
        cm.Parameters.AddWithValue("@C_SUBMISSION", now); // Assuming 'now' is in a correct date format
        cm.Parameters.AddWithValue("@C_STATUS", "Pending");

        cm.ExecuteNonQuery();

        cm.Dispose();
        conn.Close();

        Server.Transfer("Home.aspx");

    }
}