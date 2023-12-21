using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using System.Web.DynamicData;

namespace WebAppDynamicProject
{
    public partial class nList : System.Web.UI.Page
    {
        protected MetaTable table;

        protected void Page_Init(object sender, EventArgs e)
        {
           // DynamicDataManager1.RegisterControl(GridView1, true /*setSelectionFromUrl*/);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            //table = GridDataSource.GetTable();
            //Title = table.DisplayName;

            //InsertHyperLink.NavigateUrl = table.GetActionPath(PageAction.Insert);

            // Disable various options if the table is readonly
            //if (table.IsReadOnly)
            //{
            //    //GridView1.Columns[0].Visible = false;
            //    //InsertHyperLink.Visible = false;
            //}

            //
            if (!IsPostBack)
            {

                DynamicDataContext db = new DynamicDataContext();
                //var list = (from h in db.View_VaccantHouses
                //            select new { h.AreaName }).Distinct();//, h.HouseNo

                var list = from h in db.Areas
                           select new { h.AreaCode,h.AreaName};

                ddlHouse.DataTextField = "AreaName";
                ddlHouse.DataValueField = "AreaCode";
                ddlHouse.DataSource = list;
                ddlHouse.DataBind();

                var lista = from h in db.Categories
                           select new { h.CategoryID, h.CategoryName };

                ddlHouse2.DataTextField = "CategoryName";
                ddlHouse2.DataValueField = "CategoryID";
                ddlHouse2.DataSource = lista;
                ddlHouse2.DataBind();



                
            }
        }

        protected void OnFilterSelectedIndexChanged(object sender, EventArgs e)
        {
            //GridView1.PageIndex = 0;
        }

        protected void btnSearh_Click(object sender, EventArgs e)
        {
            DynamicDataContext db = new DynamicDataContext();

            string a = ddlHouse.SelectedItem.Text;
            string b = ddlHouse2.SelectedItem.Text;

            var list2 = from h in db.VaccantList(a, b)
                        select new { h.HouseID, h.HouseNo, h.Address, h.AreaName, h.CategoryName, h.Description, h.Facitlities,h.Rent };
            GridView2.DataSource = list2;
            GridView2.DataBind();
            //h.HouseID, h.HouseNo, h.AreaName, h.Address, h.Facitlities, h.CategoryName
        }
        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DisplayPicture")
            {
                int houseid = Convert.ToInt32(e.CommandArgument);
                Session["House"] = houseid.ToString();
                Response.Redirect("~/PictureDisplay.aspx");
            }

            if (e.CommandName == "Select")
            {
                //new code
                //GridViewRow row = GridView2.SelectedRow;

                int houseid = Convert.ToInt32(e.CommandArgument);
                Session["House"] = houseid.ToString();
                //Session["Area"] = row.Cells[6].Text.Trim();
                //Response.Redirect("~/PictureDisplay.aspx");
            }

