
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MotSite.ServiceLibrary.Application;

namespace Report.Controls.GridBase
{
    public class StatusBarBase : UserControl
    {

        public event PagingEventHandler PagingEventHandler;

        protected System.Web.UI.WebControls.LinkButton LinkButton1;

        protected System.Web.UI.WebControls.LinkButton lnkNextPage;

        protected virtual string PagePreviousStyle()
        {

            if (IsFirstPage())
                return "ms-crm-ImageStrip-page_L0"; //disable
 
            return "ms-crm-ImageStrip-page_L1";
        }

        protected virtual string PageNextStyle()
        {

           if(IsLastPage())
               return "ms-crm-ImageStrip-page_R0";  //disable
 
            return "ms-crm-ImageStrip-page_R1";
        }

        protected bool IsLastPage()
        {
            if (CurrentDataCount <= (CurrentPaging * MaxPaging))
                return true;
            else
                return false;
        }

        protected bool IsFirstPage()
        {
            if ((CurrentPaging * MaxPaging) <= MaxPaging)
                return true;
            else
                return false;
        }
        protected virtual void NextPage_Click(Object sender, EventArgs e)
        {
            var se = sender as LinkButton;

            if (se != null)
            {
                if (se.CommandName == "next")
                {
                    CurrentPaging = IsLastPage() ? CurrentPaging : CurrentPaging + 1;
                    //CurrentPaging = CurrentPaging + 1;
                }
                else
                {
                    CurrentPaging = CurrentPaging <= 1 ? CurrentPaging : CurrentPaging - 1;
                }
                var isFirstPage = IsFirstPage();
                var isLastPage = IsLastPage();

                if (PagingEventHandler != null)
                {
                    PagingEventHandler(sender, new PagingEventArgs { CurrentPage = CurrentPaging, MaxPage = MaxPaging });
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