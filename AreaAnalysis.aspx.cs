using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Xml.Linq;

public partial class AreaAnalysis : System.Web.UI.Page
{
    static string baseUri = "http://maps.googleapis.com/maps/api/geocode/xml?latlng={0},{1}&sensor=false";
    string location = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userID"] != null)
        {
            if (!IsPostBack)
            {

                if (Request.QueryString["locality"] != null)
                {
                    Label1.Text = Request.QueryString["locality"].ToString();
                }
                else
                {
                    Label1.Text = "";
                    lblBanks.Text = "";
                    lblHospital.Text = "";
                    lblSchools.Text = "";
                }
            }
        }
        else
        {
            Response.Redirect("Login.aspx");
        }
        //RetrieveFormatedAddress("12.9200", "77.6100");
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Label1.Text = TextBox3.Text;
        Button1.Attributes.Add("onclick", "return checkLocality('" + TextBox3.Text +"') ");
    }

    //Reverse Gecoding
    public void RetrieveFormatedAddress(string lat, string lng)
    {
        string requestUri = string.Format(baseUri, lat, lng);

        using (WebClient wc = new WebClient())
        {
            string result = wc.DownloadString(requestUri);
            var xmlElm = XElement.Parse(result);
            Button1.Text = xmlElm.Descendants().Count().ToString();
            //var status = (from elm in xmlElm.Descendants() where elm.Name == "status" select elm).FirstOrDefault();
            //if (status.Value.ToLower() == "ok")
            //{
            //    var res = (from elm in xmlElm.Descendants() where elm.Name == "formatted_address" select elm).FirstOrDefault();
            //    requestUri = res.Value;
            //}
        }
    }
}