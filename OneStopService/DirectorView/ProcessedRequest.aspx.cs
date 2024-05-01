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
            //Query to select Token_ID, Date, Email, Status
            string query = "SELECT dt.T_ID AS TokenID, u.U_EMAIL AS UserEmail, df.D_SUBMISSION AS SubmissionDate, dt.T_STATUS AS TokenStatus FROM DegreeToken dt INNER JOIN DegreeIssuanceForm df ON dt.F_ID = df.F_ID INNER JOIN Users u ON df.U_ID = u.U_ID where T_STATUS = 'One Stop Admin has started processing the request'  OR T_STATUS = 'Request is delivered to FYP committee' OR T_STATUS = 'Request is delivered to Finance';";

            using (SqlCommand command = new SqlCommand(query, connection))
            {
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