            if (e.CommandName=="SendMessage")
            {
                //new code
                GridViewRow row = GridView2.SelectedRow;

                if (row !=null)
                {
                    
                //}
                int houseid = Convert.ToInt32(e.CommandArgument);
                //string area5 = Session["Area"].ToString;
                              
                //save request automatically
                DynamicDataContext db = new DynamicDataContext();

                //find area of the selected  house
                var areacode5 = from a in db.Areas
                                where a.AreaName == row.Cells[5].Text.Trim()                                                                 
                                select a.AreaCode;

                int area = areacode5.ToList().FirstOrDefault();

                ////create a request object
                //Request nRequest = new Request
                //{
                //    FirstName="showkot ali5",
                //    Phone="01552366511",
                //    Message="auto message for house5",
                //    AreaCode=area,//Convert.ToInt16(lstHouse2.DataValueField),
                //    HouseID = Convert.ToInt32(row.Cells[1].Text)
                //};
                //check the txtboxes 
                if ((txtName.Text != "") && (txtPhone.Text != "") && (txtMessage.Text != ""))
                {
                    //processs the request
                    //create a request object
                    Request nRequest = new Request
                    {
                        FirstName = txtName.Text.Trim(),
                        LastName = txtLast.Text.Trim(),
                        Phone = txtPhone.Text.Trim(),
                        email = txtMessage.Text.Trim(),
                        Message = "House Request",
                        AreaCode = area,//Convert.ToInt16(lstHouse2.DataValueField),
                        HouseID = houseid,//Convert.ToInt32(row.Cells[1].Text),
                        RequestDate = DateTime.Now.Date
                    };

                    //Signal the context to insert this record
                    db.Requests.InsertOnSubmit(nRequest);
                    //Save the changes to the database
                    db.SubmitChanges();
                    
                    //lbldisplay.Text="You have selected " + row.Cells[1].Text.Trim(); 

                    lbldisplay.Text = "Your request for house has been submitted successfully."; // +row.Cells[1].Text.Trim();

                    txtName.Text = "";
                    txtLast.Text = "";
                    txtPhone.Text = "";
                    txtMessage.Text = "";
                }
                else
                {
                    lbldisplay.Text = "Fill up the Text boxes to send house request.";

                    //Response.Redirect("~/DisplayPicture.aspx");
                }
                }
                else
                {
                    lbldisplay.Text = "You must select the row before proceed.";
                }

 
            }
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            //new code
            GridViewRow row = GridView2.SelectedRow;

            if (row != null)
            {

                //}
                //int houseid = Convert.ToInt32(e.CommandArgument);
                //int houseid = Convert.ToInt32(row.Cells[1].Text);
                int houseid = Convert.ToInt32(Session["House"]);

                //save request automatically
                DynamicDataContext db = new DynamicDataContext();

                //find area of the selected  house
                var areacode5 = from a in db.Areas
                                where a.AreaName == row.Cells[5].Text.Trim()//"Mirpur 12"//row.Cells[3].Text.Trim()
                                select a.AreaCode;

                int area = areacode5.ToList().FirstOrDefault();

                ////create a request object
                //Request nRequest = new Request
                //{
                //    FirstName="showkot ali5",
                //    Phone="01552366511",
                //    Message="auto message for house5",
                //    AreaCode=area,//Convert.ToInt16(lstHouse2.DataValueField),
                //    HouseID = Convert.ToInt32(row.Cells[1].Text)
                //};
                //check the txtboxes 
                if ((txtName.Text != "") && (txtPhone.Text != "") && (txtMessage.Text != ""))
                {
                    //processs the request
                    //create a request object
                    Request nRequest = new Request
                    {
                        FirstName = txtName.Text.Trim(),
                        LastName = txtLast.Text.Trim(),
                        Phone = txtPhone.Text.Trim(),
                        email = txtMessage.Text.Trim(),
                        Message = "House Request",
                        AreaCode = area,//Convert.ToInt16(lstHouse2.DataValueField),
                        HouseID = houseid,//Convert.ToInt32(row.Cells[1].Text),
                        RequestDate = DateTime.Now.Date
                    };

                    //Signal the context to insert this record
                    db.Requests.InsertOnSubmit(nRequest);
                    //Save the changes to the database
                    db.SubmitChanges();

                    //lbldisplay.Text="You have selected " + row.Cells[1].Text.Trim(); 

                    lbldisplay.Text = "Your request for house has been submitted successfully."; // +row.Cells[1].Text.Trim();

                    txtName.Text = "";
                    txtLast.Text = "";
                    txtPhone.Text = "";
                    txtMessage.Text = "";
                }
                else
                {
                    lbldisplay.Text = "Fill up the Text boxes to send house request.";

                    //Response.Redirect("~/DisplayPicture.aspx");
                }
            }
            else
            {
                lbldisplay.Text = "You must select the row before proceed.";
            }

        }

      

    }
}
