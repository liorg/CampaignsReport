using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Guardian.Taglit.ServiceLibrary.DataModel;
using System.Configuration;
using System.Globalization;
namespace Guardian.Taglit.ServiceLibrary
{
   
}
namespace Guardian.Taglit.ServiceLibrary.Application
{
    public interface IFilterData
    {
         string StartDate { get; }
         string EndDate { get; }
         Guid CampaignId { get; }
         Configuration Config { get; }
         Action<Exception ,string> Log {get;}

    }
    
    public class Presentor
    {
      
        private const string Culture = "en-US";

        private static List<SchemaDetail> _schema;

        private static object objLock = new object();

     
        public List<SchemaDetail> Schema
        {
            get
            {
                if (_schema == null)
                {
                    lock (objLock)
                    {
                        if (_schema == null)
                        {
                            _schema = new List<SchemaDetail>();
                            _schema.Add(new SchemaDetail
                            {
                                FieldName = FieldName.ListName,
                                Title = "Marketing List",
                                TypeField = typeof(string),
                                Width = 100,
                                FieldSchemaName = "ListName",
                                Order = 1,
                                IsLinkable = true,
                                EntityName = "marketlist",
                                EntityId="ListId"
                            });
                            _schema.Add(new SchemaDetail
                            {
                                FieldName = FieldName.MemberCount,
                                Title = "Member Count",
                                TypeField = typeof(string),
                                Width = 60,
                                FieldSchemaName = "MemberCount",
                                Order = 1,
                                IsLinkable = false,
                                EntityName = "",
                                EntityId = ""
                            });
                            _schema.Add(new SchemaDetail
                            {
                                FieldName = FieldName.CampaignName,
                                Title = "Conflicting campaign name",
                                TypeField = typeof(string),
                                Width = 100,
                                FieldSchemaName = "CampaignName",
                                Order = 2,
                                IsLinkable = true,
                                EntityName = "campaign",
                                EntityId = "CampaignId"
                            });

                            _schema.Add(new SchemaDetail
                            {
                                FieldName = FieldName.TypeCode,
                                Title = "Conflicting Campaign Type",
                                TypeField = typeof(string),
                                Width = 60,
                                FieldSchemaName = "TypeCode",
                                Order = 3,
                                IsLinkable = false,
                                EntityName = ""
                            });

                            _schema.Add(new SchemaDetail
                            {
                                FieldName = FieldName.CampaignSubtypeName,
                                Title = "Conflicting Campaign Sub Type",
                                TypeField = typeof(string),
                                Width = 100,
                                FieldSchemaName = "CampaignSubtypeName",
                                Order = 4,
                                IsLinkable = true,
                                EntityName = "new_campaignsubtype",
                                EntityId = "CampaignSubtypeId"
                            });

                            _schema.Add(new SchemaDetail
                            {
                                FieldName = FieldName.ProposedStartDate,
                                Title = "Proposed Start Date",
                                TypeField = typeof(string),
                                Width = 110,
                                FieldSchemaName = "ProposedStartDate",
                                Order =5,
                                IsLinkable = false,
                                EntityName = ""
                            });

                            _schema.Add(new SchemaDetail
                            {
                                FieldName = FieldName.ProposedEndDate,
                                Title = "Proposed End Dat",
                                TypeField = typeof(string),
                                Width = 110,
                                FieldSchemaName = "ProposedEndDate",
                                Order = 6,
                                IsLinkable = false,
                                EntityName = ""
                            });

                            _schema.Add(new SchemaDetail
                            {
                                FieldName = FieldName.CampaignApprovalStatus,
                                Title = "Conflicting Campaign Status",
                                TypeField = typeof(string),
                                Width = 100,
                                FieldSchemaName = "CampaignApprovalStatus",
                                Order = 6,
                                IsLinkable = false,
                                EntityName = ""
                            });

                            _schema.Add(new SchemaDetail
                            {
                                FieldName = FieldName.ConflitContacts,
                                Title = "No Of Conflicts",
                                TypeField = typeof(string),
                                Width = 60,
                                FieldSchemaName = "ConflitContacts",
                                Order =7,
                                IsLinkable = false,
                                EntityName = ""
                            });
                            _schema.Add(new SchemaDetail
                            {
                                FieldName = FieldName.Avg,
                                Title = "% conflict",
                                TypeField = typeof(string),
                                Width = 100,
                                FieldSchemaName = "Avg",
                                Order = 7,
                                IsLinkable = false,
                                EntityName = ""
                            });
                        }
                    }
                }
                return _schema;
            }
        }

        public string GetCampNameByCampaignId(IFilterData filterData)
        {
            string name = "";
            var service = new ServiceCampaign(filterData.Config, filterData.Log);
            name = service.GetCampNameByCampaignId(filterData.CampaignId);
            return name;
        }

        public List<CampaignConflitView> GetData(IFilterData filterData)
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
