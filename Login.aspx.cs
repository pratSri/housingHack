using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        DBConnection con = new DBConnection();
        string userID = con.userLogin(txtLoginID.Value, txtPswd.Value);
        if (userID != "")
        {
            Session["userID"] = userID;
            Response.Redirect("SearchHistory.aspx");
        }

    }
}