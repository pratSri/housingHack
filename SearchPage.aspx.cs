using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class SearchPage : System.Web.UI.Page
{
    DBConnection con = new DBConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userID"] != null)
        {
            if (!IsPostBack)
            {
                DataTable protype = con.getPropertyType();
                DropDownList1.DataSource = protype;
                DropDownList1.DataTextField = "Property_Type";
                DropDownList1.DataValueField = "Property_Type_id";
                DropDownList1.DataBind();
                DropDownList1.Items.Insert(0, "---Select---");

            }
        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        DBConnection con = new DBConnection();
        DataTable dt = con.getSearchResult(DropDownList1.SelectedItem.ToString(), DropDownList2.SelectedItem.ToString(),TextBox3.Text,txtMaxPrice.Text,txtMinArea.Text);
        TextBox3.Text = "";
        txtMaxPrice.Text = "";
        txtMinArea.Text = "";
            GridView1.DataSource = dt;
            GridView1.DataBind();
            //Response.Redirect("http://www.google.com");
        

    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataTable dt = con.getPropertySubType(DropDownList1.SelectedValue.ToString());
        if (dt.Rows.Count > 0)
        {
            DropDownList2.DataSource = dt;
            DropDownList2.DataTextField = "Property_Sub_Type";
            DropDownList2.DataValueField = "Propert_Sub_Type_Id";
            DropDownList2.DataBind();
        }

    }
}