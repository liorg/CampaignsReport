using System;
using System.Collections.Generic;
using System.Configuration;

namespace MotSite.ServiceLibrary.Application
{
    public interface IFilterData : ILogAndConfig
    {
        string StartDate { get; }
        string EndDate { get; }
        Guid EntityGuidId { get; }
    }
   
    public interface ILogAndConfig
    {
        Configuration Config { get; }
        Action<Exception, string> Log { get; }
    }

    public abstract class PresentorBase<T>
    {
        public abstract List<T> GetData(IFilterData filterData);

    }

}
