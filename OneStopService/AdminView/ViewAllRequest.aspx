<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewAllRequest.aspx.cs" Inherits="AdminView_ViewAllRequest" %>
    
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
=======
          <img src="/Images/flex-logo-blue.png"/>  
>>>>>>> 8ff5c753434ae76c7ebac7ea37317e5d9b8a1518
      </div>

     <!--Navigation Bar-->
    <div class="nav">
<<<<<<< HEAD
        <p>  <a href="Home.aspx">Home</a> </p>
        <p>  <a href="Notifications.aspx">Notification</a></p>
        <p>  <a href="DegreeToken.aspx">Generate Token</a></p>
        <p>  <a href="ComplaintToken.aspx">Generate Complaint Token</a></p>    
        <p>  <a href="#">View All Request</a></p>
        <p>  <a href="IssueDegree.aspx">Issue Degree</a></p>
    </div>

=======
    <p>  <a href="Home.aspx">Home</a> </p>
    <p>  <a href="Notifications.aspx">Notification</a></p>
    <p>  <a href="DegreeToken.aspx">Generate Degree Token</a></p>
    <p>  <a href="ComplaintToken.aspx">Generate Complaint Token</a></p>
    <p>  <a href="ViewAllRequest.aspx">View All Request</a></p>
</div>
>>>>>>> 8ff5c753434ae76c7ebac7ea37317e5d9b8a1518

      <div class="home">

          <div id="courses">

              <div id="coursesName">
                  <h2> Requests </h2>
                  <div class="Cmenu" role="menu">
                  <asp:Menu ID="Menu1" runat="server" ItemWrap="True" Orientation="Horizontal">
                          <DynamicMenuItemStyle CssClass="ParentMenu" />
    <DynamicMenuStyle CssClass="ParentMenu" />
                       <DynamicItemTemplate>
                           <%# Eval("Text") %>
                       </DynamicItemTemplate>
                       <LevelMenuItemStyles>  
                            <asp:MenuItemStyle CssClass="ParentMenu" />       
                       </LevelMenuItemStyles>
                  </asp:Menu>
                      <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
                  </div>

              </div>

              <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>

          <!-- Forms -->
              <div  id="cont4" runat="server">
                <h3>Degree Form</h3>
                <br>
              </div>
              <div  id="cont3" runat="server">
                <h3>Complaint  Form</h3>
                <br>
              </div>

          </div>          

      </div>   
   
     </form>


   
</body>
</html>
