using System;
using NHibernate.Validator.Engine;

namespace DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator
{
    [AttributeUsage(AttributeTargets.Class)]
    [ValidatorClass(typeof(DictamenValidator))]
    public class DictamenValidatorAttribute : Attribute, IRuleArgs
    {
        public DictamenValidatorAttribute()
        {
            Message = "Entidad invalidad";
        }

        public string Message { get; set; }
    }

    public class DictamenValidator : BaseValidatorAttribute<DictamenValidatorAttribute>
    {
        public override void Initialize(DictamenValidatorAttribute parameters)
        {
        }

        public override bool IsValid(object value, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;
            var dictamen = value as Dictamen;

            if (!dictamen.IsTransient())
            {/*
                isValid &= !ValidateIsNullOrEmpty<Dictamen>(dictamen, x => x.TipoDictamen, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Dictamen>(dictamen, x => x.TipoParticipacion,
                                                            constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Dictamen>(dictamen, x => x.Institucion, "InstitucionNombre", constraintValidatorContext); */
            }

            isValid &= ValidateProductoDictaminado(dictamen, constraintValidatorContext);

            return isValid;
        }

        private bool ValidateProductoDictaminado(Dictamen dictamen, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;

            if (dictamen.TipoDictamen != null)
            {
                var lowerCaseName = dictamen.TipoDictamen.Nombre.ToLower();

                //Tipo Dictamen - Articulo
                if (lowerCaseName.Contains("artículo"))
                {
                    if (dictamen.RevistaPublicacion == null)
                    {
                        constraintValidatorContext.AddInvalid(
                            "no puede ser nulo, vacío o cero|RevistaPublicacionTitulo", "RevistaPublicacionTitulo");

                        isValid = false;
                    }
                }

                //Tipo Dictamen - Capitulo en libro y Libro
                if (lowerCaseName.Contains("libro"))
                {
                    if (dictamen.Editorial == null)
                    {
                        constraintValidatorContext.AddInvalid(
                            "seleccione la editorial|Editorial", "Editorial");

                        isValid = false;
                    }
                }

                //Tipo Dictamen - Proyecto de investigacion CONACyT
                if (lowerCaseName.Contains("proyecto"))
                {
                    if (dictamen.FondoConacyt == null)
                    {
                        constraintValidatorContext.AddInvalid(
                            "seleccione el tipo de proyecto|FondoConacyt", "FondoConacyt");

                        isValid = false;
                    }
                }
            }
            else
            {
                constraintValidatorContext.AddInvalid(
                    "seleccione el producto dictaminado|TipoDictamen", "TipoDictamen");

                isValid = false;
            }

            if (!isValid)
                constraintValidatorContext.DisableDefaultError();

            return isValid;
        }
    }
}