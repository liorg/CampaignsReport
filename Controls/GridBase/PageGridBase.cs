using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Configuration;
using Report.UI.App;
using Guardian.Taglit.ServiceLibrary.DataModel;
using Guardian.Taglit.ServiceLibrary.Application;
using System.Web.UI.WebControls;
using Guardian.Taglit.ServiceLibrary;
using Microsoft.Practices.EnterpriseLibrary.Logging;

namespace Report.Controls.GridBase
{
    public abstract class PageGridBase : Page, IFilterData
    {
        #region Private fields

        protected System.Web.UI.HtmlControls.HtmlForm form1;
        protected System.Web.UI.WebControls.Label lblNameCamp;
        protected System.Web.UI.WebControls.Label Label1;
        protected System.Web.UI.HtmlControls.HtmlInputText datepickerProposedStartDate;
        protected System.Web.UI.WebControls.RequiredFieldValidator datepickerProposedStartDateRequired;
        protected System.Web.UI.WebControls.Label Label2;
        protected System.Web.UI.HtmlControls.HtmlInputText datepickerProposedEndDate;
        protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator1;
        protected System.Web.UI.WebControls.Button ExecuteBtn;
        protected Report.Controls.GridBase.HeaderSortingBase sHeaderSorting;
        protected System.Web.UI.WebControls.ListView CampaignsConflitListView;
        protected Report.Controls.GridBase.StatusBarBase sStatusbar;

        protected string _url = "";
        protected const string FORMAT_URL = "https://{0}/userdefined/edit.aspx?etc={1}&id={2}";
        protected const string FORMAT_LINKABLE = "<nobr><A target='_blank' class=ms-crm-List-Link href='{0}'>{1}</A></nobr>";
        protected const string FORMAT_NOBR = "<nobr>{0}</nobr>";



        protected int _maxPage;

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



        protected override void OnLoad(EventArgs e)
        {
            PageLoad();
            base.OnLoad(e);
        }

        protected virtual void PageLoad()
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
        public virtual void WriteToLog(string log)
        {
            Logger.Write(log);
        }

        protected virtual void logError(Exception ee, string s)
        {
            WriteToLog(s + " error:" + ee.Message);
            ClientMessageBox.Show("there was error contact to your administrator!!!", this);
        }
        #endregion

        #region Data method
        protected virtual int GetCountOfAllData(bool isReuseAble)
        {
            return GetDataFromSession(isReuseAble).Count();
        }

        protected virtual IEnumerable<CampaignConflitView> GenerateQueryByStateBagDataGrid(bool isReuseAble)
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
                case FieldName.ConflitContacts:
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

        protected virtual IEnumerable<CampaignConflitView> GetDataFromSession(bool isReuse = true)
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
            //return new Presentor().GetDataDemo(this);
        }
   
        #endregion

        #region Binding and Setting
     
        protected virtual void BindAllControls()
        {
            sStatusbar.CurrentDataCount = GetCountOfAllData(true);
            CampaignsConflitListView.DataBind();
            sHeaderSorting.BindData();
            var dataAreaSorting = CampaignsConflitListView.FindControl("sDataAreaSorting") as DataAreaSortingBase;
            if (dataAreaSorting != null)
                dataAreaSorting.BindData();

        }

        protected virtual void DefaultSetting()
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

        protected abstract void CampaignsConflitListViewDataBound(object sender, ListViewItemEventArgs e);

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
            var d = CampaignsConflitListView.FindControl("sDataAreaSorting") as DataAreaSortingBase;
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

        public virtual string StartDate
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

        public virtual string EndDate
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

    }
   
    public  abstract class PageGridToolBarBase : PageGridBase
    {
        protected override void PageLoad()
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
                //datepickerProposedEndDate.Value = DateTime.Now.AddDays(90).ToString(ConstVars.DATE_FORMAT);
                //datepickerProposedStartDate.Value = DateTime.Now.AddDays(-90).ToString(ConstVars.DATE_FORMAT);

                CampaignsConflitListView.DataSource = GetDataFromSession(true);
                DefaultSetting();
                BindAllControls();
            }
        }
        public override string StartDate
        {
            get
            {
                //if (datepickerProposedStartDate.Value != null)
                //{

                //    return datepickerProposedStartDate.Value;
                //}
                //else
                //    throw new ArgumentException("start date is missing");
                return DateTime.Now.ToString("dd-MM-yyyy");

            }
        }

        public override string EndDate
        {
            get
            {
                //if (datepickerProposedEndDate.Value != null)
                //{

                //    return datepickerProposedEndDate.Value;
                //}
                //else
                //    throw new ArgumentException("end date is missing");
                return DateTime.Now.ToString("dd-MM-yyyy");
            }
        }

        
    }

}