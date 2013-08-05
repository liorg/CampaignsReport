using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using Guardian.Taglit.ServiceLibrary.Application;

namespace CampaignsReport
{
    public partial class HeaderSorting : UserControl
    {
        public event FieldNameSortingEventHandler FieldNameSortingEventHandler;

        const string cssDefault = "ms-crm-List-Sortable";
        const string cssUp = "ms-crm-ImageStrip-bar_up";
        const string cssDown = "ms-crm-ImageStrip-dropdown";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
             //  BindData();
            }

        }
        //protected void HeaderTitleLink_Click(Object sender, EventArgs e)
        //{
        //    var linkHeaderButton = sender as LinkButton;
        //    if (linkHeaderButton != null && !String.IsNullOrEmpty(linkHeaderButton.CommandName))
        //    {

        //        FieldName = (FieldName)Enum.Parse(typeof(FieldName), linkHeaderButton.CommandName);

        //        //if (FieldName.ToString() == row.Item1.ToString())
        //        //{
        //        //    if (IsDesc)
        //        //        imgSortType.CssClass = cssDown;
        //        //    else
        //        //        imgSortType.CssClass = cssUp;

        //        //}
        //        //else
        //        //{
        //        //    imgSortType.CssClass = cssDefault;
        //        //}

        //        if (FieldNameSortingEventHandler != null)
        //        {
        //            FieldNameSortingEventHandler(sender, new FieldNameSortingEventArgs { FieldName = FieldName, IsDesc = IsDesc });
        //        }
        //    }
        //}
       
        public void BindData()
        {
            var p = new Presentor();
            repCols.DataSource = p.Schema;
            repCols.DataBind();

            repWidth.DataSource = p.Schema;
            repWidth.DataBind();
        }
      
        protected void repCols_ItemDataBound(object sender, RepeaterItemEventArgs e)
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
                if (FieldName.ToString() == row.FieldName.ToString())
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

        protected void repCols_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
           if (!String.IsNullOrEmpty(e.CommandName))
            {

                var currentFieldName = (FieldName)Enum.Parse(typeof(FieldName), e.CommandName);

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
           BindData();
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