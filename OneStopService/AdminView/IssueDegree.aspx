﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="IssueDegree.aspx.cs" Inherits="AdminView_Token" %>

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
     <p>  <a href="Token.aspx">Generate Token</a></p>
     <p>  <a href="ViewAllRequest.aspx">View All Request</a></p>
 </div>

      <div class="home">

          <div id="PersonalInformation">
     
                <div class="title">
                     <h2>Generate Token</h2>
                        

                    

                      
                </div>
              <div class="content2">
                     <table style="margin: 0 auto;">
    <tr>
        <td style="text-align: center;">
            <div class="selectCourse">
               <h4 id="secTit">Form ID: </h4>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:projectConnectionString %>" SelectCommand="SELECT F_ID FROM DegreeIssuanceForm WHERE D_STATUS IN ('Pending', 'Processing')"></asp:SqlDataSource>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="F_ID" DataValueField="F_ID" CssClass="selectCourse" AutoPostBack="true" Height="16px">
                     </asp:DropDownList>
            </div>
        </td>
    </tr>
   <tr></tr>
    <tr>
    <td style="text-align: center;">
        </div>
        </td>
</tr>
    <tr></tr>
    <tr>
        <td style="text-align: center;"></td>
    
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
