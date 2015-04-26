<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <form id="form1" runat="server">
  <section class="container" >
    <div class="login">
      <h1>Login to Housing hackerRank</h1>
      
        <p><input id ="txtLoginID" type="text" name="login" value="" placeholder="Username or Email" runat="server" /></p>
        <p><input id="txtPswd" type="password" name="password" value="" placeholder="Password" runat="server" /></p>
        <p class="remember_me">
          <label>
            
            
          </label>
        </p>
        <p class="submit">
    <asp:Button ID="Button1" runat="server" Text="Login" name="commit" OnClick="Button1_Click" /></p>
      
    </div>

    <div class="login-help">
      
    </div>
  </section>

  <%--<section class="about">
    <p class="about-links">
      <a href="http://www.cssflow.com/snippets/login-form" target="_parent">View Article</a>
      <a href="http://www.cssflow.com/snippets/login-form.zip" target="_parent">Download</a>
    </p>
    <p class="about-author">
      &copy; 2012&ndash;2013 <a href="http://thibaut.me" target="_blank">Thibaut Courouble</a> -
      <a href="http://www.cssflow.com/mit-license" target="_blank">MIT License</a><br>
      Original PSD by <a href="http://www.premiumpixels.com/freebies/clean-simple-login-form-psd/" target="_blank">Orman Clark</a>
  </section>--%>
</form>
</body>
</html>
