﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FYPView_ProvideDecision : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void submitButton_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection("Data Source=DESKTOP-17A1195\\SQLEXPRESS;initial catalog=SEProject;integrated security=true"); //connection string
        conn.Open();

        string selectedID = DropDownList1.SelectedValue;
        string selectedStatus = DropDownList2.SelectedValue;

        //MessageBox.Show("Connection Open");
        SqlCommand cm, cm2, cm3;

        string fypObjection = Request.Form["secTit"];
        string financeComment = "\0";


        string query3 = "Select F_ID from DegreeToken where T_ID = @selectedID";

        cm3 = new SqlCommand(query3, conn);
        cm3.Parameters.AddWithValue("@selectedID", selectedID);

        

        int formid = Convert.ToInt32(cm3.ExecuteScalar());

        conn.Close();
        conn.Open();
        DateTime now = DateTime.Now;

        string query = "UPDATE DegreeToken SET " +
                       "FYP_Decision = @FYP_Decision, " +
                       "Finance_Decision = @Finance_Decision, " +
                       "T_Status = @T_Status, " +
                       "FYP_Comment = @FYP_Comment, " +
                       "Finance_Comment = @Finance_Comment " +
                       "WHERE T_ID = @T_ID";

        string query2 = "Update DATES Set EndDateFYP = @EndDateFYP, StartingDateFinance = @StartingDateFinance " + // Notice the space before the quote
                        "WHERE T_ID = @T_ID";
        cm2 = new SqlCommand(query2, conn);


        cm = new SqlCommand(query, conn);

        // Adding parameters
        cm.Parameters.AddWithValue("@T_ID", selectedID);
        cm.Parameters.AddWithValue("@F_ID", formid);
        cm.Parameters.AddWithValue("@FYP_Decision", selectedStatus);
        cm.Parameters.AddWithValue("@Finance_Decision", "Pending");

        //Adding Paramter for 2nd query
        cm2.Parameters.AddWithValue("@T_ID", selectedID);
        cm2.Parameters.AddWithValue("@EndDateFYP", now); 
        cm2.Parameters.AddWithValue("@StartingDateFinance", now);

        //Conditions for Status 
        if (selectedStatus == "Accepted")
        {
            cm2.ExecuteNonQuery();
            cm.Parameters.AddWithValue("@T_Status", "Request is delivered to Finance");
        }
       else if(selectedStatus == "Pending")
            cm.Parameters.AddWithValue("@T_Status", "Request is delivered to FYP committee");
       else if(selectedStatus == "Rejected")
            cm.Parameters.AddWithValue("@T_Status", "Request is Pending");
        
        cm.Parameters.AddWithValue("@FYP_Comment", fypObjection);
        cm.Parameters.AddWithValue("@Finance_Comment", financeComment);
        cm3.ExecuteNonQuery();
        cm.ExecuteNonQuery();

        cm.Dispose();
        cm2.Dispose();
        conn.Close();

        Server.Transfer("Home.aspx");


    }
}
