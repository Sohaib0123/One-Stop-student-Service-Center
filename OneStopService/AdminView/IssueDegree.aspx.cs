using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminView_Token : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

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


    }
}