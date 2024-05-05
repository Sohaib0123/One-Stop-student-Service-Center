﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ComplaintForm.aspx.cs" Inherits="StudentView_ComplaintForm" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <title>One Stop | Student</title>
    <link rel="stylesheet" href="StyleSheet.css" />
    <link rel="icon" href="/Images/flex-tlogo.png" type="image/icon type" />
        <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/Site.css" rel="stylesheet" />
    <style type="text/css">
        .form-control {}
    </style>
</head>

<!--Body of the code-->
<body>
     
     <form id="form1" runat="server">
     
     <div class="body">


     <div class="header">
<<<<<<< HEAD
          <img src="/Images/OneStop-short.png"/>  
      </div>

    <!--Navigation Bar-->
     <div class="nav">
        <p>  <a href="Home.aspx"> Home</a> </p>
        <p>  <a href="DegreeForm.aspx">Degree Issuance Form</a></p>
        <p>  <a href="#">Complaint Form</a></p>
        <p>  <a href="ActivityTracking.aspx">Activity Tracking</a></p>
        <p>  <a href="ReceiveDegree.aspx">Receive Degree</a></p>
    </div>
=======
          <img src="/Images/flex-logo-blue.png"/>  
      </div>

      <!--Navigation Bar-->
      <div class="nav">
            <p>  <a href="Home.aspx"> Home</a> </p>
            <p>  <a href="DegreeForm.aspx">Degree Issuance Form</a></p>
            <p>  <a href="ComplaintForm.aspx">Complaint Form</a></p>
            <p>  <a href="ActivityTracking.aspx">Activity Tracking</a></p>

      </div>
>>>>>>> 8ff5c753434ae76c7ebac7ea37317e5d9b8a1518

      <div class="home" id="fbhome">

          <div id="courses">

              <div id="coursesName">
                  <h2> Complaint Form </h2>
              </div>

          <div class="content3">

          <div class="container">
           <table class="form-table">
    <tr>
        <td><label for="Name">Name of applicant:</label></td>
<<<<<<< HEAD
        <td><asp:TextBox ID="Name" runat="server" CssClass="form-control" placeholder="Enter Your Name" />
             <asp:RegularExpressionValidator 
                ID="RegularExpressionValidator1" 
                runat="server" 
                ControlToValidate="Name" 
                ErrorMessage="Name must not contain numbers." 
                ValidationExpression="^[a-zA-Z\s]*$" 
                Display="Dynamic" 
                ForeColor="Red" />
        </td>
    </tr>
    <tr>
        <td><label for="Email">Email:</label></td>
        <td><asp:TextBox ID="Email" runat="server" CssClass="form-control" placeholder="example@example.com" />
                 <asp:RegularExpressionValidator 
                    ID="RegexValidatorEmail" 
                    runat="server" 
                    ControlToValidate="Email" 
                    ErrorMessage="Please enter a valid email address." 
                    ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$" 
                    Display="Dynamic" 
                    ForeColor="Red" />
        </td>
    </tr>
    <tr>
        <td><label for="RollNo">Roll No:</label></td>
        <td><asp:TextBox ID="RollNo" runat="server" CssClass="form-control" placeholder="Enter Your RollNo" />
                <asp:RegularExpressionValidator 
                    ID="RegexValidatorRollNo" 
                    runat="server" 
                    ControlToValidate="RollNo" 
                    ErrorMessage="Roll No must be exactly 6 digits." 
                    ValidationExpression="^\d{6}$" 
                    Display="Dynamic" 
                    ForeColor="Red" />
        </td>
    </tr>
    <tr>
        <td><label for="Department">Department:</label></td>
        <td><asp:TextBox ID="Department" runat="server" CssClass="form-control" placeholder="Enter Your Department"/>
                <asp:RegularExpressionValidator 
                  ID="RegexValidatorName" 
                  runat="server" 
                  ControlToValidate="Name" 
                  ErrorMessage="Invalid input. Please enter CS, CY, DS, or BBA." 
                  ValidationExpression="^(CS|CY|DS|BBA)$" 
                  Display="Dynamic" 
                  ForeColor="Red" />
        </td>
=======
        <td><asp:TextBox ID="Name" runat="server" CssClass="form-control" placeholder="Enter Your Name" /></td>
    </tr>
    <tr>
        <td><label for="Email">Email:</label></td>
        <td><asp:TextBox ID="Email" runat="server" CssClass="form-control" placeholder="example@example.com" /></td>
    </tr>
    <tr>
        <td><label for="RollNo">Roll No:</label></td>
        <td><asp:TextBox ID="RollNo" runat="server" CssClass="form-control" placeholder="Enter Your RollNo" /></td>
    </tr>
    <tr>
        <td><label for="Department">Department:</label></td>
        <td><asp:TextBox ID="Department" runat="server" CssClass="form-control" placeholder="Enter Your Department"/></td>
>>>>>>> 8ff5c753434ae76c7ebac7ea37317e5d9b8a1518
    </tr>
    <tr>
        <td><label for="Complain_Description">Description:</label></td>
        <td><asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="5" Width="620px" placeholder="Describe the problem your encountered..."/></td>
    </tr>

</table>
         <div class="form-group">
             <asp:Button ID="submitButton" runat="server" Text="Submit Feedback" OnClick="submitButton_Click" CssClass="btn btn-primary" />
          </div>

        </div>
    

          </div> 

          </form>
    <script src="Scripts/jquery-3.3.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>

          </div>
         
      </div>

   
     </div>


   
     </form>


   
</body>
</html>
