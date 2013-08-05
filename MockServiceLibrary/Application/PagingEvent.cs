using System;

namespace Guardian.Taglit.ServiceLibrary.Application
{
    public delegate void PagingEventHandler(object sender, PagingEventArgs e);

    public class PagingEventArgs : EventArgs
    {
        public int CurrentPage { get; set; }
        public int MaxPage { get; set; }
    }
}
