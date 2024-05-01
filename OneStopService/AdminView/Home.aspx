<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

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

           <div id="UniversityInformation">

                 <div class="title">
                 <h2>Personal Information</h2> 
                 </div>

                 <div class="content">
                      <%--<asp:FormView ID="FormView2" runat="server" DataSourceID="SqlDataSource2" CssClass="content" HorizontalAlign="Center" CellPadding="5" GridLines="Horizontal">--%>
                  <EditItemTemplate>
                      <p>
                          FULLNAME:
                          <asp:TextBox ID="FULLNAMETextBox" runat="server" Text='' />
                      </p>
                      <p>
                          EMAIL:
                          <asp:TextBox ID="EMAILTextBox" runat="server" Text='' />
                      </p>
                      <p>
                          Role:
                          <asp:TextBox ID="ROLETextBox" runat="server" Text='' />
                      </p>
                      <%--<asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                      &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />--%>
                  </EditItemTemplate>
                  <EditRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                 <%-- <InsertItemTemplate>
                      FULLNAME:
                      <asp:TextBox ID="FULLNAMETextBox" runat="server" Text='<%# Bind("FULLNAME") %>' />
                      <br />
                      EMAIL:
                      <asp:TextBox ID="EMAILTextBox" runat="server" Text='<%# Bind("EMAIL") %>' />
                      <br />
                      CNIC:
                      <asp:TextBox ID="CNICTextBox" runat="server" Text='<%# Bind("CNIC") %>' />
                      <br />
                      DOB:
                      <asp:TextBox ID="DOBTextBox" runat="server" Text='<%# Bind("DOB") %>' />
                      <br />
                      GENDER:
                      <asp:TextBox ID="GENDERTextBox" runat="server" Text='<%# Bind("GENDER") %>' />
                      <br />
                      PHONENO:
                      <asp:TextBox ID="PHONENOTextBox" runat="server" Text='<%# Bind("PHONENO") %>' />
                      <br />
                      <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                      &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                  </InsertItemTemplate>--%>
                          <InsertRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                 <%-- <ItemTemplate>
                      <b>Name:</b>
                      <asp:Label ID="FULLNAMELabel" runat="server" Text='<%# Bind("FULLNAME") %>' />
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>Email:</b>
                      <asp:Label ID="EMAILLabel" runat="server" Text='<%# Bind("EMAIL") %>' />
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>CNIC:</b>
                      <asp:Label ID="CNICLabel" runat="server" Text='<%# Bind("CNIC") %>' />
                      &nbsp;&nbsp;&nbsp;&nbsp;<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      <br />
                      <b>DOB:</b>
                      <asp:Label ID="DOBLabel" runat="server" Text='<%# Bind("DOB") %>' />
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Gender:</b>
                      <asp:Label ID="GENDERLabel" runat="server" Text='<%# Bind("GENDER") %>' />
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>Contact:</b>
                      <asp:Label ID="PHONENOLabel" runat="server" Text='<%# Bind("PHONENO") %>' />
                      <br />
                  </ItemTemplate>--%>
                  <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
              </asp:FormView>
                      <%--<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:projectConnectionString %>" SelectCommand="SELECT FULLNAME, EMAIL, CNIC, DOB, GENDER, PHONENO FROM USERS WHERE (EMAIL = (SELECT TOP (1) email FROM loggedInSucessfully ORDER BY loggedTime DESC))"></asp:SqlDataSource>--%>
                 </div>

           </div>

                    <%-- HOME DIV CLOSED--%>
      </div>


                    <%--BODY DIV CLOSED--%>
    </div>

     </form>
</body>
</html>
