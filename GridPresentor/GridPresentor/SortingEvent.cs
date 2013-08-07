using System;

namespace MotSite.ServiceLibrary.Application
{
    public class FieldNameSortingEventArgs : EventArgs
    {
        public string FieldName { get; set; }
        public bool IsDesc { get; set; }
    }


    public delegate void FieldNameSortingEventHandler(object sender, FieldNameSortingEventArgs e);

}
