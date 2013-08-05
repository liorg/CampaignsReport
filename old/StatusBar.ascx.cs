using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using Guardian.Taglit.ServiceLibrary.Application;

namespace CampaignsReport
{
    public partial class StatusBar : UserControl
    {
        public event PagingEventHandler PagingEventHandler;
      
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void NextPage_Click(Object sender, EventArgs e)
        {
            var se = sender as LinkButton;
            if (se != null)
            {
                if (se.CommandName == "next")
                {

                    CurrentPaging = CurrentPaging + 1;
                }
                else
                {
                    CurrentPaging = CurrentPaging <= 1 ? CurrentPaging : CurrentPaging - 1;
                }
                if (PagingEventHandler != null)
                {
                    PagingEventHandler(sender, new PagingEventArgs {CurrentPage = CurrentPaging, MaxPage = MaxPaging});
                }
            }
        }
       
        public int CurrentDataCount
        {
            get
            {
                if (ViewState["CurrentDataCount"] == null)
                {
                    ViewState["CurrentDataCount"] = 0;
                }
                return (int)ViewState["CurrentDataCount"];
            }
            set
            {
                ViewState["CurrentDataCount"] = value;
            }
        }

        public int MaxPaging
        {
            get
            {
                if (ViewState["MaxPaging"] == null)
                {
                    ViewState["MaxPaging"] = 10;
                }
                return (int)ViewState["MaxPaging"];
            }
            set
            {
                ViewState["MaxPaging"] = value;
            }
        }

        public int CurrentPaging
        {
            get
            {
                if (ViewState["CurrentPaging"] == null)
                {
                    ViewState["CurrentPaging"] = 1;
                }
                return (int)ViewState["CurrentPaging"];
            }
            set
            {
                ViewState["CurrentPaging"] = value;
            }
        }
    }
}