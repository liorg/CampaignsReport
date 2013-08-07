using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using Report.UI.App;
using System.Web.UI.HtmlControls;

namespace Report.Controls.GridBase
{


    public abstract class PageGrid2013Base<T> : PageGridBase<T>
    {
        protected override void CampaignsConflitListViewDataBound(object sender, ListViewItemEventArgs e)
        {
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                var t1 = (HtmlTableRow) e.Item.FindControl("row");

                int idx = 0;
                t1.Cells.Add(new HtmlTableCell
                {
                    Align = "Center",
                    InnerHtml =
                        "<input id=\"checkBox1\" class=\"ms-crm-RowCheckBox\" title=\"\" tabindex=\"0\" value=\"\" type=\"checkbox\">"
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

        protected void RefreshHandler(object sender, EventArgs e)
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
    }

} 