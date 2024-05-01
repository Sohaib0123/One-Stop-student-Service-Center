using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using static System.Collections.Specialized.BitVector32;
using System.Reflection;
using System.Xml.Linq;
using System.Drawing;

public partial class FinanceView_VerifyPayment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void GenerateButton_Click(object sender, EventArgs e)
    {
        // Get the selected date from the dropdown list
        string selectedID = DropDownList1.SelectedValue;
        //Console.WriteLine(selectedDate);

        // If you need to format the date differently, you can parse it and format it here
        // Example:
        //DateTime parsedDate;
        //if (DateTime.TryParse(selectedDate, out parsedDate))
        //{
        //    selectedDate = parsedDate.ToString("yyyy-MM-dd"); // Adjust the format as needed
        //}

        string connectionString = "Data Source=DESKTOP-17A1195\\SQLEXPRESS;Initial Catalog=SEProject;Integrated Security=True";

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string query = "SELECT T_ID, P_TYPE, P_STATUS, TOTAL_AMOUNT, PAID_AMOUNT FROM Payments where T_ID = @selectedID;";

            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@selectedID", selectedID);

                connection.Open();

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    GridView1.DataSource = reader;
                    GridView1.DataBind();

                    reader.Close();
                }
            }

            cont2.Controls.Add(GridView1);
            GridView1.CssClass = "grid2";
        }
    }

}