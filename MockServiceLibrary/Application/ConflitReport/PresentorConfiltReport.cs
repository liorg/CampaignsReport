using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Guardian.Taglit.ServiceLibrary;
using Guardian.Taglit.ServiceLibrary.DataModel;
using System.Globalization;

namespace MotSite.ServiceLibrary
{

}
namespace MotSite.ServiceLibrary.Application.ConflitReport
{

    public class PresentorConfiltReport : PresentorBase<CampaignConflitView>
    {

        private const string Culture = "en-US";

        public string GetCampNameByCampaignId(IFilterData filterData)
        {
            string name = "";
            var service = new ServiceCampaign(filterData.Config, filterData.Log);
            name = service.GetCampNameByCampaignId(filterData.EntityGuidId);
            return name;
        }

        public override List<CampaignConflitView> GetData(IFilterData filterData)
        {

            return GetDataDemo(filterData).ToList();
        }

        public List<CampaignConflitView> GetDataDemo(IFilterData filterData)
        {
            var service = new ServiceCampaign(filterData.Config, filterData.Log);
            var startDate = DateTime.ParseExact(filterData.StartDate,
                             ConstVars.DATE_FORMAT,
                              new CultureInfo(Culture));

            var endDate = DateTime.ParseExact(filterData.EndDate,
                             ConstVars.DATE_FORMAT,
                             new CultureInfo(Culture));
            return service.GetDataDemo().ToList();
        }

       
    }
}
