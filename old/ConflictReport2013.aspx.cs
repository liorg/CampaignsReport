using System;
using System.Collections.Generic;
using System.Configuration;
using System.Globalization;
using System.Linq;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Guardian.Taglit.ServiceLibrary;
using Guardian.Taglit.ServiceLibrary.Application;
using Guardian.Taglit.ServiceLibrary.DataModel;
using Microsoft.Practices.EnterpriseLibrary.Logging;
using Microsoft.Practices.EnterpriseLibrary.Common.Configuration;
using Report.Controls.C2013.Grid;
using Report.UI.App;

namespace Report.UI.GridReport
{
    public partial class ConflictReport2013 : Page, IFilterData
    {
        #region Private fields
        private string _url = "";
        private const string FORMAT_URL = "https://{0}/userdefined/edit.aspx?etc={1}&id={2}";
        private const string FORMAT_LINKABLE = "<nobr  class='gridcellpadding'><A target='_blank' class=ms-crm-List-Link href='{0}'>{1}</A></nobr>";
        private const string FORMAT_NOBR = "<nobr  class='gridcellpadding'>{0}</nobr>";

    

        private int _maxPage;
        #endregion

        #region Properties
        public StateBugDataGrid StateDataGrid
        {
            get
            {
                if (ViewState["StateDataGrid"] == null)
                {
                    ViewState["StateDataGrid"] = new StateBugDataGrid();
                }
                return (StateBugDataGrid)ViewState["StateDataGrid"];
            }
            set
            {
                ViewState["FieldNameOrder"] = value;
            }
        }
        #endregion

        #region Page Load
        protected void Page_Load(object sender, EventArgs e)
        {

            _url = Helper.GetUrl();
            _maxPage = int.Parse(ConfigurationManager.AppSettings["MaxPage"]);
          

            if (!Page.IsPostBack)
            {

                Label lblName1 = Page.FindControl("lblNameCamp") as Label;
                if (lblName1 != null)
                {
                    lblName1.Text = new Presentor().GetCampNameByCampaignId(this);
                }
                datepickerProposedEndDate.Value = DateTime.Now.AddDays(90).ToString(ConstVars.DATE_FORMAT);
                datepickerProposedStartDate.Value = DateTime.Now.AddDays(-90).ToString(ConstVars.DATE_FORMAT);
    
                CampaignsConflitListView.DataSource = GetDataFromSession(true);
                DefaultSetting();
                BindAllControls();
            }
        }
        #endregion

        #region Log
        public void WriteToLog(string log)
        {
            Logger.Write(log);
        }

        private void logError(Exception ee, string s)
        {
            WriteToLog(s + " error:" + ee.Message);
            ClientMessageBox.Show("there was error contact to your administrator!!!",this);
        }
        #endregion

        #region Data method
        private int GetCountOfAllData(bool isReuseAble)
        {
            return GetDataFromSession(isReuseAble).Count();
        }

