using System;

namespace Report.Controls.C2013.Grid
{
    public  class RefreshButton2013 : System.Web.UI.UserControl
    {

        public event EventHandler RefreshHandler;

        protected void RefreshButton_Click(object sender, EventArgs e)
        {
            if (RefreshHandler != null)
            {
                RefreshHandler(sender, e);
            }
        }
    }
}