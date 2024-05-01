using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Windows;
using Xceed.Wpf.Toolkit;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }



    //private void Login_Click(object sender, EventArgs e)
    //{
    //    SqlConnection conn = new SqlConnection("Data Source=DESKTOP-17A1195/SQLEXPRESS;Initial Catalog=SEProject;Integrated Security=True");
    //    conn.Open();


    //    //MessageBox.Show("Connection Open");
    //    SqlCommand cm;
    //    string un = Request.Form["loginEmail"];
    //    string pass = Request.Form["loginPass"];
    //    string query = "Select* from USERS where EMAIL = '" + un + "' and U_PASSWORD = '" + pass + "'";


    //    cm = new SqlCommand(query, conn);

    //    SqlDataReader res = cm.ExecuteReader();

    //    if (!res.HasRows)
    //    {

    //        Response.Write("No such username found");


    //    }
    //    else
    //    {

    //        Response.Write("Successfully logged in!");
    //        // Server.Transfer("Home.aspx");
    //    }

    //    Console.WriteLine("After method call, value of res : {0}", res);
    //    cm.Dispose();
    //    conn.Close();
    //    //this.Close();
    //}

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection("Data Source=DESKTOP-17A1195\\SQLEXPRESS;Initial Catalog=SEProject;Integrated Security=True");
        conn.Open();
        // Response.Redirect("Home.aspx");

        //MessageBox.Show("Connection Open");
        SqlCommand cm;
        string email = Request.Form["emailInput"];
        string pass = Request.Form["loginPass"];

        // Response.Write(pass);
        //  Response.Write(email);


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
                Server.Transfer("Home.aspx");
            else if (role == "FYP")
                Server.Transfer("/FYPView/Home.aspx");
            else if (role == "Admin")
                Server.Transfer("/AdminView/Home.aspx");
            else if (role == "Finance")
                Server.Transfer("/FinanceView/Home.aspx");
            else if (role == "Director")
                Server.Transfer("/DirectorView/Home.aspx");

        }

        cm2.ExecuteNonQuery();

        cm2.Dispose();
        conn2.Close();
    }


}

