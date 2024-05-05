<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProvideDecision.aspx.cs" Inherits="FYPView_ProvideDecision" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <title>One Stop | FYP</title>
    <link rel="stylesheet" href="StyleSheet.css" />
    <link rel="icon" href="/Images/flex-tlogo.png" type="image/icon type" />
</head>
<body>
     <form id="form1" runat="server">
     
     <div class="body">


     <div class="header">
<<<<<<< HEAD
          <img src="/Images/OneStop-short.png"/>  x
     </div>


         <!--Navigation  Bar-->
     <div class="nav">
         <p>  <a href="Home.aspx"> Home</a> </p>
         <p>  <a href="Notifications.aspx">Notifications</a></p>
         <p>  <a href="#">Provide Decision</a></p>
     </div>
=======
          <img src="/Images/flex-logo-blue.png"/>  x
     </div>

            <div class="nav">

 
  <p>  <a href="Home.aspx"> Home</a> </p>
  <p>  <a href="Notifications.aspx">Notifications</a></p>
  <p>  <a href="ProvideDecision.aspx">Provide Decision</a></p>


</div>
>>>>>>> 8ff5c753434ae76c7ebac7ea37317e5d9b8a1518

      <div class="home">

          <div id="PersonalInformation">
     
                <div class="title">
                     <h2>Provide Decision for Degree Issuance Form</h2>
                        
<table style="margin: 0 auto;">
    <tr>
        <td style="text-align: center;">
            <div class="selectCourse">
<<<<<<< HEAD
               <h4 id="secTit">Token ID: </h4>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:projectConnectionString %>" SelectCommand="SELECT T_ID FROM DegreeToken WHERE T_STATUS IN ('Request is delivered to FYP committee')"></asp:SqlDataSource>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="T_ID" DataValueField="T_ID" CssClass="selectCourse" AutoPostBack="true" Height="16px">
=======
               <h4 id="secTit">Form ID: </h4>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:projectConnectionString %>" SelectCommand="SELECT F_ID FROM DegreeIssuanceForm WHERE D_STATUS IN ('Pending', 'Processing')"></asp:SqlDataSource>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="F_ID" DataValueField="F_ID" CssClass="selectCourse" AutoPostBack="true" Height="16px">
>>>>>>> 8ff5c753434ae76c7ebac7ea37317e5d9b8a1518
                     </asp:DropDownList>
            </div>
        </td>
    </tr>
   <tr></tr>
    <tr>
    <td style="text-align: center;">
        <div class="selectCourse">
           <h4 id="secTit">FYP Decision: </h4>
<<<<<<< HEAD
            <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="true" >
    <asp:ListItem Value="Pending">Pending</asp:ListItem>
    <asp:ListItem Value="Accepted">Accepted</asp:ListItem>
    <asp:ListItem Value="Rejected">Rejected</asp:ListItem>
</asp:DropDownList>
=======
            <select id="mySelect">
    <option value="Pending">Pending</option>
    <option value="Accepted">Accepted</option>
    <option value="Rejected">Rejected</option>
</select>
>>>>>>> 8ff5c753434ae76c7ebac7ea37317e5d9b8a1518
        </div>
        </td>
</tr>
    <tr></tr>
    <tr>
        <td style="text-align: center;">
    <div class="selectCourse">
       <h4 id="secTit">FYP Objection: </h4>
       <asp:TextBox ID="secTit" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" Width="320px" placeholder="Write objections on the form"/>
    </div>
</td>
    
</tr>
    <tr></tr>
    <tr>
        <td style="text-align: center;">
<<<<<<< HEAD
  <div class="form-group">
=======
                               <div class="form-group">
>>>>>>> 8ff5c753434ae76c7ebac7ea37317e5d9b8a1518
   <asp:Button ID="submitButton" runat="server" Text="Submit Decision" OnClick="submitButton_Click" CssClass="btn btn-primary" />
</div>
        </td>
    </tr>
</table>
                    

                      
                </div>

                <%--<div class="content2" id="cont2" runat="server">

                    <div class="gridRep">
                        <asp:GridView ID="GridView1" runat="server" CssClass="grid2"></asp:GridView>
                        <asp:GridView ID="GridView2" runat="server" CssClass="grid2"></asp:GridView>


                    </div>
                </div>--%>

                   
          </div>
         
      </div>


     </div>

   
     </form>
</body>
</html>
