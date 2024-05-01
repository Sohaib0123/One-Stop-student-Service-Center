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
        string connectionString = "Data Source=DESKTOP-17A1195\\SQLEXPRESS;Initial Catalog=SEProject;Integrated Security=True";

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();

            // Fetch the U_ID for the currently logged-in user
            string selectUserId = "SELECT U_ID FROM USERS WHERE U_EMAIL = (SELECT TOP (1) email FROM loggedInSucessfully ORDER BY loggedTime DESC)";
            SqlCommand userIdCommand = new SqlCommand(selectUserId, connection);
            int userId = Convert.ToInt32(userIdCommand.ExecuteScalar());

            // Query to determine the D_STATUS for the user
            string statusQuery = "SELECT D_STATUS FROM DegreeIssuanceForm WHERE U_ID = @U_ID";
            SqlCommand statusCommand = new SqlCommand(statusQuery, connection);
            statusCommand.Parameters.AddWithValue("@U_ID", userId);
            string status = (string)statusCommand.ExecuteScalar();

            // Determine which message to display based on the status
            string query;
            if (status == "Completed")
            {
                query = "SELECT description, receive_date FROM ReceiveDegreeMessage WHERE receive_date IS NOT NULL;";
            }
            else
            {
                query = "SELECT description, receive_date FROM ReceiveDegreeMessage WHERE receive_date IS NULL;";
            }

            // Execute the appropriate query and populate the DataTable
            SqlCommand command = new SqlCommand(query, connection);
            using (SqlDataReader reader = command.ExecuteReader())
            {
                dataTable.Columns.Add("Description");
                dataTable.Columns.Add("Receive Date", typeof(DateTime));

                while (reader.Read())
                {
                    DataRow row = dataTable.NewRow();
                    row["Description"] = reader["description"];
                    row["Receive Date"] = reader.IsDBNull(reader.GetOrdinal("receive_date")) ? DBNull.Value : reader["receive_date"];
                    dataTable.Rows.Add(row);
                }
            }
        }
        return dataTable;
    }
}
