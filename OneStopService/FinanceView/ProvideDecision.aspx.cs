using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FYPView_ProvideDecision : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

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


    }
}
