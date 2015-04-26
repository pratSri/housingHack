using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;


/// <summary>
/// Summary description for DBConnection
/// </summary>
public class DBConnection
{
    SqlConnection con;
	public DBConnection()
	{
        con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conStr"].ConnectionString);

		//
		// TODO: Add constructor logic here
		//
	}

    public DataTable getSearchResult(String Type, String Subtype, String Locality,String minArea, String maxPrice)
    {
        DataTable dt = new DataTable();
        string str = "Select Property_id, (LEFT(Description,40)+'...') as Description ,Locality,(Rate * Area) as Price, Longitude, Latitude, createdDTTM from Property_info where InSold = '1' and isDeleted = '0' and Type ='" + Type + "' and SubType='" + Subtype + "'";
        if(Locality != "")
        {
            str += " and locality = '" + Locality + "'";
        }
        if (minArea != "")
        {
            str += " and area > '" + minArea + "'";
        }
        if (maxPrice != "")
        {
            str += " and (Rate * Area)  < '" + maxPrice + "' ";
        }
        str += " order by createdDttm asc";
        SqlDataAdapter da = new SqlDataAdapter(str, con);
        da.Fill(dt);

        return dt;
    }

    public DataTable getPropertyDetail(String propertyID)
    {
        DataTable dt = new DataTable();
        string str1 = "insert into Search_History values ('1','" + propertyID + "'); Update property_info set NoOfView = NoOfView + 1 where property_id = '" + propertyID + "';";
        string str2 = " Select Property_id,NoOfPrsnInterest,NoOfView, CreatedDTTM, description, Locality, (Rate * Area) as Price, isParking,Type,subType,Area,rate,sellingBy,facility,ownerID from property_info where property_id ='" + propertyID + "'";
        string str = str1 + str2;
        //OwnerID,OwnerName,location
        SqlDataAdapter da = new SqlDataAdapter(str, con);
        da.Fill(dt);
        return dt;
    }

    public DataTable getPropertyType()
    {
        DataTable dt = new DataTable();
        string str = "Select * from Property_Type";
        SqlDataAdapter da = new SqlDataAdapter(str, con);
        da.Fill(dt);
        return dt;
    }

    public DataTable getPropertySubType(String propertyID)
    {
        DataTable dt = new DataTable();
        string str = "Select * from Property_SubType where property_id = '" + propertyID + "'";
        SqlDataAdapter da = new SqlDataAdapter(str, con);
        da.Fill(dt);
        return dt;
    }

    public DataTable getOwnerDetail(string ownerId, string propertyID)
    {
        DataTable dt = new DataTable();
        string str1 = "Update property_info set NoOfPrsnInterest = NoOfPrsnInterest + 1 where property_id = '" + propertyID + "' ;";
        string str2 =  "Select * from Owner_Detail where owner_id = '" + ownerId + "'";
        string str = str1 + str2;
        SqlDataAdapter da = new SqlDataAdapter(str, con);
        da.Fill(dt);
        return dt;
    }

    public int getOwnerPropertyCount(string ownerID)
    {
        DataTable dt = new DataTable();
        string str = "Select count(*) from property_Info where ownerid ='" + ownerID + "'";
        SqlDataAdapter da = new SqlDataAdapter(str, con);
        da.Fill(dt);
        return Convert.ToInt32( dt.Rows[0][0].ToString());
    }

    public DataTable getSearchHistoryForAdmin(string userID)
    {
        DataTable dt = new DataTable();
        string str = "Select * from Search_History where User_Id = '" + userID + "'";
        SqlDataAdapter da = new SqlDataAdapter(str, con);
        da.Fill(dt);
        return dt;
    }

    public string userLogin(string userName, string password)
    {
        string id = "";
        DataTable dt = new DataTable();
        string str = "Select * from customer_info where user_name = '"+userName+"' and user_password = '"+password +"'";
        SqlDataAdapter da = new SqlDataAdapter(str, con);
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            id = dt.Rows[0][0].ToString();
        }
        return id;
    }

    public DataTable getArchType()
    {
        DataTable dt = new DataTable();
        return dt;
    }

    public DataTable getSearchHistory(string userID)
    {
        DataTable dt = new DataTable();
        string str = "Select distinct (pi.Property_id), (LEFT(Description,40)+'...') as Description ,Locality,(Rate * Area) as Price, Locality, createdDTTM from Property_info pi inner join Search_History sh on pi.property_id = sh.property_id  where isDeleted = '0' and sh.user_id = '"+userID +"'";
        SqlDataAdapter da = new SqlDataAdapter(str, con);
        da.Fill(dt);
        return dt;
    }
}