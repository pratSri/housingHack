using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class SearchHistory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userID"] != null)
        {
            DBConnection con = new DBConnection();
            DataTable dt = con.getSearchHistory(Session["userID"].ToString());
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }
}