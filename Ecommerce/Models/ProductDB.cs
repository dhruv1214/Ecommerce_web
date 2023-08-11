using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

[DataObject]
public class ProductDB
{
    [DataObjectMethod(DataObjectMethodType.Select)]
    public static IEnumerable GetAllCategories()
    {
        SqlConnection con = new SqlConnection(GetConnectionString());
        string sel =
            "SELECT [CategoryID], [LongName] FROM [Categories] ORDER BY [LongName]";
        SqlCommand cmd = new SqlCommand(sel, con);
        con.Open();
        SqlDataReader rdr = cmd.ExecuteReader();

        return rdr;
    }

    [DataObjectMethod(DataObjectMethodType.Select)]
    public static IEnumerable GetProductsByCatID(string catID)
    {
        SqlConnection con = new SqlConnection(GetConnectionString());
        string sel = "";
        if (string.IsNullOrEmpty(catID))
        {
            sel =
                "SELECT [ProductID], [Name], [LongDescription], [UnitPrice], [ImageFile] FROM[Products] ORDER BY[Name]";
            SqlCommand cmd = new SqlCommand(sel, con);
            con.Open();
            SqlDataReader rdr = cmd.ExecuteReader();
            return rdr;
        }



        sel = "SELECT [ProductID], [Name], [LongDescription], [UnitPrice], [ImageFile] FROM[Products] WHERE([CategoryID] = @CategoryID) ORDER BY[Name]";
        SqlCommand cmd1 = new SqlCommand(sel, con);
        cmd1.Parameters.AddWithValue("@CategoryID", catID);
        con.Open();
        SqlDataReader rdr1 = cmd1.ExecuteReader();
        return rdr1;
    }
    private static string GetConnectionString()
    {
        return ConfigurationManager.ConnectionStrings[
            "Electronics_ShowRoom"].ConnectionString;
    }
}