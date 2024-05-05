<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ComplaintToken.aspx.cs" Inherits="AdminView_Token" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <title>One Stop | Admin</title>
    <link rel="stylesheet" href="StyleSheet.css" />
    <link rel="icon" href="/Images/flex-tlogo.png" type="image/icon type" />
</head>
<body>
     <form id="form1" runat="server">
     
     <div class="body">


     <div class="header">
<<<<<<< HEAD
          <img src="/Images/OneStop-short.png"/>  
     </div>

     <!--Navigation Bar-->
    <div class="nav">
        <p>  <a href="Home.aspx">Home</a> </p>
        <p>  <a href="Notifications.aspx">Notification</a></p>
        <p>  <a href="DegreeToken.aspx">Generate Token</a></p>
        <p>  <a href="#">Generate Complaint Token</a></p>    
        <p>  <a href="ViewAllRequest.aspx">View All Request</a></p>
        <p>  <a href="IssueDegree.aspx">Issue Degree</a></p>
    </div>
=======
          <img src="/Images/flex-logo-blue.png"/>  
     </div>

     <!--Navigation Bar-->
 <div class="nav">
    <p>  <a href="Home.aspx">Home</a> </p>
    <p>  <a href="Notifications.aspx">Notification</a></p>
    <p>  <a href="DegreeToken.aspx">Generate Degree Token</a></p>
    <p>  <a href="ComplaintToken.aspx">Generate Complaint Token</a></p>
    <p>  <a href="ViewAllRequest.aspx">View All Request</a></p>
</div>
>>>>>>> 8ff5c753434ae76c7ebac7ea37317e5d9b8a1518

      <div class="home">

          <div id="PersonalInformation">
     
                <div class="title">
                     <h2>Generate Complaint Token</h2>                                          
                </div>
              <div class="content2">
                     <table style="margin: 0 auto;">
    <tr>
        <td style="text-align: center;">
            <div class="selectCourse">
               <h4 id="secTit">Complaint Form ID: </h4>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:projectConnectionString %>" SelectCommand="SELECT C_ID FROM ComplaintForm WHERE C_STATUS = 'Pending'"></asp:SqlDataSource>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="C_ID" DataValueField="C_ID" CssClass="selectCourse" AutoPostBack="true" Height="16px">
                     </asp:DropDownList>
            </div>
        </td>
    </tr>
   <tr></tr>
    <tr>
    <td style="text-align: center;">
        <div class="selectCourse">
        <h4 id="secTit">Complaint Status: </h4>
<<<<<<< HEAD
        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="true" >
=======
        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="true" OnSelectedIndexChanged="submitButton_Click">
>>>>>>> 8ff5c753434ae76c7ebac7ea37317e5d9b8a1518
            <asp:ListItem Value="Pending">Pending</asp:ListItem>
            <asp:ListItem Value="Accepted">Accepted</asp:ListItem>
            <asp:ListItem Value="Rejected">Rejected</asp:ListItem>
        </asp:DropDownList>
    </div>
        </td>
</tr>
    <tr></tr>
    <tr>
        <td style="text-align: center;">
            <div class="selectCourse">
                <h4 id="secTit">Feedback: </h4>
<<<<<<< HEAD
                <asp:TextBox ID="Feedback" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" Width="320px" placeholder="Write feedback on the form"/>
=======
                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" Width="320px" placeholder="Write feedback on the form"/>
>>>>>>> 8ff5c753434ae76c7ebac7ea37317e5d9b8a1518
            </div>
        </td>
    </tr>
    <tr></tr>
    <tr>
        <td style="text-align: center;">
                               <div class="form-group">
   <asp:Button ID="submitButton" runat="server" Text="Generate Token" OnClick="submitButton_Click" CssClass="btn btn-primary" />
</div>
        </td>
    </tr>
</table>
              </div>


             
          </div>       
      </div>
     </div>

   
     </form>
</body>
</html>
