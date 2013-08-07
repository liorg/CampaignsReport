
using System;

namespace Guardian.Taglit.ServiceLibrary.DataModel
{
    public class CampaignContactView : CampaignViewBase
    {
        public Guid ContactId { get; set; }

        public string Query { get; set; }
    }
}
