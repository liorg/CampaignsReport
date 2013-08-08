using MotSite.ServiceLibrary.Application;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace Report.Controls.GridBase
{
    public class DataAreaSortingBase : GridColumnsControl
    {
        protected const int FIX_WIDTH = 2;
        protected const string SORT_COL = "ms-crm-List-DataColumn";

        protected System.Web.UI.WebControls.Repeater repSortStyle;

        public virtual void BindData(SchemaBuilder schemaBuilder)
        {
            SetSchemaBuilder(schemaBuilder);
            repSortStyle.DataSource = schemaBuilder.Schema;
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
            if (field.ToString() == FieldName)
            {
                css += " " + "ms-crm-List-SortedColumn";
            }
            return css;
        }

    }
}