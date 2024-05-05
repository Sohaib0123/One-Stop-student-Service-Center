using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
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
<<<<<<< HEAD
=======
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
>>>>>>> 8ff5c753434ae76c7ebac7ea37317e5d9b8a1518

        GridView gridView = new GridView();
        gridView.ID = "dynamicGridView"; // Set a unique ID for the grid

        // Set the properties of the grid as desired
        gridView.AutoGenerateColumns = true;
        gridView.DataSource = GetGridData(); // Replace this with your actual data source
        gridView.DataBind();

<<<<<<< HEAD
        // Adjust column widths here, make sure to check if columns exist
        if (gridView.Columns.Count > 0)
        {
            //gridView.Columns[0].ItemStyle.Width = Unit.Pixel(100);
            // Repeat or loop for other columns as necessary
            // For example:
            for (int i = 0; i < gridView.Columns.Count; i++)
            {
                gridView.Columns[i].ItemStyle.Width = Unit.Pixel(10); // Or different widths for each column
            }
        }

=======
>>>>>>> 8ff5c753434ae76c7ebac7ea37317e5d9b8a1518
        // Add the grid to the content div
        cont3.Controls.Add(gridView);
        gridView.CssClass = "custom-grid";

<<<<<<< HEAD
=======

>>>>>>> 8ff5c753434ae76c7ebac7ea37317e5d9b8a1518
        conn.Close();
    }

    private DataTable GetGridData()
    {
        DataTable dataTable = new DataTable();

        //string courseId = cName;

        string connectionString = "Data Source=DESKTOP-17A1195\\SQLEXPRESS;Initial Catalog=SEProject;Integrated Security=True"; 

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            //Query to select Token_ID, Date, Email, Status
<<<<<<< HEAD
            string query = "SELECT dt.T_ID AS TokenID, u.U_EMAIL AS UserEmail, d.StartingDateFYP, d.EndDateFYP, d.StartingDateFinance, d.EndDateFinance, dt.T_STATUS AS Status FROM DegreeToken dt INNER JOIN DegreeIssuanceForm df ON dt.F_ID = df.F_ID INNER JOIN Users u ON df.U_ID = u.U_ID INNER JOIN Dates d ON dt.T_ID = d.T_ID;";
=======
            string query = "SELECT dt.T_ID AS TokenID, u.U_EMAIL AS UserEmail, df.D_SUBMISSION AS SubmissionDate, dt.T_STATUS AS TokenStatus FROM DegreeToken dt INNER JOIN DegreeIssuanceForm df ON dt.F_ID = df.F_ID INNER JOIN Users u ON df.U_ID = u.U_ID;";
>>>>>>> 8ff5c753434ae76c7ebac7ea37317e5d9b8a1518

            using (SqlCommand command = new SqlCommand(query, connection))
            {
                connection.Open();

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    //Giving names to the column of the tables
<<<<<<< HEAD
                    dataTable.Columns.Add("ID");
                    dataTable.Columns.Add("FYP_S");
                    dataTable.Columns.Add("FYP_E");
                    dataTable.Columns.Add("Finance_S");
                    dataTable.Columns.Add("Finance_E");
                    dataTable.Columns.Add("Status");

=======
                    dataTable.Columns.Add("Token_ID");
                    dataTable.Columns.Add("Email");
                    dataTable.Columns.Add("Date");
                    dataTable.Columns.Add("Status");


>>>>>>> 8ff5c753434ae76c7ebac7ea37317e5d9b8a1518
                    //Reading data
                    while (reader.Read())
                    {
                        DataRow row = dataTable.NewRow();
<<<<<<< HEAD
                        row["ID"] = reader["TokenID"];
                        row["FYP_S"] = reader["StartingDateFYP"] != DBNull.Value ? ((DateTime)reader["StartingDateFYP"]).ToString("MM/dd/yyyy") : null;
                        row["FYP_E"] = reader["EndDateFYP"] != DBNull.Value ? ((DateTime)reader["EndDateFYP"]).ToString("MM/dd/yyyy") : null;
                        row["Finance_S"] = reader["StartingDateFinance"] != DBNull.Value ? ((DateTime)reader["StartingDateFinance"]).ToString("MM/dd/yyyy") : null;
                        row["Finance_E"] = reader["EndDateFinance"] != DBNull.Value ? ((DateTime)reader["EndDateFinance"]).ToString("MM/dd/yyyy") : null;
                        row["Status"] = reader["Status"];
=======
                        row["Token_ID"] = reader["TokenID"];
                        row["Email"] = reader["UserEmail"];
                        row["Date"] = reader["SubmissionDate"];
                        row["Status"] = reader["TokenStatus"];
>>>>>>> 8ff5c753434ae76c7ebac7ea37317e5d9b8a1518

                        dataTable.Rows.Add(row);
                    }
                }
            }
        }
        return dataTable;
    }
}
