using System;
using NHibernate.Validator.Engine;

namespace DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator
{
    [AttributeUsage(AttributeTargets.Class)]
    [ValidatorClass(typeof(ResenaValidator))]
    public class ResenaValidatorAttribute : Attribute, IRuleArgs
    {
        public ResenaValidatorAttribute()
        {
            Message = "Entidad invalidad";
        }

        public string Message { get; set; }
    }

    public class ResenaValidator : BaseValidatorAttribute<ResenaValidatorAttribute>
    {
        public override void Initialize(ResenaValidatorAttribute parameters)
        {
        }

        public override bool IsValid(object value, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;
            var resena = value as Resena;

            if (!resena.IsTransient())
            {

            }

            //if (resena.TipoResena != null)
            //    isValid &= ValidateTipoResena(resena, constraintValidatorContext);
            
            return isValid;
        }

        bool ValidateTipoResena(Resena resena, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;

            if (resena.RevistaPublicacion == null)
            {
                constraintValidatorContext.AddInvalid(
                    "no puede ser nulo, vacío o cero|RevistaPublicacionTitulo", "RevistaPublicacionTitulo");

                isValid = false;
            }

            if (resena.AreaTematica == null)
            {
                constraintValidatorContext.AddInvalid(
                    "seleccione el área temática|AreaTematicaId", "AreaTematicaId");

                isValid = false;
            }

            if (resena.EstadoProducto == 0)
            {
                constraintValidatorContext.AddInvalid(
                    "seleccione el estatus de la publicación|EstadoProducto", "EstadoProducto");

                isValid = false;
            }

            if (resena.TipoResena == 2)
            {
                if (resena.TituloLibro == "")
                {
                    constraintValidatorContext.AddInvalid(
                        "no debe ser nulo o vacío o cero|TituloLibro", "TituloLibro");

                    isValid = false;
                }

                if (resena.Pais == null)
                {
                    constraintValidatorContext.AddInvalid(
                        "seleccione el país|Pais", "Pais");

                    isValid = false;
                }
            }

            //Estado Producto - Aceptado
            if (resena.EstadoProducto == 2)
            {
                if (resena.FechaAceptacion <= DateTime.Parse("1910-01-01"))
                {
                    constraintValidatorContext.AddInvalid(
                        "formato de fecha no válido|FechaAceptacion", "FechaAceptacion");

                    isValid = false;
                }

                if (resena.FechaAceptacion > DateTime.Now)
                {
                    constraintValidatorContext.AddInvalid(
                        "la fecha no puede estar en el futuro|FechaAceptacion", "FechaAceptacion");
                    isValid = false;
                }
            }

            //Estado Producto - Publicado
            if (resena.EstadoProducto == 3)
            {
                if (resena.FechaPublicacion <= DateTime.Parse("1910-01-01"))
                {
                    constraintValidatorContext.AddInvalid(
                        "formato de fecha no válido|FechaPublicacion", "FechaPublicacion");

                    isValid = false;
                }

                if (resena.FechaPublicacion > DateTime.Now)
                {
                    constraintValidatorContext.AddInvalid(
                        "la fecha no puede estar en el futuro|FechaPublicacion", "FechaPublicacion");
                    isValid = false;
                }

                if (resena.Volumen == 0)
                {
                    constraintValidatorContext.AddInvalid(
                        "seleccione el volumen|Volumen", "Volumen");

                    isValid = false;
                }

                if (resena.Numero <= 0)
                {
                    constraintValidatorContext.AddInvalid(
                        "no puede ser menor o igual a cero|Numero", "Numero");

                    isValid = false;
                }

                if (resena.PaginaInicial > resena.PaginaFinal)
                {
                    constraintValidatorContext.AddInvalid(
                        "página inicial debe ser menor a la final|PaginaInicial", "PaginaInicial");
                    constraintValidatorContext.AddInvalid(
                        "página final debe ser mayor a la inicial|PaginaFinal", "PaginaFinal");
                    isValid = false;
                }

                if (resena.PaginaInicial == 0 && resena.PaginaFinal == 0)
                {
                    constraintValidatorContext.AddInvalid("página inicial y final no pueden ser cero|PaginaInicial",
                                                          "PaginaInicial");
                    constraintValidatorContext.AddInvalid("página inicial y final no pueden ser cero|PaginaFinal",
                                                          "PaginaFinal");
                    isValid = false;
                }
            }

            if (!isValid)
                constraintValidatorContext.DisableDefaultError();

            return isValid;
        }
    }
}