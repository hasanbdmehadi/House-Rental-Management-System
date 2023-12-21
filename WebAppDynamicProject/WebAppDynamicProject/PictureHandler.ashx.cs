using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data.SqlClient;


namespace WebAppDynamicProject
{
    /// <summary>
    /// Summary description for $codebehindclassname$
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    public class PictureHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            //context.Response.ContentType = "text/plain";
            //context.Response.Write("Hello World");

            SqlDataReader rdr = null;
            SqlConnection conn = null;
            SqlCommand selcmd = null;

            try
            {
                conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["MonicaDBConnectionString"].ConnectionString);

                selcmd = new SqlCommand("select Picture from Houses where HouseID=" + context.Request.QueryString["HouseID"],conn);
                //select Picture from Houses where HouseID=2" MonicaDBConnectionString

                conn.Open();

                rdr = selcmd.ExecuteReader();

                while (rdr.Read())
                {
                    context.Response.ContentType = "image/jpg";
                    context.Response.BinaryWrite((byte[])rdr["Picture"]);
                }                


                if (rdr !=null)
                {
                    rdr.Close();   
                }
            }

                finally{
                if (conn !=null)
	            {
		            conn.Close();
	            }

            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}
