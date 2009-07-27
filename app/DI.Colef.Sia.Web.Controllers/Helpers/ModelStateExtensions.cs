using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using SharpArch.Core.CommonValidator;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers
{
    public static class ModelStateExtensions
    {
        public static bool IsInvalid(this ModelStateDictionary state)
        {
            return !state.IsValid;
        }

        public static bool IsInvalid(this ModelStateDictionary state, string prefix)
        {
            if (state.IsValid) return false;
            return state.Count(kvp => kvp.Key.StartsWith(prefix) && kvp.Value.Errors.Count > 0) > 0;
        }

        public static void AddModelErrors(this ModelStateDictionary state, ICollection<IValidationResult> errors)
        {
            foreach (IValidationResult error in errors)
            {
                state.AddModelError(error.PropertyName ?? "Entity", error.Message);
            }
        }
    }

}
