using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class SearchDetail : System.Web.UI.Page
{
    DBConnection con = new DBConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["Id"] != null)
            {
                
                DataTable dt = con.getPropertyDetail(Request.QueryString["Id"].ToString());
                DetailsView1.DataSource = dt;
                DetailsView1.DataBind();
                
            }
        }
        
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        
        DetailsViewRow dr = DetailsView1.Rows[0];
        HiddenField hf = dr.FindControl("HiddenField1") as HiddenField;
        DataTable dt = con.getOwnerDetail(hf.Value, Request.QueryString["Id"].ToString());
        (DetailsView1.Rows[0].FindControl("Label11") as Label).Text = "Name :           " + dt.Rows[0][1].ToString();
        (DetailsView1.Rows[0].FindControl("Label12") as Label).Text = "Phone Number :   " + dt.Rows[0][2].ToString();
        (DetailsView1.Rows[0].FindControl("Label13") as Label).Text = "Email ID :       " + dt.Rows[0][3].ToString();
        int propertyCount = con.getOwnerPropertyCount(dt.Rows[0][0].ToString());
        if(propertyCount > 1)
        {
            (DetailsView1.Rows[0].FindControl("Label11") as Label).ForeColor = System.Drawing.Color.Red;
            (DetailsView1.Rows[0].FindControl("Label12") as Label).ForeColor = System.Drawing.Color.Red;
                (DetailsView1.Rows[0].FindControl("Label13") as Label).ForeColor = System.Drawing.Color.Red;
        }

    }
}