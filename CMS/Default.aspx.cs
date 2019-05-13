using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace CMS
{
    public partial class _Default : Page
    {
        protected void Page_Load (object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.BindRepeater();
            }
        }

        private void BindRepeater ()
        {
            string constr = ConfigurationManager.ConnectionStrings["CMSTest"].ConnectionString;
            using (SqlConnection sqlcon = new SqlConnection(constr))
            {
                using (SqlCommand sqlcom = new SqlCommand("SELECT * FROM mainElements", sqlcon))
                {
                    using (SqlDataAdapter sqlDA = new SqlDataAdapter(sqlcom))
                    {
                        DataTable dt = new DataTable();
                        sqlDA.Fill(dt);
                        rptMainElements.DataSource = dt;
                        rptMainElements.DataBind();                      
                    }
                }

                using (SqlCommand sqlcom = new SqlCommand("SELECT * FROM specialOffers", sqlcon))
                {
                    using (SqlDataAdapter sqlDA = new SqlDataAdapter(sqlcom))
                    {
                        DataTable dt = new DataTable();
                        sqlDA.Fill(dt);
                        rptSpecialOffers.DataSource = dt;
                        rptSpecialOffers.DataBind();
                    }
                }

                using (SqlCommand sqlcom = new SqlCommand("SELECT * FROM productCategories", sqlcon))
                {
                    using (SqlDataAdapter sqlDA = new SqlDataAdapter(sqlcom))
                    {
                        DataTable dt = new DataTable();
                        sqlDA.Fill(dt);
                        rptProductCategories.DataSource = dt;
                        rptProductCategories.DataBind();
                    }
                }
            }
        }
    }
}