using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Report.Controls.C2013.Grid
{
    public partial class RefreshButton2013 : System.Web.UI.UserControl
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