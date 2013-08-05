using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using Guardian.Taglit.ServiceLibrary.DataModel;

namespace Guardian.Taglit.ServiceLibrary
{
    public class ServiceCampaign
    {
        #region Private Fields

        private readonly Configuration _configuration;
        private readonly Action<Exception, string> _logError;
        #endregion

        #region Ctor

        public ServiceCampaign(Configuration appConfig, Action<Exception, string> logError)
        {
            _configuration = appConfig;
            _logError = logError;
        }

        #endregion

        public List<CampaignConflitView> GetDataDemo()
        {
            string s = "אבגדaAbBcCdDeEFfgGaAbBcCdDeEFfgGaAbBcCdDeEFfgGaAbBcCdDeEFfgGaAbBcCdDeEFfgGaAbBcCdDeEFfgGaAbBcCdDeEFfgGaAbBcCdDeEFfgGaAbBcCdDeEFfgGaAbBcCdDeEFfgG";
            char[] ch = s.ToCharArray();
            var data = new List<CampaignConflitView>();
            ;
            int i = 0;
            while (i < 28)
            {
                data.Add(new CampaignConflitView
                {
                    TypeCode = i.ToString(),
                    CampaignId = Guid.NewGuid(),
                    CampaignName = ch[i].ToString(),
                    CampaignSubtypeId = Guid.NewGuid(),
                    CampaignApprovalStatus = true.ToString(),
                    ProposedStartDate = DateTime.Now.AddDays(i),
                    ProposedEndDate = DateTime.Now.AddDays(i),
                    ConflitContacts = i,
                    ListId = Guid.NewGuid(),
                    ListName = ch[i].ToString(),
                    CampaignSubtypeName = "dd"
                });
                i++;
            }
            return data.AsEnumerable().OrderBy(r => r.CampaignName).ToList();
        }

        public string GetCampNameByCampaignId(Guid CampaignId)
        {
            string name = "mock";
            
            return name;
        }

        public IEnumerable<CampaignConflitView> GetData(Guid campaignId, DateTime startDate, DateTime endDate)
        {
            return  this.GetDataDemo();
        }
    }
}
