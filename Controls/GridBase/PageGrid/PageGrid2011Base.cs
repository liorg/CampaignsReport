using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace Report.Controls.GridBase
{
    

    public abstract class PageGrid2011Base<T> : PageGridBase<T>
    {
        protected override void CampaignsConflitListViewDataBound(object sender, ListViewItemEventArgs e)
        {
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                var t1 = (HtmlTableRow)e.Item.FindControl("row");
                int idx = 0;
                t1.Cells.Add(new HtmlTableCell
                {
                    Align = "Center",
                    InnerHtml = "<input id=\"checkBox1\" class=\"ms-crm-RowCheckBox\" title=\"\" tabindex=\"0\" value=\"\" type=\"checkbox\">"
                });
                t1.Cells[idx].Attributes.Add("class", "ms-crm-List-DataCell");
                idx++;
                t1.Cells.Add(new HtmlTableCell
                {
                    Align = "Center",
                    InnerHtml = "<img alt=\"\" src=\"/_imgs/ico_16_4400.gif\">"
                });
                t1.Cells[idx].Attributes.Add("class", "ms-crm-List-DataCell");
                idx++;
                foreach (var schema in SchemaBuilder.Schema)
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
                    t1.Cells[idx].Attributes.Add("class", "ms-crm-List-DataCell");
                    idx++;
                }
                t1.Cells.Add(new HtmlTableCell
                {
                    InnerHtml = "&nbsp;"
                });
                t1.Cells[idx].Attributes.Add("class", "ms-crm-List-DataCell");
            }
        }
    }


}