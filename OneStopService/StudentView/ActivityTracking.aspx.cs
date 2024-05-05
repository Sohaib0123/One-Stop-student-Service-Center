using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

<<<<<<< HEAD
//public class Notification
//{
//    public int NotificationID { get; set; }
//    public string Message { get; set; }

//    public void SendNotification(User user)
//    {
//        // Send notification to a user
//        Console.WriteLine("Notification sent to user: " + user.ID);
//    }
//}


=======
>>>>>>> 8ff5c753434ae76c7ebac7ea37317e5d9b8a1518
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

        // Add the grid to the content div
        cont3.Controls.Add(gridView);
        gridView.CssClass = "custom-grid";


        conn.Close();
    }

    private DataTable GetGridData()
    {
        DataTable dataTable = new DataTable();

        //string courseId = cName;

        string connectionString = "Data Source=DESKTOP-17A1195\\SQLEXPRESS;Initial Catalog=SEProject;Integrated Security=True"; 

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
<<<<<<< HEAD
            SqlCommand cm, cm1;

            string selectuserid = "SELECT U_ID FROM USERS WHERE (U_EMAIL = (SELECT TOP (1) email FROM loggedInSucessfully ORDER BY loggedTime DESC))";

            cm = new SqlCommand(selectuserid, conn);

            int userid = Convert.ToInt32(cm.ExecuteScalar());

            cm.ExecuteNonQuery();

            //Query to select Token_ID, Date, Email, Status
            string query = "SELECT dt.T_ID AS TokenID, u.U_EMAIL AS UserEmail, df.D_SUBMISSION AS SubmissionDate, dt.T_STATUS AS TokenStatus " +
               "FROM DegreeToken dt " +
               "INNER JOIN DegreeIssuanceForm df ON dt.F_ID = df.F_ID " +
               "INNER JOIN Users u ON df.U_ID = u.U_ID " +
               "WHERE u.U_ID = @U_ID;";


            

            using (SqlCommand command = new SqlCommand(query, connection))
            {

                command.Parameters.AddWithValue("@U_ID", userid);
=======
            //Query to select Token_ID, Date, Email, Status
            string query = "SELECT dt.T_ID AS TokenID, u.U_EMAIL AS UserEmail, df.D_SUBMISSION AS SubmissionDate, dt.T_STATUS AS TokenStatus FROM DegreeToken dt INNER JOIN DegreeIssuanceForm df ON dt.F_ID = df.F_ID INNER JOIN Users u ON df.U_ID = u.U_ID;";

            using (SqlCommand command = new SqlCommand(query, connection))
            {
>>>>>>> 8ff5c753434ae76c7ebac7ea37317e5d9b8a1518
                connection.Open();

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    //Giving names to the column of the tables
                    dataTable.Columns.Add("Token_ID");
                    dataTable.Columns.Add("Email");
                    dataTable.Columns.Add("Date");
                    dataTable.Columns.Add("Status");


                    //Reading data
                    while (reader.Read())
                    {
                        DataRow row = dataTable.NewRow();
                        row["Token_ID"] = reader["TokenID"];
                        row["Email"] = reader["UserEmail"];
                        row["Date"] = reader["SubmissionDate"];
                        row["Status"] = reader["TokenStatus"];

                        dataTable.Rows.Add(row);
                    }
                }
            }
        }
        return dataTable;
    }
}
