<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProvideDecision.aspx.cs" Inherits="FYPView_ProvideDecision" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <title>One Stop | Finance</title>
    <link rel="stylesheet" href="StyleSheet.css" />
    <link rel="icon" href="/Images/flex-tlogo.png" type="image/icon type" />
</head>
<body>
     <form id="form1" runat="server">
     
     <div class="body">


     <div class="header">
          <img src="/Images/OneStop-short.png"/>  
     </div>

      <!--Navigation Bar-->  
      <div class="nav">    
        <p>  <a href="Home.aspx"> Home</a> </p>
        <p>  <a href="Notifications.aspx">Notifications</a></p>
        <p>  <a href="#">Provide Decision</a></p>
        <p>  <a href="VerifyPayment.aspx">Verify Payment</a></p>
      </div>

      <div class="home">

          <div id="PersonalInformation">
     
                <div class="title">
                     <h2>Provide Decision for Degree Issuance Form</h2>
                        
<table style="margin: 0 auto;">
    <tr>
        <td style="text-align: center;">
            <div class="selectCourse">
               <h4 id="secTit">Form ID: </h4>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:projectConnectionString %>" SelectCommand="SELECT T_ID FROM DegreeToken WHERE T_STATUS IN ('Request is delivered to Finance')"></asp:SqlDataSource>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="T_ID" DataValueField="T_ID" CssClass="selectCourse" AutoPostBack="true" Height="16px">
                     </asp:DropDownList>
            </div>
        </td>
    </tr>
   <tr></tr>
    <tr>
    <td style="text-align: center;">
        <div class="selectCourse">
           <h4 id="secTit">Finance Decision: </h4>
            <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="true" >
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
       <h4 id="secTit">Finance Department Objection: </h4>
       <asp:TextBox ID="secTit" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" Width="320px" placeholder="Write objections on the form"/>
    </div>
</td>
    
</tr>
    <tr></tr>
    <tr>
        <td style="text-align: center;">
                               <div class="form-group">
   <asp:Button ID="submitButton" runat="server" Text="Submit Decision" OnClick="submitButton_Click" CssClass="btn btn-primary" />
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
