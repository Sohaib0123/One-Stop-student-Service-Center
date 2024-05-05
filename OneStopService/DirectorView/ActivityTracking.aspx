<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ActivityTracking.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <title>One Stop | Director</title>
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
        <p>  <a href="Home.aspx"> Home</a> </p>
        <p>  <a href="GenerateRequest.aspx">Request generated per day</a></p>
        <p>  <a href="PendingRequest.aspx">Pending Requests</a></p>
        <p>  <a href="ProcessedRequest.aspx">Processed Requests</a></p>
        <p>  <a href="#">Activity Tracking</a></p>
=======
          <img src="/Images/flex-logo-blue.png"/>  
      </div>

      <!--Navigation Bar-->
      <div class="nav"> 
        <p>  <a href="Home.aspx"> Home</a> </p>
        <p>  <a href="#">Request generated per day</a></p>
        <p>  <a href="PendingRequest.aspx">Pending Requests</a></p>
        <p>  <a href="ProcessedRequest.aspx">Processed Requests</a></p>
        <p>  <a href="ActivityTracking.aspx">Activity Tracking</a></p>
>>>>>>> 8ff5c753434ae76c7ebac7ea37317e5d9b8a1518
      </div>

      <div class="home">

          <div id="courses">

              <div id="coursesName">
                  <h2> Activity Tracking </h2>
                    
                  <div class="Cmenu" role="menu">
                  <asp:Menu ID="Menu1" runat="server" ItemWrap="True" Orientation="Horizontal">
                          <DynamicMenuItemStyle CssClass="ParentMenu" />
    <%--<DynamicHoverStyle CssClass="ParentMenuHover" />--%>
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

          <div  id="cont3" runat="server">


          </div>

          </div> 
         
      </div>
   
     </div>
   
     </form>


   
</body>
</html>
