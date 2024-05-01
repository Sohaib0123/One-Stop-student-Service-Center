 <%@ Page Language="C#" AutoEventWireup="true" CodeFile="GenerateRequest.aspx.cs" Inherits="_Default" %>


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
        <p>  <a href="Home.aspx"> Home</a> </p>
        <p>  <a href="#">Request generated per day</a></p>
        <p>  <a href="PendingRequest.aspx">Pending Requests</a></p>
        <p>  <a href="ProcessedRequest.aspx">Processed Requests</a></p>
        <p>  <a href="ActivityTracking.aspx">Activity Tracking</a></p>
      </div>

      <div class="home">

          <div id="PersonalInformation">
     
                <div class="title">
                     <h2>View Request per day</h2>                                                      
                </div>
               

                <div class="content2" id="cont2" runat="server">
                     
               <table style="margin: 0 auto;">
                    <tr>
                        <td style="text-align: center;">
                            <div class="selectCourse">
                                <h4 id="secTit">Select Date: </h4>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:projectConnectionString %>" SelectCommand="SELECT CONVERT(VARCHAR(10), D_SUBMISSION, 120) AS D_SUBMISSION FROM DegreeIssuanceForm"></asp:SqlDataSource>
                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="D_SUBMISSION" DataValueField="D_SUBMISSION" CssClass="selectCourse" AutoPostBack="true">
                                </asp:DropDownList>
                            </div>
                        </td>
                    </tr>
                    <tr></tr>
                    <tr>
                        <td style="text-align: center;">
                        </td>
                    </tr>
                    <tr></tr>
                    <tr>
                        <td style="text-align: center;">
                        </td>
                    </tr>
                    <tr></tr>
                    <tr>
                        <td style="text-align: center;">
                               <div class="form-group">
                                    <asp:Button ID="submitButton" runat="server" Text="Generate Data" OnClick="GenerateButton_Click" CssClass="btn btn-primary" />
                                </div>
                        </td>
                     </tr>
                </table>
                    

                    <div class="gridRep">
                        <asp:GridView ID="GridView1" runat="server" CssClass="grid2"></asp:GridView>
                        <%--<asp:GridView ID="GridView2" runat="server" CssClass="grid2"></asp:GridView>--%>


                    </div>
                </div>

                   
          </div>
         
      </div>


     </div>

   
     </form>
</body>
</html>
