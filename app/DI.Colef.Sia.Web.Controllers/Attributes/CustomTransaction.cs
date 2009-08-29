using System;
using NHibernate;
using SharpArch.Data.NHibernate;
using SharpArch.Web.NHibernate;

namespace DecisionesInteligentes.Colef.Sia.Web
{
    public class CustomTransactionAttribute : TransactionAttribute
    {
        readonly string factoryKey;

        public CustomTransactionAttribute(string factoryKey) : base(factoryKey)
        {
            this.factoryKey = factoryKey;
        }

        public CustomTransactionAttribute()
        {
        }

        public override void OnActionExecuted(System.Web.Mvc.ActionExecutedContext filterContext)
        {
            string effectiveFactoryKey = GetEffectiveFactoryKey();

            ITransaction currentTransaction =
                NHibernateSession.CurrentFor(effectiveFactoryKey).Transaction;

            if (currentTransaction.IsActive)
            {
                if (filterContext.Exception == null && filterContext.Controller.ViewData["Rollback"] == null)
                {
                    currentTransaction.Commit();
                }
                else
                {
                    currentTransaction.Rollback();
                }
            }
        }

        string GetEffectiveFactoryKey()
        {
            return String.IsNullOrEmpty(factoryKey)
                    ? NHibernateSession.DefaultFactoryKey
                    : factoryKey;
        }

    }
}