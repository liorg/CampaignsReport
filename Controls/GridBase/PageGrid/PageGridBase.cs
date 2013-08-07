using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Configuration;
using Guardian.Taglit.ServiceLibrary;
using Guardian.Taglit.ServiceLibrary.DataModel;
using MotSite.ServiceLibrary.Application;
using System.Web.UI.WebControls;
using Microsoft.Practices.EnterpriseLibrary.Logging;
using Report.UI.App;
using System.Web.UI.HtmlControls;

namespace Report.Controls.GridBase
{
    public abstract class PageGridBase<T> : Page, ILogAndConfig
    {
        #region Private fields

        protected SchemaBuilder _schemaBuilder;

        protected HtmlForm form1;
        protected Label lblNameCamp;
        protected Label Label1;
        protected HtmlInputText datepickerProposedStartDate;
        protected RequiredFieldValidator datepickerProposedStartDateRequired;
        protected Label Label2;
        protected HtmlInputText datepickerProposedEndDate;
        protected RequiredFieldValidator RequiredFieldValidator1;
        protected Button ExecuteBtn;
        protected HeaderSortingBase sHeaderSorting;
        protected ListView CampaignsConflitListView;
        protected StatusBarBase sStatusbar;

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

        public  virtual  bool IsReuse {get { return true; }}

        public virtual SchemaBuilder SchemaBuilder
        {
            get
            {
                if (_schemaBuilder==null)
                {
                   _schemaBuilder= GetSchemaBuilder();
                }
                return _schemaBuilder;
            }
        }

        protected abstract SchemaBuilder GetSchemaBuilder();

       
        protected virtual void PageLoad()
        {
            _url = Helper.GetUrl();
            _maxPage = int.Parse(ConfigurationManager.AppSettings["MaxPage"]);

            CampaignsConflitListView.DataSource = GetDataFromSession(IsReuse);
            DefaultSetting(SchemaBuilder);
            BindAllControls(SchemaBuilder);
            //if (!Page.IsPostBack)
            //{

            //    //Label lblName1 = Page.FindControl("lblNameCamp") as Label;
            //    //if (lblName1 != null)
            //    //{
            //    //    lblName1.Text = new Presentor().GetCampNameByCampaignId(this);
            //    //}
            //    //datepickerProposedEndDate.Value = DateTime.Now.AddDays(90).ToString(ConstVars.DATE_FORMAT);
            //    //datepickerProposedStartDate.Value = DateTime.Now.AddDays(-90).ToString(ConstVars.DATE_FORMAT);

            //    CampaignsConflitListView.DataSource = GetDataFromSession(true);
            //    DefaultSetting();
            //    BindAllControls();
            //}
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

        protected abstract IEnumerable<T> GenerateQueryByStateBagDataGrid(bool isReuseAble);
       
        protected virtual IEnumerable<T> GetDataFromSession(bool isReuse = true)
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


            return (List<T>)Session["data"];
        }

        protected abstract List<T> GetData();
        //{
        //    return new PresentorConfiltReport().GetData(this);
        //    //return new Presentor().GetDataDemo(this);
        //}
   
        #endregion

        #region Binding and Setting
     
        protected virtual void BindAllControls(SchemaBuilder schemaBuilder)
        { 
            sStatusbar.CurrentDataCount = GetCountOfAllData(true);
            CampaignsConflitListView.DataBind();
            sHeaderSorting.BindData(schemaBuilder);
            var dataAreaSorting = CampaignsConflitListView.FindControl("sDataAreaSorting") as DataAreaSortingBase;
            if (dataAreaSorting != null)
                dataAreaSorting.BindData(schemaBuilder);
        }

        protected virtual void DefaultSetting(SchemaBuilder SchemaBuilder)
        {
            sHeaderSorting.FieldName = SchemaBuilder.DefaultFieldName;
            sHeaderSorting.IsDesc = false;
            sStatusbar.CurrentPaging = 1;
            sStatusbar.MaxPaging = _maxPage;

            StateDataGrid.CurrentFieldName = SchemaBuilder.DefaultFieldName;
            StateDataGrid.IsDesc = false;
            StateDataGrid.MaxPaging = _maxPage;
            StateDataGrid.CurrentPaging = 1;

        }
      
        #endregion

        #region Event Handler

        protected abstract void CampaignsConflitListViewDataBound(object sender, ListViewItemEventArgs e);

        protected void ExecuteBtnClick(object sender, EventArgs e)
        {
            DefaultSetting(SchemaBuilder);
            var data = GenerateQueryByStateBagDataGrid(false);
            CampaignsConflitListView.DataSource = data;
            StateDataGrid.CurrentDataCount = data.Count();
            StateDataGrid.HasData = true;
            BindAllControls(SchemaBuilder);
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
                BindAllControls(SchemaBuilder);
                return;
            }
            CampaignsConflitListView.DataSource = GenerateQueryByStateBagDataGrid(true);
            BindAllControls(SchemaBuilder);

        }

        protected void FieldNameSortingChange(object sender, FieldNameSortingEventArgs e)
        {
            StateDataGrid.CurrentFieldName = e.FieldName;
            StateDataGrid.IsDesc = e.IsDesc;
            if (!StateDataGrid.HasData)
            {
                BindAllControls(SchemaBuilder);
                return;
            }
            var d = CampaignsConflitListView.FindControl("sDataAreaSorting") as DataAreaSortingBase;
            if (d != null)
            {
                d.FieldName = e.FieldName;
                d.BindData(SchemaBuilder);
            }
            CampaignsConflitListView.DataSource = GenerateQueryByStateBagDataGrid(true);
            BindAllControls(SchemaBuilder);


        }
        #endregion

        #region Render Handler
        protected virtual string LinkToEntity(object fieldid, string entityName)
        {
            return String.Format(FORMAT_URL, _url, ConfigurationManager.AppSettings[entityName], fieldid);
        }
        #endregion


        public Configuration Config
        {
            get { return System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration("~"); }
        }

        public Action<Exception, string> Log
        {
            get { return logError; }
        }

    }
}