        private IEnumerable<CampaignConflitView> GenerateQueryByStateBagDataGrid(bool isReuseAble)
        {
            var data = GetDataFromSession(isReuseAble).AsEnumerable();
            switch (StateDataGrid.CurrentFieldName)
            {
                case FieldName.Avg:
                    if (StateDataGrid.IsDesc)
                        data = data.OrderByDescending(row => row.Avg);
                    else
                        data = data.OrderBy(row => row.Avg);
                    break;
                case FieldName.MemberCount:
                    if (StateDataGrid.IsDesc)
                        data = data.OrderByDescending(row => row.MemberCount);
                    else
                        data = data.OrderBy(row => row.MemberCount);
                    break;
                case FieldName.CampaignApprovalStatus:
                    if (StateDataGrid.IsDesc)
                        data = data.OrderByDescending(row => row.CampaignApprovalStatus);
                    else
                        data = data.OrderBy(row => row.CampaignApprovalStatus);
                    break;
                case FieldName.CampaignName:
                    if (StateDataGrid.IsDesc)
                        data = data.OrderByDescending(row => row.CampaignName);
                    else
                        data = data.OrderBy(row => row.CampaignName);
                    break;
                case FieldName.CampaignSubtypeName:
                    if (StateDataGrid.IsDesc)
                        data = data.OrderByDescending(row => row.CampaignSubtypeName);
                    else
                        data = data.OrderBy(row => row.CampaignSubtypeName);
                    break;
                case FieldName.ConflitNo:
                    if (StateDataGrid.IsDesc)
                        data = data.OrderByDescending(row => row.ConflitContacts);
                    else
                        data = data.OrderBy(row => row.ConflitContacts);
                    break;
                case FieldName.ListName:
                    if (StateDataGrid.IsDesc)
                        data = data.OrderByDescending(row => row.ListName);
                    else
                        data = data.OrderBy(row => row.ListName).ToList();
                    break;
                case FieldName.ProposedEndDate:
                    if (StateDataGrid.IsDesc)
                        data = data.OrderByDescending(row => row.ProposedEndDate);
                    else
                        data = data.OrderBy(row => row.ProposedEndDate);
                    break;
                case FieldName.ProposedStartDate:
                    if (StateDataGrid.IsDesc)
                        data = data.OrderByDescending(row => row.ProposedStartDate);
                    else
                        data = data.OrderBy(row => row.ProposedStartDate);
                    break;
                case FieldName.TypeCode:
                    if (StateDataGrid.IsDesc)
                        data = data.OrderByDescending(row => row.TypeCode);
                    else
                        data = data.OrderBy(row => row.TypeCode);
                    break;
            }
            //exmple paging .Skip(numberOfObjectsPerPage * pageNumber).Take(numberOfObjectsPerPage);
            data = data.Skip((StateDataGrid.CurrentPaging - 1) * StateDataGrid.MaxPaging).Take(StateDataGrid.MaxPaging);
            return data;
        }

        private IEnumerable<CampaignConflitView> GetDataFromSession(bool isReuse = true)
        {
            if (isReuse)
            {
                if (StateDataGrid.HasData)
                {
                    if (Session["data"] == null)
                        Session["data"] = GetData();
                }
                else
                {
                    Session["data"] = new List<CampaignConflitView>();
                }

            }
            else
                Session["data"] = GetData();


            return (List<CampaignConflitView>)Session["data"];
        }

        private List<CampaignConflitView> GetData()
        {
            return new Presentor().GetData(this);
        }
        #endregion

        #region Binding and Setting
        private void BindAllControls()
        {
            sStatusbar.CurrentDataCount = GetCountOfAllData(true);
            CampaignsConflitListView.DataBind();
            sHeaderSorting.BindData();
            var dataAreaSorting = CampaignsConflitListView.FindControl("sDataAreaSorting") as DataAreaSorting;
            if (dataAreaSorting != null)
                dataAreaSorting.BindData();

        }

        protected void DefaultSetting()
        {
            sHeaderSorting.FieldName = FieldName.CampaignName;
            sHeaderSorting.IsDesc = false;
            sStatusbar.CurrentPaging = 1;
            sStatusbar.MaxPaging = _maxPage;

            StateDataGrid.CurrentFieldName = FieldName.CampaignName;
            StateDataGrid.IsDesc = false;
            StateDataGrid.MaxPaging = _maxPage;
            StateDataGrid.CurrentPaging = 1;

        }
        #endregion

        #region Event Handler

        protected void CampaignsConflitListViewDataBound(object sender, ListViewItemEventArgs e)
        {
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                var t1 = (HtmlTableRow)e.Item.FindControl("row");
                var presentor = new Presentor();
                int idx = 0;
                t1.Cells.Add(new HtmlTableCell
                {
                    Align = "Center",
                    InnerHtml = "<input id=\"checkBox1\" class=\"ms-crm-RowCheckBox\" title=\"\" tabindex=\"0\" value=\"\" type=\"checkbox\">"
                });
                t1.Cells[idx].Attributes.Add("class", "ms-crm-List-NonDataCell");
                idx++;
                t1.Cells.Add(new HtmlTableCell
                {
                    Align = "Center",
                    InnerHtml = "<img alt=\"\" src=\"/_imgs/ico_16_4400.gif\">"
                });
                t1.Cells[idx].Attributes.Add("class", "ms-crm-List-DataCell");
                idx++;
                foreach (var schema in presentor.Schema)
                {
                    string cellFormat;
                    var cell = DataBinder.Eval(e.Item.DataItem, schema.FieldSchemaName);
                    if (schema.IsLinkable)
                    {
                        var url = LinkToEntity(DataBinder.Eval(e.Item.DataItem, schema.EntityId), schema.EntityName);
                        cellFormat = String.Format(FORMAT_LINKABLE, url, cell);
                    }
                    else
                    {

                        cellFormat = String.Format(FORMAT_NOBR, cell);
                    }
                    t1.Cells.Add(new HtmlTableCell
                    {
                        InnerHtml = cellFormat
                    }
                        );
                    t1.Cells[idx].Attributes.Add("class", "ms-crm-List-DataCell inner-grid-cellPadding");
                    idx++;
                }
                t1.Cells.Add(new HtmlTableCell
                {
                    InnerHtml = "&nbsp;"
                });
                t1.Cells[idx].Attributes.Add("class", "ms-crm-List-DataCell");
            }
        }

