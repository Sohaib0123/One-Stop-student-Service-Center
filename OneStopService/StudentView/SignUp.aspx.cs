using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using Xceed.Wpf.Toolkit;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int id = 0;

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection("Data Source=DESKTOP-17A1195\\SQLEXPRESS;initial catalog=SEProject;integrated security=true"); //connection string
        conn.Open();
        //MessageBox.Show("Connection Open");
        SqlCommand cm, cm2;
        string name = Request.Form["nameInput"];
        string email = Request.Form["Email"];
        string role = Request.Form["role"];
        string pass = Request.Form["passInput"];

        string query2 = "select COUNT(U_ID) as NUM FROM USERS";

        cm2 = new SqlCommand(query2, conn);
        int count = 0;

        count = Convert.ToInt32(cm2.ExecuteScalar());

        count++;

        cm2.Dispose();
        conn.Close();
        conn.Open();

        string query = "Insert into Users(U_ID, U_NAME, U_ROLE, U_EMAIL, U_PASSWORD) Values ( '" + count + "','" + name + "','" + role + "' , '" + email + "', '" + pass + "')";
        cm = new SqlCommand(query, conn);
        cm.ExecuteNonQuery();
        cm.Dispose();
        conn.Close();

        Server.Transfer("Login.aspx");
    }
}