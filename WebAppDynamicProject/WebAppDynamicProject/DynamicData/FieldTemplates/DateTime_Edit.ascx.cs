using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Specialized;
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
    public partial class DateTime_EditField : System.Web.DynamicData.FieldTemplateUserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            TextBox1.ToolTip = Column.Description;

            SetUpValidator(RequiredFieldValidator1);
            SetUpValidator(RegularExpressionValidator1);
            SetUpValidator(DynamicValidator1);
        }

        protected override void ExtractValues(IOrderedDictionary dictionary)
        {
            dictionary[Column.Name] = ConvertEditedValue(TextBox1.Text);
        }

        public override Control DataControl
        {
            get
            {
                return TextBox1;
            }
        }

        protected void CalDate_SelectionChanged(object sender, EventArgs e)
        {
            TextBox1.Text = CalDate.SelectedDate.ToShortDateString();
            CalDate.Visible = true;
        }

        //protected void btnDate_Click(object sender, EventArgs e)
        //{
        //    //CalDate.Visible = true;
        //    if (CalDate.Visible == true)
        //    {
        //        CalDate.Visible = false;

        //    }
        //    else
        //    {
        //        CalDate.Visible = true;
        //    }
        //}
    }
}