        protected void ExecuteBtnClick(object sender, EventArgs e)
        {
            DefaultSetting();
            var data = GenerateQueryByStateBagDataGrid(false);
            CampaignsConflitListView.DataSource = data;
            StateDataGrid.CurrentDataCount = data.Count();
            StateDataGrid.HasData = true;
            BindAllControls();
            if (StateDataGrid.CurrentDataCount == 0)
            {
                ClientMessageBox.Show("There is No Data", this);

            }
        }

        protected void PagingChange(object sender, PagingEventArgs e)
        {
            StateDataGrid.CurrentPaging = e.CurrentPage;
            if (!StateDataGrid.HasData)
            {
                BindAllControls();
                return;
            }
            CampaignsConflitListView.DataSource = GenerateQueryByStateBagDataGrid(true);
            BindAllControls();

        }

        protected void FieldNameSortingChange(object sender, FieldNameSortingEventArgs e)
        {
            StateDataGrid.CurrentFieldName = e.FieldName;
            StateDataGrid.IsDesc = e.IsDesc;
            if (!StateDataGrid.HasData)
            {
                BindAllControls();
                return;
            }
            var d = CampaignsConflitListView.FindControl("sDataAreaSorting") as DataAreaSorting;
            if (d != null)
            {
                d.FieldName = e.FieldName;
                d.BindData();
            }
            CampaignsConflitListView.DataSource = GenerateQueryByStateBagDataGrid(true);
            BindAllControls();


        }
        #endregion

        #region Render Handler
        protected string LinkToEntity(object fieldid, string entityName)
        {
            return String.Format(FORMAT_URL, _url, ConfigurationManager.AppSettings[entityName], fieldid);
        }
        #endregion

        #region IFilterData
    
        public string StartDate
        {
            get
            {
                if (datepickerProposedStartDate.Value != null)
                {

                    return datepickerProposedStartDate.Value;
                }
                else
                    throw new ArgumentException("start date is missing");

            }
        }

        public string EndDate
        {
            get
            {
                if (datepickerProposedEndDate.Value != null)
                {

                    return datepickerProposedEndDate.Value;
                }
                else
                    throw new ArgumentException("end date is missing");
            }
        }

        public Guid CampaignId
        {
            get
            {
                Guid campaignId;
                if (Request["CampaignId"] == null)
                {
#if DEBUG
                    //http://taglitdev.g-s.co.il:8080/ConflictReport.aspx?CampaignId=%7bE1398BD0-933C-E211-8291-00155D049948%7d
                   campaignId = new Guid("0DD50E61-B538-E211-8291-00155D049948");
                    //campaignId = new Guid("07678AE4-323D-E211-8291-00155D049948");
                   //campaignId = new Guid("E1398BD0-933C-E211-8291-00155D049948");

#else

                    throw new ArgumentException("Campaign Id is missing");
#endif
                }
                else campaignId = new Guid(Request["CampaignId"]);

                return campaignId;
            }

        }

        public Configuration Config
        {
            get { return System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration("~"); }
        }

        public Action<Exception, string> Log
        {
            get { return logError; }
        }
      
        #endregion

        protected void RefreshHandler(object sender, EventArgs e)
        {
            DefaultSetting();
            var data = GenerateQueryByStateBagDataGrid(false);
            CampaignsConflitListView.DataSource = data;
            StateDataGrid.CurrentDataCount = data.Count();
            StateDataGrid.HasData = true;
            BindAllControls();
            if (StateDataGrid.CurrentDataCount == 0)
            {
                ClientMessageBox.Show("There is No Data", this);

            }
        }
    }
}
