using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CMS
{
    public partial class CMSModify : System.Web.UI.Page
    {
        public string table, actionType, recordId;
        public string defHeading, defTitle, defName, defImagePath, defDescription, defButtonText;

        protected void Page_Load (object sender, EventArgs e)
        {
            if (Request.RequestType == "GET")
            {
                actionType = Request.QueryString.Get("ActionType");
                table = Request.QueryString.Get("table");
                recordId = Request.QueryString.Get("id");

                if (!(table == "PageLinks" || table == "Specials" || table == "Products"))
                {
                    Response.Redirect("CMS", true);
                }

                defHeading = defTitle = defName = defImagePath = defDescription = defButtonText = "";
                if (actionType == "Edit")
                {
                    FillForm(table, recordId);
                }
            }

            if (Request.RequestType == "POST")
            {
                table = Request.Form["Table"];
                actionType = Request.Form["ActionType"];
                recordId = Request.Form["Id"];

                // TODO: Sanitise RecordID
                if (actionType.Equals("Create"))
                {
                    CreateRecord(table);
                }
                else if (actionType.Equals("Edit"))
                {
                    UpdateRecord(table, recordId);
                }
                Response.Redirect("CMS", true);
            }
        }

        private void CreateRecord (string _table)
        {
            string queryString;
            if (_table == "PageLinks")
            {
                queryString = ($"INSERT INTO mainElements (Heading, ImagePath, Description, ButtonText) VALUES (@heading, @imagepath, @description, @buttontext);");
            }
            else if (_table == "Specials")
            {
                queryString = ($"INSERT INTO specialOffers (Title, Description, ImagePath) VALUES (@title, @description, @imagepath);");
            }
            else if (_table == "Products")
            {
                queryString = ($"INSERT INTO productCategories (Name, ImagePath) VALUES (@name, @imagepath);");
            }
            else { return; }

            string constr = ConfigurationManager.ConnectionStrings["CMSTest"].ConnectionString;
            using (SqlConnection sqlcon = new SqlConnection(constr))
            {
                using (SqlCommand sqlcmd = new SqlCommand(queryString, sqlcon))
                {
                    sqlcon.Open();
                    sqlcmd.Parameters.AddWithValue("@imagepath", Request.Form["ImagePath"]);
                    if (_table == "PageLinks")
                    {
                        sqlcmd.Parameters.AddWithValue("@heading", Request.Form["Heading"]);
                        sqlcmd.Parameters.AddWithValue("@description", Request.Form["Description"]);
                        sqlcmd.Parameters.AddWithValue("@buttonText", Request.Form["ButtonText"]);
                    }
                    else if (_table == "Specials")
                    {
                        sqlcmd.Parameters.AddWithValue("@title", Request.Form["Title"]);
                        sqlcmd.Parameters.AddWithValue("@description", Request.Form["Description"]);
                    }
                    else if (_table == "Products")
                    {
                        sqlcmd.Parameters.AddWithValue("@name", Request.Form["Name"]);
                    }
                    sqlcmd.ExecuteNonQuery();
                }
            }
        }

        //TODO: Combine Update and Create via using SQL Merge Syntax
        //TODO: Build out Dedicated SQL Class
        private void UpdateRecord (string _table, string _recordID)
        {
            string queryString;
            if (_table == "PageLinks")
            {
                queryString = ("UPDATE mainElements SET Heading = @heading, ImagePath = @imagePath, Description = @description, ButtonText = @buttontext WHERE ID=@id;");
            }
            else if (_table == "Specials")
            {
                queryString = ("UPDATE specialOffers SET Title = @title, Description = @description, ImagePath = @imagePath WHERE ID=@id;");
            }
            else if (_table == "Products")
            {
                queryString = ("UPDATE productCategories SET Name = @name, ImagePath = @imagepath WHERE ID=@id;");
            }
            else { return; }

            // TODO: Remove Hardcoded validation throughout project - develop filter lists via SQL class
            string constr = ConfigurationManager.ConnectionStrings["CMSTest"].ConnectionString;
            using (SqlConnection sqlcon = new SqlConnection(constr))
            {
                using (SqlCommand sqlcmd = new SqlCommand(queryString, sqlcon))
                {
                    sqlcon.Open();
                    sqlcmd.Parameters.AddWithValue("@id", _recordID);
                    sqlcmd.Parameters.AddWithValue("@imagepath", Request.Form["ImagePath"]);
                    if (_table == "PageLinks")
                    {
                        sqlcmd.Parameters.AddWithValue("@heading", Request.Form["Heading"]);
                        sqlcmd.Parameters.AddWithValue("@description", Request.Form["Description"]);
                        sqlcmd.Parameters.AddWithValue("@buttonText", Request.Form["ButtonText"]);
                    }
                    else if (_table == "Specials")
                    {
                        sqlcmd.Parameters.AddWithValue("@title", Request.Form["Title"]);
                        sqlcmd.Parameters.AddWithValue("@description", Request.Form["Description"]);
                    }
                    else if (_table == "Products")
                    {
                        sqlcmd.Parameters.AddWithValue("@name", Request.Form["Name"]);
                    }
                    sqlcmd.ExecuteNonQuery();
                }
            }
        }

        private void FillForm (string _table, string _recordID)
        {
            string queryString;
            if (_table == "PageLinks")
            {
                queryString = ($"SELECT * FROM mainElements WHERE ID=@id;");
            }
            else if (_table == "Specials")
            {
                queryString = ($"SELECT * FROM specialOffers WHERE ID=@id;");
            }
            else if (_table == "Products")
            {
                queryString = ($"SELECT * FROM productCategories WHERE ID=@id;");
            }
            else { return; }

            string constr = ConfigurationManager.ConnectionStrings["CMSTest"].ConnectionString;
            using (SqlConnection sqlcon = new SqlConnection(constr))
            {
                using (SqlCommand sqlcmd = new SqlCommand(queryString, sqlcon))
                {
                    sqlcmd.Parameters.AddWithValue("@id", _recordID);
                    sqlcon.Open();
                    using (SqlDataReader sqlDR = sqlcmd.ExecuteReader())
                    {
                        while (sqlDR.Read())
                        {
                            defImagePath = sqlDR["ImagePath"].ToString();
                            if (_table == "PageLinks")
                            {
                                defHeading = sqlDR["Heading"].ToString();
                                defDescription = sqlDR["Description"].ToString();
                                defButtonText = sqlDR["ButtonText"].ToString();
                            }
                            else if (_table == "Specials")
                            {
                                defTitle = sqlDR["Title"].ToString();
                                defDescription = sqlDR["Description"].ToString();
                            }
                            else if (_table == "Products")
                            {
                                defName = sqlDR["Name"].ToString();
                            }
                        }
                    }
                }
            }
        }
    }
}