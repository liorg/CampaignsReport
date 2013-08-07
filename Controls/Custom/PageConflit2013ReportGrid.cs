using System;
using System.Collections.Generic;
using System.Linq;
using Guardian.Taglit.ServiceLibrary.DataModel;
using MotSite.ServiceLibrary.Application.ConflitReport;
using MotSite.ServiceLibrary.Application;
using Report.Controls.GridBase;

namespace Report.Controls.CustomGrid
{
    public class PageConflit2013ReportGrid : PageGrid2013Base<CampaignConflitView>, IFilterData
    {
        protected override SchemaBuilder GetSchemaBuilder()
        {
             return new ConflitReportSchemaBuilder();
        }

        protected override IEnumerable<CampaignConflitView> GenerateQueryByStateBagDataGrid(bool isReuseAble)
        {
            var data = GetDataFromSession(isReuseAble).AsEnumerable();
            switch (StateDataGrid.CurrentFieldName)
            {
                case "Avg":
                    if (StateDataGrid.IsDesc)
                        data = data.OrderByDescending(row => row.Avg);
                    else
                        data = data.OrderBy(row => row.Avg);
                    break;
                case "MemberCount":
                    if (StateDataGrid.IsDesc)
                        data = data.OrderByDescending(row => row.MemberCount);
                    else
                        data = data.OrderBy(row => row.MemberCount);
                    break;
                case "CampaignApprovalStatus":
                    if (StateDataGrid.IsDesc)
                        data = data.OrderByDescending(row => row.CampaignApprovalStatus);
                    else
                        data = data.OrderBy(row => row.CampaignApprovalStatus);
                    break;
                case "CampaignName":
                    if (StateDataGrid.IsDesc)
                        data = data.OrderByDescending(row => row.CampaignName);
                    else
                        data = data.OrderBy(row => row.CampaignName);
                    break;
                case "CampaignSubtypeName":
                    if (StateDataGrid.IsDesc)
                        data = data.OrderByDescending(row => row.CampaignSubtypeName);
                    else
                        data = data.OrderBy(row => row.CampaignSubtypeName);
                    break;
                case "ConflitContacts":
                    if (StateDataGrid.IsDesc)
                        data = data.OrderByDescending(row => row.ConflitContacts);
                    else
                        data = data.OrderBy(row => row.ConflitContacts);
                    break;
                case "ListName":
                    if (StateDataGrid.IsDesc)
                        data = data.OrderByDescending(row => row.ListName);
                    else
                        data = data.OrderBy(row => row.ListName).ToList();
                    break;
                case "ProposedEndDate":
                    if (StateDataGrid.IsDesc)
                        data = data.OrderByDescending(row => row.ProposedEndDate);
                    else
                        data = data.OrderBy(row => row.ProposedEndDate);
                    break;
                case "ProposedStartDate":
                    if (StateDataGrid.IsDesc)
                        data = data.OrderByDescending(row => row.ProposedStartDate);
                    else
                        data = data.OrderBy(row => row.ProposedStartDate);
                    break;
                case "TypeCode":
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

        protected override List<CampaignConflitView> GetData()
        {
                return new PresentorConfiltReport().GetData(this);
        }

        

        #region IFilterData

        public string StartDate
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

        public string EndDate
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

        public Guid EntityGuidId
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

        

        #endregion
    }

}