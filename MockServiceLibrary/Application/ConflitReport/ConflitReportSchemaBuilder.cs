
using System.Collections.Generic;

namespace MotSite.ServiceLibrary.Application.ConflitReport
{
    public class ConflitReportSchemaBuilder : SchemaBuilder
    {
        protected override List<SchemaDetail> FillSchemaDetails()
        {
            var schema = new List<SchemaDetail>();

            schema.Add(new SchemaDetail
            {
                FieldName = "ListName",
                Title = "Marketing List",
                TypeField = typeof (string),
                Width = 100,
                FieldSchemaName = "ListName",
                Order = 1,
                IsLinkable = true,
                EntityName = "marketlist",
                EntityId = "ListId"
            });
            schema.Add(new SchemaDetail
            {
                FieldName = "MemberCount",
                Title = "Member Count",
                TypeField = typeof (string),
                Width = 60,
                FieldSchemaName = "MemberCount",
                Order = 1,
                IsLinkable = false,
                EntityName = "",
                EntityId = ""
            });
            schema.Add(new SchemaDetail
            {
                FieldName = "CampaignName",
                Title = "Conflicting campaign name",
                TypeField = typeof (string),
                Width = 100,
                FieldSchemaName = "CampaignName",
                Order = 2,
                IsLinkable = true,
                EntityName = "campaign",
                EntityId = "CampaignId"
            });

            schema.Add(new SchemaDetail
            {
                FieldName = "TypeCode",
                Title = "Conflicting Campaign Type",
                TypeField = typeof (string),
                Width = 60,
                FieldSchemaName = "TypeCode",
                Order = 3,
                IsLinkable = false,
                EntityName = ""
            });

            schema.Add(new SchemaDetail
            {
                FieldName = "CampaignSubtypeName",
                Title = "Conflicting Campaign Sub Type",
                TypeField = typeof (string),
                Width = 100,
                FieldSchemaName = "CampaignSubtypeName",
                Order = 4,
                IsLinkable = true,
                EntityName = "new_campaignsubtype",
                EntityId = "CampaignSubtypeId"
            });

            schema.Add(new SchemaDetail
            {
                FieldName = "ProposedStartDate",
                Title = "Proposed Start Date",
                TypeField = typeof (string),
                Width = 110,
                FieldSchemaName = "ProposedStartDate",
                Order = 5,
                IsLinkable = false,
                EntityName = ""
            });

            schema.Add(new SchemaDetail
            {
                FieldName = "ProposedEndDate",
                Title = "Proposed End Dat",
                TypeField = typeof (string),
                Width = 110,
                FieldSchemaName = "ProposedEndDate",
                Order = 6,
                IsLinkable = false,
                EntityName = ""
            });

            schema.Add(new SchemaDetail
            {
                FieldName = "CampaignApprovalStatus",
                Title = "Conflicting Campaign Status",
                TypeField = typeof (string),
                Width = 100,
                FieldSchemaName = "CampaignApprovalStatus",
                Order = 6,
                IsLinkable = false,
                EntityName = ""
            });

            schema.Add(new SchemaDetail
            {
                FieldName = "ConflitContacts",
                Title = "No Of Conflicts",
                TypeField = typeof (string),
                Width = 60,
                FieldSchemaName = "ConflitContacts",
                Order = 7,
                IsLinkable = false,
                EntityName = ""
            });
            schema.Add(new SchemaDetail
            {
                FieldName = "Avg",
                Title = "% conflict",
                TypeField = typeof (string),
                Width = 100,
                FieldSchemaName = "Avg",
                Order = 7,
                IsLinkable = false,
                EntityName = ""
            });

            return schema;

        }

        public override string DefaultFieldName
        {
            get { return "CampaignName"; }
        }
    }
}
