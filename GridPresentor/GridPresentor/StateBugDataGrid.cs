using System;
namespace MotSite.ServiceLibrary.Application
{
    [Serializable]
    public class StateBugDataGrid
    {
        public int CurrentPaging { get; set; }
        public int MaxPaging { get; set; }
        public string CurrentFieldName { get; set; }
        public bool IsDesc { get; set; }
        public bool HasData { get; set; }
        public int CurrentDataCount { get; set; }
    }
}
 