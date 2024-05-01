<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SignUp.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>One Stop Degree Issuance</title>
    <link rel="stylesheet" type="text/css" href="StyleSheet.css" />
    <link rel="icon" href="/Images/flex-tlogo.png" type="image/icon type" />

</head>
<body class="BgBody">

    <div id="logo">

        <img src="/Images/Flex-Login-3-removebg-preview.png" alt="Alternate Text" />

    </div>

     <div id="Form">

        <div id="SubForm">
            <!-- Form -->
            <h2 id="SignUpForm">Sign Up</h2>

            <form  id="form1" runat="server" method="post">

                <label>Name </label>
                <input type="text" name="Name"  required id="nameInput" runat="server"/>

                <br />
                
                <label>Email </label>
                <input type="text" name="Email" placeholder="example@example.com" required />
                           
                <br />
            
                
                <label> Password </label>
                <br />
                <input type="password" name="Password" maxlength="12" required id="passInput" runat="server" />
                
                <br />

                <label>Role</label>
                <br />
                <select id="role" name="Role">
                    <option>Admin</option>
                    <option>Director</option>
                    <option>FYP</option>
                    <option>Finance</option>
                    <option>Student</option>

                </select>
               
                <asp:Button ID="Button1" runat="server" Text="Register" OnClick="Button1_Click" />
                &nbsp;</form>
        </div>

            <p>Already have account? <a href="Login.aspx">Login</a> </p> 

    </div>



</body>
</html>
