using Guardian.Taglit.ServiceLibrary.Application;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace Report.Controls.GridBase
{
    public class DataAreaSortingBase : UserControl
    {
        protected const int FIX_WIDTH = 2;
        protected const string SORT_COL = "ms-crm-List-DataColumn";

        protected System.Web.UI.WebControls.Repeater repSortStyle;

        public virtual void BindData()
        {
            var p = new Presentor();
            repSortStyle.DataSource = p.Schema;
            repSortStyle.DataBind();
        }

        protected virtual string WidthCalc(object field)
        {
            int result = 0;
            if (int.TryParse(field.ToString(), out result))
            {
                return (result + FIX_WIDTH).ToString();
            }
            return result.ToString();
        }

        protected virtual string GenerateCss(object field)
        {
            string css = SORT_COL;
            if (field.ToString() == FieldName.ToString())
            {
                css += " " + "ms-crm-List-SortedColumn";
            }
            return css;
        }

        public FieldName FieldName
        {
            get
            {
                if (ViewState["FieldNameOrder"] == null)
                {
                    ViewState["FieldNameOrder"] = FieldName.CampaignName;
                }
                return (FieldName)ViewState["FieldNameOrder"];
            }
            set
            {
                ViewState["FieldNameOrder"] = value;
            }
        }

        public bool IsDesc
        {
            get
            {
                if (ViewState["IsDesc"] == null)
                {
                    ViewState["IsDesc"] = false;
                }
                return (bool)ViewState["IsDesc"];
            }
            set
            {
                ViewState["IsDesc"] = value;
            }
        }
    }
}