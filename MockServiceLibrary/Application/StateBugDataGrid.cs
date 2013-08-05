using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Guardian.Taglit.ServiceLibrary.Application
{
    [Serializable]
    public class StateBugDataGrid
    {
        public int CurrentPaging { get; set; }
        public int MaxPaging { get; set; }
        public FieldName CurrentFieldName { get; set; }
        public bool IsDesc { get; set; }
        public bool HasData { get; set; }
        public int CurrentDataCount { get; set; }
    }
}
 