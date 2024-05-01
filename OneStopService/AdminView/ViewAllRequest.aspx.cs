using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminView_ViewAllRequest : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection("Data Source=DESKTOP-17A1195\\SQLEXPRESS;Initial Catalog=SEProject;Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            MenuItemBinding();
        }
    }

    private void MenuItemBinding()
    {
        conn.Open();
        //string query = "Select CCODE from Courses inner join STUDENT_COURSES on STUDENT_COURSES.COURSE_ID = Courses.C_ID where STUDENT_COURSES.STUDENT_ID = (select U_ID from USERS where EMAIL = (select top 1 email from loggedInSucessfully order by loggedTime desc))";
        //DataSet ds = new DataSet();
        //SqlDataAdapter da = new SqlDataAdapter(query, conn);
        //DataTable dttc = new DataTable();
        //da.Fill(ds);
        //dttc = ds.Tables[0];

        //Menu1.Items.Clear(); // Clear existing items before adding new ones

        //foreach (DataRow row in dttc.Rows)
        //{
        //    Menu1.Items.Add(new MenuItem(row["CCODE"].ToString()));
        //}

        /////////////////////////////////////////////////1st Grid////////////////////////////////////////////////////
        GridView gridView = new GridView();
        gridView.ID = "dynamicGridView"; // Set a unique ID for the grid

        // Set the properties of the grid as desired
        gridView.AutoGenerateColumns = true;
        gridView.DataSource = GetGridData(); // Replace this with your actual data source
        gridView.DataBind();

        // Add the grid to the content div
        cont3.Controls.Add(gridView);
        gridView.CssClass = "custom-grid";

        /////////////////////////////////////////////////2nd Grid////////////////////////////////////////////////////
        GridView gridView1 = new GridView();
        gridView1.ID = "dynamicGridView1"; // Set a unique ID for the grid

        // Set the properties of the grid as desired
        gridView1.AutoGenerateColumns = true;
        gridView1.DataSource = GetGridData1(); // Replace this with your actual data source
        gridView1.DataBind();

        // Add the grid to the content div
        cont4.Controls.Add(gridView1);
        gridView1.CssClass = "custom-grid";


        conn.Close();
    }

    private DataTable GetGridData() //For Complaint form
    {
        DataTable dataTable = new DataTable();

        //string courseId = cName;

        string connectionString = "Data Source=DESKTOP-17A1195\\SQLEXPRESS;Initial Catalog=SEProject;Integrated Security=True";

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            //Query to select Token_ID, Date, Email, Status
            string query = "SELECT ComplaintForm.C_ID, Users.U_EMAIL,  ComplaintForm.C_SUBMISSION, ComplaintForm.C_STATUS FROM ComplaintForm JOIN Users ON ComplaintForm.U_ID = Users.U_ID";

            using (SqlCommand command = new SqlCommand(query, connection))
            {
                connection.Open();

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    //Giving names to the column of the tables
                    dataTable.Columns.Add("Form_ID");
                    dataTable.Columns.Add("Email");
                    dataTable.Columns.Add("Date");
                    dataTable.Columns.Add("Status");


                    //Reading data
                    while (reader.Read())
                    {
                        DataRow row = dataTable.NewRow();
                        row["Form_ID"] = reader["C_ID"];
                        row["Email"] = reader["U_Email"];
                        row["Date"] = reader["C_Submission"];
                        row["Status"] = reader["C_Status"];

                        dataTable.Rows.Add(row);
                    }

                }
            }
        }
        return dataTable;
    }

    private DataTable GetGridData1()   //For Degree Form
    {
        DataTable dataTable = new DataTable();

        //string courseId = cName;

        string connectionString = "Data Source=DESKTOP-17A1195\\SQLEXPRESS;Initial Catalog=SEProject;Integrated Security=True";

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            //Query to select Token_ID, Date, Email, Status
            string query = "SELECT df.F_ID AS FormID, u.U_EMAIL AS UserEmail, df.D_SUBMISSION AS SubmissionDate, df.D_STATUS AS FormStatus FROM DegreeIssuanceForm df INNER JOIN Users u ON df.U_ID = u.U_ID";

            using (SqlCommand command = new SqlCommand(query, connection))
            {
                connection.Open();

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    //Giving names to the column of the tables
                    dataTable.Columns.Add("Form_ID");
                    dataTable.Columns.Add("Email");
                    dataTable.Columns.Add("Date");
                    dataTable.Columns.Add("Status");


                    //Reading data
                    while (reader.Read())
                    {
                        DataRow row = dataTable.NewRow();
                        row["Form_ID"] = reader["FormID"];
                        row["Email"] = reader["UserEmail"];
                        row["Date"] = reader["SubmissionDate"];
                        row["Status"] = reader["FormStatus"];

                        dataTable.Rows.Add(row);
                    }

                }
            }
        }
        return dataTable;
    }
}