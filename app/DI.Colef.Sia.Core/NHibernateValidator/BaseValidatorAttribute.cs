using System;
using System.Linq.Expressions;
using System.Reflection;
using DecisionesInteligentes.Colef.Sia.Core.DataInterfaces;
using NHibernate.Validator.Engine;
using SharpArch.Core.DomainModel;

namespace DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator
{
    public class BaseValidatorAttribute<TValidator> : IInitializableValidator<TValidator> where TValidator : Attribute
    {
        protected bool ValidateIsNullOrEmpty<TEntity>(Entity entity, Expression<Func<TEntity, object>> expression,
                                                      IConstraintValidatorContext constraintValidatorContext)
        {
            return ValidateIsNullOrEmpty(entity, expression, null, constraintValidatorContext);
        }

        protected bool ValidateIsNullOrEmpty<TEntity>(Entity entity, Expression<Func<TEntity, object>> expression, string fieldName,
                                                      IConstraintValidatorContext constraintValidatorContext)
        {
            var isInvalid = false;

            PropertyInfo propertyInfo = ReflectionHelper.GetProperty(expression);
            var value = propertyInfo.GetValue(entity, null);

            if (value == null)
            {
                isInvalid = true;
            }
            else if (value.GetType() == typeof(String))
            {
                var stringValue = value.ToString().Trim();
                isInvalid = stringValue == String.Empty;
            }
            else if (value.GetType() == typeof(int))
            {
                var intValue = (int)value;
                isInvalid = intValue <= 0;
            }
            else if (value.GetType() == typeof(DateTime))
            {
                var dateValue = (DateTime)value;
                isInvalid = dateValue <= DateTime.Parse("1980-01-01");

                if (isInvalid)
                {

                    constraintValidatorContext.AddInvalid(
                        "formato de fecha no válido|" + (fieldName ?? propertyInfo.Name), fieldName ?? propertyInfo.Name);
                    constraintValidatorContext.DisableDefaultError();
                }

                return isInvalid;
            }

            if (isInvalid)
            {
                constraintValidatorContext.AddInvalid(
                    "no puede ser nulo, vacío o cero|" + (fieldName ?? propertyInfo.Name), fieldName ?? propertyInfo.Name);
                constraintValidatorContext.DisableDefaultError();
            }

            return isInvalid;
        }

        public virtual void Initialize(TValidator parameters)
        {
            // Do nothing here
        }

        public virtual bool IsValid(object value, IConstraintValidatorContext constraintValidatorContext)
        {
            throw new NotImplementedException();
        }
    }
}