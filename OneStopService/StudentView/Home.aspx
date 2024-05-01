<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <title>One Stop | Student</title>
    <link rel="stylesheet" href="StyleSheet.css" />

    <link rel="icon" href="/Images/flex-tlogo.png" type="image/icon type" />

</head>
<body>
     <form id="form1" runat="server">
     <div class="body">


      <div class="header">
          <img src="/Images/flex-logo-blue.png"/>  
      </div>

      <div class="nav">
        <p>  <a href="Home.aspx"> Home</a> </p>
        <p>  <a href="DegreeForm.aspx">Degree Issuance Form</a></p>
        <p>  <a href="ComplaintForm.aspx">Complaint Form</a></p>
        <p>  <a href="ActivityTracking.aspx">Activity Tracking</a></p>

      </div>

      <div class="home">

           <div id="PersonalInformation">

      <div class="title">
      <h2>Personal Information</h2> 
      </div>

      <div class="content2">
           <asp:FormView ID="FormView2" runat="server" DataSourceID="SqlDataSource2" CssClass="content" HorizontalAlign="Center" CellPadding="5" GridLines="Horizontal">
       <EditItemTemplate>
           FULL NAME:
           <asp:TextBox ID="FULLNAMETextBox" runat="server" Text='<%# Bind("U_NAME") %>' />
           <br />
           EMAIL:
           <asp:TextBox ID="EMAILTextBox" runat="server" Text='<%# Bind("U_EMAIL") %>' />
           <br />
           ROLE:
           <asp:TextBox ID="ROLETextBox" runat="server" Text='<%# Bind("U_ROLE") %>' />
           <br />
           <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
           &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
       </EditItemTemplate>
       <EditRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
       <InsertItemTemplate>
           FULL NAME:
           <asp:TextBox ID="FULLNAMETextBox" runat="server" Text='<%# Bind("U_NAME") %>' />
           <br />
           EMAIL:
           <asp:TextBox ID="EMAILTextBox" runat="server" Text='<%# Bind("U_EMAIL") %>' />
           <br />
           ROLE:
           <asp:TextBox ID="ROLETextBox" runat="server" Text='<%# Bind("U_ROLE") %>' />
           <br />
           <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
           &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
       </InsertItemTemplate>
               <InsertRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
       <ItemTemplate>
           <b>Name:</b>
           <asp:Label ID="FULLNAMELabel" runat="server" Text='<%# Bind("U_NAME") %>' />
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>Email:</b>
           <asp:Label ID="EMAILLabel" runat="server" Text='<%# Bind("U_EMAIL") %>' />
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>ROLE:</b>
           <asp:Label ID="ROLELabel" runat="server" Text='<%# Bind("U_ROLE") %>' />
           &nbsp;&nbsp;&nbsp;&nbsp;<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <br />
       </ItemTemplate>
       <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
   </asp:FormView>
           <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:projectConnectionString %>" SelectCommand="SELECT U_NAME, U_EMAIL, U_ROLE FROM USERS WHERE (U_EMAIL = (SELECT TOP (1) email FROM loggedInSucessfully ORDER BY loggedTime DESC))"></asp:SqlDataSource>
      </div>

</div>

                    <%-- HOME DIV CLOSED--%>
      </div>


                    <%--BODY DIV CLOSED--%>
    </div>

     </form>
</body>
</html>
