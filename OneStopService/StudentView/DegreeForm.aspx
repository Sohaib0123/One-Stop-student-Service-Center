<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DegreeForm.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <title>One Stop | Student</title>
    <link rel="stylesheet" href="StyleSheet.css" />
    <link rel="icon" href="/Images/flex-tlogo.png" type="image/icon type" />
        <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/Site.css" rel="stylesheet" />
    <style type="text/css">
        .form-control {}
    </style>

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
        <p>  <a href="#">Degree Issuance Form</a></p>
        <p>  <a href="ComplaintForm.aspx">Complaint Form</a></p>
        <p>  <a href="ActivityTracking.aspx">Activity Tracking</a></p>
        <p>  <a href="ReceiveDegree.aspx">Receive Degree</a></p>
    </div>
      <div class="home" id="fbhome">

          <div id="courses">

              <div id="coursesName">
                  <h2> Degree Issuance Form </h2>
                   
              </div>

          <div class="content3">

          <div class="container">
           <table class="form-table">
    <tr>
        <td><label for="Name">Name of applicant:</label></td>
        <td><asp:TextBox ID="Name" runat="server" CssClass="form-control" />
               <asp:RegularExpressionValidator 
                ID="RegularExpressionValidator1" 
                runat="server" 
                ControlToValidate="Name" 
                ErrorMessage="Name must not contain numbers." 
                ValidationExpression="^[a-zA-Z\s]*$" 
                Display="Dynamic" 
                ForeColor="Red" />
        </td>
    </tr>
    <tr>
        <td><label for="Address">Address:</label></td>
        <td><asp:TextBox ID="Address" runat="server" CssClass="form-control" /></td>
    </tr>
    <tr>
        <td><label for="Email">Email:</label></td>
        <td><asp:TextBox ID="Email" runat="server" CssClass="form-control" />
            <asp:RegularExpressionValidator 
                    ID="RegexValidatorEmail" 
                    runat="server" 
                    ControlToValidate="Email" 
                    ErrorMessage="Please enter a valid email address." 
                    ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$" 
                    Display="Dynamic" 
                    ForeColor="Red" />
        </td>
    </tr>
    <tr>
        <td><label for="CNIC">CNIC:</label></td>
        <td><asp:TextBox ID="CNIC" runat="server" CssClass="form-control" />
            <asp:RegularExpressionValidator 
                    ID="RegexValidatorCNIC" 
                    runat="server" 
                    ControlToValidate="CNIC" 
                    ErrorMessage="CNIC must be numeric." 
                    ValidationExpression="^\d+$" 
                    Display="Dynamic" 
                    ForeColor="Red" />
        </td>
    </tr>
    <tr>
        <td><label for="RollNo">Roll No:</label></td>
        <td><asp:TextBox ID="RollNo" runat="server" CssClass="form-control" />
            <asp:RegularExpressionValidator 
                    ID="RegexValidatorRollNo" 
                    runat="server" 
                    ControlToValidate="RollNo" 
                    ErrorMessage="Roll No must be exactly 6 digits." 
                    ValidationExpression="^\d{6}$" 
                    Display="Dynamic" 
                    ForeColor="Red" />
        </td>
    </tr>
    <tr>
        <td><label for="Contact">Contact No:</label></td>
        <td><asp:TextBox ID="Contact" runat="server" CssClass="form-control" />
              <asp:RegularExpressionValidator 
                ID="RegexValidatorContact" 
                runat="server" 
                ControlToValidate="Contact" 
                ErrorMessage="Contact No must be exactly 11 digits." 
                ValidationExpression="^\d{11}$" 
                Display="Dynamic" 
                ForeColor="Red" />
        </td>
    </tr>
</table>
              <!--For UnderGraduation Students-->

            <div class="form-group">
                <br />
                <h3>For Undergratuate Students</h3>    
            </div>

              <!---->
        <table class="form-table">
    <tr>
        <td><label for="Degree">Degree:</label></td>
        <td>
            <asp:TextBox ID="Degree" runat="server" CssClass="form-control" />
            <asp:RegularExpressionValidator 
                  ID="RegexValidatorName" 
                  runat="server" 
                  ControlToValidate="Name" 
                  ErrorMessage="Invalid input. Please enter CS, CY, DS, or BBA." 
                  ValidationExpression="^(CS|CY|DS|BBA)$" 
                  Display="Dynamic" 
                  ForeColor="Red" />

        </td>
    </tr>
    <tr>
        <td><label for="Faculty">Faculty:</label></td>
        <td><asp:TextBox ID="Faculty" runat="server" CssClass="form-control" /></td>
    </tr>
    <tr>
        <td><label for="YOP">Year of Passing:</label></td>
        <td><asp:TextBox ID="YOP" runat="server" CssClass="form-control" /></td>
    </tr>
    <tr>
        <td><label for="CGPA">CGPA:</label></td>
        <td><asp:TextBox ID="CGPA" runat="server" CssClass="form-control" />
              <asp:RangeValidator 
                ID="RangeValidatorCGPA" 
                runat="server" 
                ControlToValidate="CGPA" 
                MinimumValue="2.0" 
                MaximumValue="4.0" 
                Type="Double"
                ErrorMessage="CGPA must be between 2.0 and 4.0." 
                Display="Dynamic" 
                ForeColor="Red" />
        </td>
    </tr>
</table>


              <!--Check Box-->
            <div class="form-group">
                <br />
                <p id="declare">I solemnly declare that the facts mentioned in the form are correct.<asp:CheckBox ID="MyCheckBox" runat="server" Text=""/>
                    <asp:CustomValidator
                        ID="CustomValidatorDeclaration"
                        runat="server"
                        ErrorMessage="You must declare that the information is correct by checking the box."
                        ForeColor="Red"
                        ClientValidationFunction="validateDeclaration"
                        OnServerValidate="CustomValidatorDeclaration_ServerValidate" />
                </p>
                <br />
            </div>


            <div class="form-group">
               <asp:Button ID="submitButton" runat="server" Text="Submit Feedback" CausesValidation="true" OnClick="submitButton_Click" CssClass="btn btn-primary" />
            </div>
        </div>
    

          </div> 

          </form>
    <script src="Scripts/jquery-3.3.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script type="text/javascript">
    function validateDeclaration(sender, args) {
        args.IsValid = document.getElementById('<%= MyCheckBox.ClientID %>').checked;
    }
    </script>


          </div>
         
      </div>
   
     </div>


   
     </form>


   
</body>
</html>
