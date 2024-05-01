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
        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="true" OnSelectedIndexChanged="submitButton_Click">
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
                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" Width="320px" placeholder="Write feedback on the form"/>
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
