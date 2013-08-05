using System;

namespace Guardian.Taglit.ServiceLibrary.Application
{
    public class SchemaDetail
    {
        public FieldName FieldName { get; set; }
        public string Title { get; set; }
        public Type TypeField { get; set; }
        public int Width { get; set; }
        public int Order { get; set; }
        public bool IsLinkable { get; set; }
        public string EntityName { get; set; }
        public string FieldSchemaName { get; set; }
        public string EntityId { get; set; }
    }
}
