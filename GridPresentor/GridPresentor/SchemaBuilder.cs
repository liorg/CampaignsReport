
using System.Collections.Generic;
namespace MotSite.ServiceLibrary.Application
{
    
    public abstract class SchemaBuilder
    {
        protected static List<SchemaDetail> _schema;

        protected static object objLock = new object();

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
                            _schema = FillSchemaDetails();
                        }
                    }
                    return _schema;
                }
                return _schema;
            }
        }

        protected abstract List<SchemaDetail> FillSchemaDetails();

        public abstract string DefaultFieldName { get; }

    }

}
