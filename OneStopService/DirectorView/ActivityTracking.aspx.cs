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
            string query = "SELECT dt.T_ID AS TokenID, u.U_EMAIL AS UserEmail, d.StartingDateFYP, d.EndDateFYP, d.StartingDateFinance, d.EndDateFinance, dt.T_STATUS AS Status FROM DegreeToken dt INNER JOIN DegreeIssuanceForm df ON dt.F_ID = df.F_ID INNER JOIN Users u ON df.U_ID = u.U_ID INNER JOIN Dates d ON dt.T_ID = d.T_ID;";

            using (SqlCommand command = new SqlCommand(query, connection))
            {
                connection.Open();

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    //Giving names to the column of the tables
                    dataTable.Columns.Add("ID");
                    dataTable.Columns.Add("FYP_S");
                    dataTable.Columns.Add("FYP_E");
                    dataTable.Columns.Add("Finance_S");
                    dataTable.Columns.Add("Finance_E");
                    dataTable.Columns.Add("Status");

                    //Reading data
                    while (reader.Read())
                    {
                        DataRow row = dataTable.NewRow();
                        row["ID"] = reader["TokenID"];
                        row["FYP_S"] = reader["StartingDateFYP"] != DBNull.Value ? ((DateTime)reader["StartingDateFYP"]).ToString("MM/dd/yyyy") : null;
                        row["FYP_E"] = reader["EndDateFYP"] != DBNull.Value ? ((DateTime)reader["EndDateFYP"]).ToString("MM/dd/yyyy") : null;
                        row["Finance_S"] = reader["StartingDateFinance"] != DBNull.Value ? ((DateTime)reader["StartingDateFinance"]).ToString("MM/dd/yyyy") : null;
                        row["Finance_E"] = reader["EndDateFinance"] != DBNull.Value ? ((DateTime)reader["EndDateFinance"]).ToString("MM/dd/yyyy") : null;
                        row["Status"] = reader["Status"];

                        dataTable.Rows.Add(row);
                    }
                }
            }
        }
        return dataTable;
    }
}
