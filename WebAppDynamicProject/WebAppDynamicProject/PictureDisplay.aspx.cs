using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.SqlClient;
using System.Data;
using System.Drawing.Imaging;

namespace WebAppDynamicProject
{
    public partial class PictureDisplay : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ////////for (int i = 1; i < 4; i++)
            ////////{
            //////    Session["id"] = 3;
            //////    iDisplay.ImageUrl = "~/PictureHandler.ashx?PictureID=" + Session["id"]; 
            ////////}

                if (!IsPostBack)
                {
                    DynamicDataContext db = new DynamicDataContext();

                    var houseList = from h in db.Houses
                                    where h.HouseID==Convert.ToInt32(Session["House"])
                                    select new { h.HouseID, HouseDetails=h.HouseNo + " " + h.BuildingName};

                    //ddlHouse.DataSource = houseList
                    int hid = houseList.ToArray()[0].HouseID;                   
                   
                    ddlHouse.DataValueField = "HouseID";
                    ddlHouse.DataTextField = "HouseDetails";
                    

                    ddlHouse.DataSource = houseList;
                    ddlHouse.DataBind();
                    
                    ddlHouse_SelectedIndexChanged(sender, e);   

                }                
            
        }

        protected void upload_Click(object sender, EventArgs e)
        {
            if (fu.HasFile)
            {
                System.Drawing.Image imag = System.Drawing.Image.FromStream(fu.PostedFile.InputStream);

                SqlConnection conn;
                try
                {
                    conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["MonicaDBConnectionString"].ConnectionString);
                    conn.Open();

                    //SqlCommand insertCommand = new SqlCommand("Insert into Houses(Picture) values (@pic) where HouseID=2", conn);
                    //insertCommand.Parameters.Add("pic", SqlDbType.Image, 0).Value = ConvertImageToByteArray(imag, ImageFormat.Jpeg);

                    SqlCommand updateCommand = new SqlCommand("update Houses set Picture=@pic where HouseID=" + ddlHouse.SelectedItem.Value, conn);
                    //updateCommand.Parameters.Add("pic", SqlDbType.Image, 0).Value = ConvertImageToByteArray(imag, ImageFormat.Jpeg);
                    updateCommand.Parameters.Add("pic", SqlDbType.Image, 0).Value = SaveToFileAsByte(imag, ImageFormat.Jpeg);
                    


                    //int qresult = insertCommand.ExecuteNonQuery();
                    int qresult = updateCommand.ExecuteNonQuery();

                    if (qresult == 1)
                    {
                        lblMessage.Text = fu.FileName+ " recorded successfully.";
                    }
                }
                catch (Exception ex)
                {

                    lblMessage.Text = "Error: " + ex.Message;
                }

            }
            

            //try
            //{
            //try
            //{
                //conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["MonicaDBConnectionString"].ConnectionString);
                //conn.Open();

                //SqlCommand insertCommand = new SqlCommand("Insert into Images(PictureID, Picture1) values (1,@pic)", conn);
                //insertCommand.Parameters.Add("pic", SqlDbType.Image, 0).Value = ConvertImageToByteArray(imag, ImageFormat.Jpeg);

                //int qresult = insertCommand.ExecuteNonQuery();

                //if (qresult == 1)
                //{
                //    lblMessage.Text = "Record added successfully.";
                //}
                //        }
                //        catch (Exception)
                //        {

                //            throw;
                //        }
                ////}

                // finally
                //{
                //    if ( conn != null)
                //    {
                //        conn.Close();
                //    }
                //}

                        
        }
           
       // }           
     

        private byte[] SaveToFileAsByte(System.Drawing.Image ImageToConvert, System.Drawing.Imaging.ImageFormat formatOfImage)
        {
            
            byte[] Ret;

            try 
	        {	        
		        using (MemoryStream ms=new MemoryStream()){
                    ImageToConvert.Save(ms,formatOfImage);
                    Ret=ms.ToArray();
                }

	        }
	        catch (Exception)
	        {
		    
		        throw;
	        }
            return Ret;        
        }

        protected void ddlHouse_SelectedIndexChanged(object sender, EventArgs e)
        {
            //iDisplay.ImageUrl = "~/PictureHandler.ashx?HouseID="+ddlHouse.SelectedItem.Value;
            //iDisplay.ImageUrl = "~/PictureHandler.ashx?HouseID=" + ddlHouse.SelectedItem.Value;
            iDisplay.ImageUrl = "~/PictureHandler.ashx?HouseID=" + Session["House"];

            lblHouseNo.Text = "Preview of : " +ddlHouse.SelectedItem.ToString();

        }
    }
}
