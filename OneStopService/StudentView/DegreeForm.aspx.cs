using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
<<<<<<< HEAD
    protected void CustomValidatorDeclaration_ServerValidate(object source, ServerValidateEventArgs args)
    {
        args.IsValid = MyCheckBox.Checked;
    }

=======
>>>>>>> 8ff5c753434ae76c7ebac7ea37317e5d9b8a1518

    protected void submitButton_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection("Data Source=DESKTOP-17A1195\\SQLEXPRESS;initial catalog=SEProject;integrated security=true"); //connection string
        conn.Open();
        //MessageBox.Show("Connection Open");
        SqlCommand cm, cm2, cm3;
        DateTime now = DateTime.Now;
        string name = Request.Form["Name"];
        string address = Request.Form["Address"];
        string email = Request.Form["Email"];
        string CNIC = Request.Form["CNIC"];
        string rollNo = Request.Form["RollNo"];
        string contact = Request.Form["Contact"];
        string degree = Request.Form["Degree"];
        string faculty = Request.Form["Faculty"];
        string yop = Request.Form["YOP"];
        string CGPA = Request.Form["CGPA"];

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

        string query = "INSERT INTO DegreeIssuanceForm (F_ID, U_ID, D_NAME, D_EMAIL, D_ADDRESS, D_CNIC, D_ROLL, D_PHONE, D_DEGREE, D_FACULTY, D_YOP, D_CGPA, D_SUBMISSION, D_STATUS) VALUES " +
            "(@F_ID, @U_ID, @D_NAME, @D_EMAIL, @D_ADDRESS, @D_CNIC, @D_ROLL, @D_PHONE, @D_DEGREE, @D_FACULTY, @D_YOP, @D_CGPA, @D_SUBMISSION, @D_STATUS)";
        cm = new SqlCommand(query, conn);

        // Adding parameters
        cm.Parameters.AddWithValue("@F_ID", count);
        cm.Parameters.AddWithValue("@U_ID", userid);
        cm.Parameters.AddWithValue("@D_NAME", name);
        cm.Parameters.AddWithValue("@D_EMAIL", email);
        cm.Parameters.AddWithValue("@D_ADDRESS", address);
        cm.Parameters.AddWithValue("@D_CNIC", CNIC);
        cm.Parameters.AddWithValue("@D_ROLL", rollNo);
        cm.Parameters.AddWithValue("@D_PHONE", contact);
        cm.Parameters.AddWithValue("@D_DEGREE", faculty);
        cm.Parameters.AddWithValue("@D_FACULTY", faculty);
        cm.Parameters.AddWithValue("@D_YOP", yop);
        cm.Parameters.AddWithValue("@D_CGPA", CGPA);
        cm.Parameters.AddWithValue("@D_SUBMISSION", now); // Assuming 'now' is in a correct date format
        cm.Parameters.AddWithValue("@D_STATUS", "Pending");

        cm.ExecuteNonQuery();

        cm.Dispose();
        conn.Close();

        Server.Transfer("Home.aspx");

    }
}