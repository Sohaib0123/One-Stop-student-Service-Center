using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Windows;
using Xceed.Wpf.Toolkit;

public class User
{
    public int ID { get; set; }
    public string Email { get; set; }
    public string Password { get; set; }

    public void SignIn()
    {
        Console.WriteLine("User signed in");
    }

    public void SignOut()
    {
        Console.WriteLine("User signed out");
    }
}


public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection("Data Source=DESKTOP-17A1195\\SQLEXPRESS;Initial Catalog=SEProject;Integrated Security=True");
        conn.Open();

        SqlCommand cm;
        string email = Request.Form["emailInput"];
        string pass = Request.Form["loginPass"];

        Console.WriteLine(email);
        Console.WriteLine(pass);


        string query = "Select * from USERS where U_EMAIL = '" + email + "' and U_PASSWORD = '" + pass + "'";


        cm = new SqlCommand(query, conn);

        bool flag = false;

        using (SqlDataReader res = cm.ExecuteReader())
        {
            if (!res.HasRows)
            {

                Response.Write("No such username found");
                //Response.Redirect("Home.aspx");

            }
            else
            {
                flag = true;

                // Response.Write("Successfully logged in!");

            }
        }



        cm.Dispose();
        conn.Close();


        if (flag)
        {

            conn.Open();

            SqlCommand cm2;


            DateTime now = DateTime.Now;
            string query2 = "INSERT INTO loggedInSucessfully (email, loggedTime) VALUES (@Email, @LoggedTime)";
            cm2 = new SqlCommand(query2, conn);

            // Add parameters with proper types
            cm2.Parameters.AddWithValue("@Email", email);
            cm2.Parameters.AddWithValue("@LoggedTime", now);

            cm2.ExecuteNonQuery();

            cm2.Dispose();
            conn.Close();

            RoleManagement();

        }

        //Server.Transfer("Home.aspx");

    }

    protected void RoleManagement()
    {
        SqlConnection conn2 = new SqlConnection("Data Source=DESKTOP-17A1195\\SQLEXPRESS;Initial Catalog=SEProject;Integrated Security=True");
        conn2.Open();

        SqlCommand cm2;

        string query2 = "select U_ROLE from USERS where U_EMAIL = (select top 1 email from loggedInSucessfully order by loggedTime desc)";
        cm2 = new SqlCommand(query2, conn2);

        object result = cm2.ExecuteScalar();
        if (result != null)
        {
            string role = result.ToString();

            if (role == "Student")
                Response.Redirect("Home.aspx", false);
            else if (role == "FYP")
                Response.Redirect("/FYPView/Home.aspx", false);
            else if (role == "Admin")
                Response.Redirect("/AdminView/Home.aspx", false);
            else if (role == "Finance")
                Response.Redirect("/FinanceView/Home.aspx", false);
            else if (role == "Director")
                Response.Redirect("/DirectorView/Home.aspx", false);


        }

        cm2.ExecuteNonQuery();

        cm2.Dispose();
        conn2.Close();
    }


}

