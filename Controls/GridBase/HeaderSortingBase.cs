using MotSite.ServiceLibrary.Application;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Report.Controls.GridBase
{
    public class GridColumnsControl:UserControl
    {
        protected virtual void SetSchemaBuilder(SchemaBuilder schemaBuilder)
        {
            HttpContext.Current.Items["SchemaBuilder"] = schemaBuilder;
        }

        protected virtual SchemaBuilder GetSchemaBuilder()
        {
            var schemaBuilder = (SchemaBuilder)HttpContext.Current.Items["SchemaBuilder"];
            if (schemaBuilder != null)
            {
                return schemaBuilder;
            }
            return null;
        }

        public string FieldName
        {
            get
            {
                if (ViewState["FieldNameOrder"] == null)
                {
                    SchemaBuilder schemaBuilder = GetSchemaBuilder();
                    if (schemaBuilder != null)
                    {
                        ViewState["FieldNameOrder"] = schemaBuilder.DefaultFieldName;
                    }
                    else
                    {
                        ViewState["FieldNameOrder"] = "";

                    }
                }
                return (string)ViewState["FieldNameOrder"];
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

    public class HeaderSortingBase : GridColumnsControl
    {
        protected System.Web.UI.WebControls.Repeater repWidth;
        protected System.Web.UI.WebControls.Repeater repCols;

        public event FieldNameSortingEventHandler FieldNameSortingEventHandler;

        protected const string cssDefault = "ms-crm-List-Sortable";
        protected const string cssUp = "ms-crm-ImageStrip-bar_up";
        protected const string cssDown = "ms-crm-ImageStrip-dropdown";

        public virtual void BindData(SchemaBuilder schemaBuilder)
        {
            SetSchemaBuilder(schemaBuilder);

            repCols.DataSource = schemaBuilder.Schema;
            repCols.DataBind();

            repWidth.DataSource = schemaBuilder.Schema;
            repWidth.DataBind();
        }

      

        protected virtual void repCols_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            var imgSortType = (Image)e.Item.FindControl("imgSortType");
            var linkHeaderButton = (LinkButton)e.Item.FindControl("LinkHeaderButton");
            var row = e.Item.DataItem as SchemaDetail;

            if (linkHeaderButton != null)
            {
                if (row != null)
                {
                    linkHeaderButton.CommandName = row.FieldName.ToString();
                }

            }
            if (imgSortType != null && row != null)
            {
                if (FieldName== row.FieldName.ToString())
                {
                    if (IsDesc)
                        imgSortType.CssClass = cssDown;
                    else
                        imgSortType.CssClass = cssUp;

                }
                else
                {
                    imgSortType.CssClass = cssDefault;
                }

            }

        }

        protected virtual void repCols_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (!String.IsNullOrEmpty(e.CommandName))
            {

                var currentFieldName = e.CommandName;

                if (FieldName == currentFieldName)
                {
                    IsDesc = !IsDesc;
                }
                else
                {
                    IsDesc = false;
                }

                FieldName = currentFieldName;
                if (FieldNameSortingEventHandler != null)
                {
                    FieldNameSortingEventHandler(source, new FieldNameSortingEventArgs { FieldName = FieldName, IsDesc = IsDesc });
                }
            }
            SchemaBuilder schemaBuilder = GetSchemaBuilder();
            if (schemaBuilder != null)
            {
                BindData(schemaBuilder);
            }
          
        }

      

      
    }
}