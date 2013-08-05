using System;

namespace Guardian.Taglit.ServiceLibrary.Application
{
    public class FieldNameSortingEventArgs : EventArgs
    {
        public FieldName FieldName { get; set; }
        public bool IsDesc { get; set; }
    }


    public delegate void FieldNameSortingEventHandler(object sender, FieldNameSortingEventArgs e);

}
