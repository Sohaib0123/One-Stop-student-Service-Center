﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Notifications.aspx.cs" Inherits="_Default" %>

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
          <img src="/Images/OneStop-short.png"/>  
      </div>

      <!--Navigation Bar-->
    <div class="nav">
        <p>  <a href="Home.aspx">Home</a> </p>
        <p>  <a href="#">Notification</a></p>
        <p>  <a href="DegreeToken.aspx">Generate Token</a></p>
        <p>  <a href="ComplaintToken.aspx">Generate Complaint Token</a></p>    
        <p>  <a href="ViewAllRequest.aspx">View All Request</a></p>
        <p>  <a href="IssueDegree.aspx">Issue Degree</a></p>
    </div>

      <div class="home">

          <div id="courses">

              <div id="coursesName">
                  <h2> Student Notifications </h2>
                    
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
