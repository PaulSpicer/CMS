using System;
using System.Collections.Specialized;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace CMS
{
    public partial class _CMS : Page
    {
        protected void Page_Load (object sender, EventArgs e)
        {
            if (Request.RequestType == "POST")
            {
                if (Request.Form.HasKeys())
                {
                    if (Request.Form["PostType"].Equals("Delete"))
                    {
                        DeleteRecord(Request.Form["Table"], Request.Form["Record"]);
                    }
                }
                Response.Redirect(Request.FilePath, true);
            }

            if (Request.RequestType == "GET")
            {
                PopulateCMS();
            }
        }

        private void DeleteRecord (string table, string recordID)
        {
            // Verify only a valid table name sent in POST as table names cannot be passed via SQL parameters
            if (!(table == "PageLinks" || table == "Specials" || table == "Products"))
            {
                return;
            }

            if (table == "PageLinks") { table = "mainElements"; }
            if (table == "Specials") { table = "specialOffers"; }
            if (table == "Products") { table = "productCategories"; }

            //TODO: User Authentication
            string queryString = ($"DELETE FROM {table} WHERE ID = @recordID;");
            string constr = ConfigurationManager.ConnectionStrings["CMSTest"].ConnectionString;
            using (SqlConnection sqlcon = new SqlConnection(constr))
            {
                using (SqlCommand sqlcmd = new SqlCommand(queryString, sqlcon))
                {
                    sqlcon.Open();
                    sqlcmd.Parameters.AddWithValue("@recordID", recordID);
                    sqlcmd.ExecuteNonQuery();
                }
            }
        }

        private void PopulateCMS ()
        {
            string constr = ConfigurationManager.ConnectionStrings["CMSTest"].ConnectionString;
            using (SqlConnection sqlcon = new SqlConnection(constr))
            {
                using (SqlCommand sqlcmd = new SqlCommand("SELECT * FROM mainElements", sqlcon))
                {
                    using (SqlDataAdapter sqlDA = new SqlDataAdapter(sqlcmd))
                    {
                        DataTable dt = new DataTable();
                        sqlDA.Fill(dt);
                        rptPageLinks.DataSource = dt;
                        rptPageLinks.DataBind();                
                    }
                }

                using (SqlCommand sqlcom = new SqlCommand("SELECT * FROM specialOffers", sqlcon))
                {
                    using (SqlDataAdapter sqlDA = new SqlDataAdapter(sqlcom))
                    {
                        DataTable dt = new DataTable();
                        sqlDA.Fill(dt);
                        rptSpecials.DataSource = dt;
                        rptSpecials.DataBind();
                    }
                }

                using (SqlCommand sqlcom = new SqlCommand("SELECT * FROM productCategories", sqlcon))
                {
                    using (SqlDataAdapter sqlDA = new SqlDataAdapter(sqlcom))
                    {
                        DataTable dt = new DataTable();
                        sqlDA.Fill(dt);
                        rptProducts.DataSource = dt;
                        rptProducts.DataBind();
                    }
                }
            }
        }
    }
}