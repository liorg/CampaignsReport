using System;

namespace Guardian.Taglit.ServiceLibrary.DataModel
{
    public class CampaignViewBase : MarketingListViewBase
    {
        public Guid CampaignId { get; set; }

        public string CampaignName { get; set; }

        public string TypeCode { get; set; }

        public Guid CampaignSubtypeId { get; set; }

        public string CampaignSubtypeName { get; set; }
        
        public DateTime? ProposedStartDate { get; set; }

        public DateTime? ProposedEndDate { get; set; }

        public string CampaignApprovalStatus { get; set; }
    }
}
