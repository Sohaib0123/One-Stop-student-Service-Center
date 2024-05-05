using System;
using System.Collections.Generic;
<<<<<<< HEAD
using System.Data.SqlClient;
=======
>>>>>>> 8ff5c753434ae76c7ebac7ea37317e5d9b8a1518
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminView_Token : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

<<<<<<< HEAD
    protected void GenerateButton_Click(object sender, EventArgs e)
    {

        string selectedID = DropDownList1.SelectedValue;

        SqlConnection conn = new SqlConnection("Data Source=DESKTOP-17A1195\\SQLEXPRESS;initial catalog=SEProject;integrated security=true");
        conn.Open();
        SqlCommand cm;

        string query = "UPDATE DegreeIssuanceForm SET D_STATUS = 'Completed' WHERE F_ID = @F_ID";

        cm = new SqlCommand(query, conn);

        cm.Parameters.AddWithValue("@F_ID", selectedID);

        cm.ExecuteNonQuery();

        cm.Dispose();
        conn.Close();

        Server.Transfer("Home.aspx");
=======
    protected void submitButton_Click(object sender, EventArgs e)
    {

    }

    protected void GenerateButton_Click(object sender, EventArgs e)
    {

        //string selectedEmail = DropDownList1.SelectedValue;

        string connectionString = "Data Source=DESKTOP-17A1195/SQLEXPRESS;Initial Catalog=SEProject;Integrated Security=True";

        //using (SqlConnection connection = new SqlConnection(connectionString))
        //{
        //    string query = "SELECT SECTION.SECNAME as Section, STUDENT.ROLL_NO as Registration_No, USERS.FULLNAME AS Name " +
        //       "FROM Users " +
        //       "INNER JOIN Student ON USERS.U_ID = STUDENT.S_ID " +
        //       "INNER JOIN STUDENT_SECTION ON STUDENT_SECTION.STUDENT_ID = STUDENT.S_ID " +
        //       "INNER JOIN Section ON SECTION.Sec_ID = STUDENT_SECTION.Section_ID " +
        //       "WHERE Section.SECNAME = @Sec";

        //    using (SqlCommand command = new SqlCommand(query, connection))
        //    {
        //        command.Parameters.AddWithValue("@Sec", selectedCourse);


        //        connection.Open();

        //        using (SqlDataReader reader = command.ExecuteReader())
        //        {
        //            GridView1.DataSource = reader;
        //            GridView1.DataBind();

        //            reader.Close();
        //        }
        //    }

        //    cont2.Controls.Add(GridView1);
        //    GridView1.CssClass = "grid2";
        //}


        //using (SqlConnection connection = new SqlConnection(connectionString))
        //{
        //    string query = "SELECT SECTION.SECNAME as Section, STUDENT.ROLL_NO as Registration_No, USERS.FULLNAME AS Name " +
        //       "FROM Users " +
        //       "INNER JOIN Student ON USERS.U_ID = STUDENT.S_ID " +
        //       "INNER JOIN STUDENT_SECTION ON STUDENT_SECTION.STUDENT_ID = STUDENT.S_ID " +
        //       "INNER JOIN Section ON SECTION.Sec_ID = STUDENT_SECTION.Section_ID " +
        //       "WHERE Section.SECNAME = @Sec";

        //    using (SqlCommand command = new SqlCommand(query, connection))
        //    {
        //        command.Parameters.AddWithValue("@Sec", selectedCourse);


        //        connection.Open();

        //        using (SqlDataReader reader = command.ExecuteReader())
        //        {
        //            GridView1.DataSource = reader;
        //            GridView1.DataBind();

        //            reader.Close();
        //        }
        //    }

        //    cont2.Controls.Add(GridView1);
        //    GridView1.CssClass = "grid2";
        //}
>>>>>>> 8ff5c753434ae76c7ebac7ea37317e5d9b8a1518


    }
}