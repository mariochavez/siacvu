using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.Web.Extensions;
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
            AddModelErrors(state, errors, false, String.Empty);
        }

        public static void AddModelErrors(this ModelStateDictionary state, ICollection<IValidationResult> errors,
            bool includePrefix, string excludePrefix)
        {
            string[] prefixes = {};
            if (!excludePrefix.IsNullOrEmpty())
                prefixes = excludePrefix.Split(',');

            foreach (IValidationResult error in errors)
            {
                string property = InferPropertyName(error.PropertyName, error.Message);
                if (includePrefix && !prefixes.Contains(error.ClassContext.Name))
                {
                    property = string.Format("{0}.{1}", error.ClassContext.Name, InferPropertyName(error.PropertyName, error.Message));
                }
                
                state.AddModelError(property, StripMessage(error.Message));
            }
        }

        static string InferPropertyName(string propertyName, string message)
        {
            var values = message.Split('|');
            return values.Length == 2 ? values[1] : propertyName ?? "Entity";
        }

        static string StripMessage(string message)
        {
            var values = message.Split('|');
            return values[0];
        }
    }

}
