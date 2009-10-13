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

            isValid &= ResenaTraducida(resena, constraintValidatorContext);

            if (resena.TipoResena != null)
                isValid &= ValidateTipoResena(resena, constraintValidatorContext);

            if (resena.EstadoProducto != null)
                isValid &= ValidateEstadoProducto(resena, constraintValidatorContext);
            
            return isValid;
        }

        bool ValidateTipoResena(Resena resena, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;

            if (resena.TipoResena == null)
            {
                constraintValidatorContext.AddInvalid(
                    "debe seleccionar el tipo de publicación|TipoResena", "TipoResena");

                isValid = false;
            }

            else
            {
                if (resena.RevistaPublicacion == null)
                {
                    constraintValidatorContext.AddInvalid(
                        "no puede ser nulo, vacío o cero|RevistaPublicacionTitulo", "RevistaPublicacionTitulo");

                    isValid = false;
                }

                if (resena.LineaTematica == null)
                {
                    constraintValidatorContext.AddInvalid(
                        "no puede ser nulo, vacío o cero|LineaTematicaNombre", "LineaTematicaNombre");

                    isValid = false;
                }

                if (resena.EstadoProducto == null)
                {
                    constraintValidatorContext.AddInvalid(
                        "no debe ser nulo o vacío o cero|EstadoProducto", "EstadoProducto");

                    isValid = false;
                }

                if (resena.TipoResena.Nombre.Contains("Reseña bibliográfica"))
                {
                    if (resena.TituloLibro == "")
                    {
                        constraintValidatorContext.AddInvalid(
                            "no debe ser nulo o vacío o cero|TituloLibro", "TituloLibro");

                        isValid = false;
                    }

                    if (resena.FechaEdicion == DateTime.Parse("1900-01-01"))
                    {
                        constraintValidatorContext.AddInvalid(
                            "formato de fecha no válido|FechaEdicion", "FechaEdicion");
                        isValid = false;
                    }

                    if (resena.FechaEdicion > DateTime.Now)
                    {
                        constraintValidatorContext.AddInvalid(
                            "el año no puede estar en el futuro|FechaEdicion", "FechaEdicion");
                        isValid = false;
                    }

                    if (resena.Institucion == null)
                    {
                        constraintValidatorContext.AddInvalid(
                            "no puede ser nulo, vacío o cero|InstitucionNombre", "InstitucionNombre");

                        isValid = false;
                    }

                    if (resena.Editorial == "")
                    {
                        constraintValidatorContext.AddInvalid(
                            "no debe ser nulo o vacío o cero|Editorial", "Editorial");

                        isValid = false;
                    }

                    if (resena.Pais == null)
                    {
                        constraintValidatorContext.AddInvalid(
                            "no puede ser nulo, vacío o cero|Pais", "Pais");

                        isValid = false;
                    }
                }
            }

            if (!isValid)
                constraintValidatorContext.DisableDefaultError();

            return isValid;
        }

        bool ValidateEstadoProducto(Resena resena, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;

            //Estado Producto - Aceptado
            if (resena.EstadoProducto.Nombre.Contains("Aceptado"))
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
            if (resena.EstadoProducto.Nombre.Contains("Publicado"))
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

                if (resena.Volumen == "")
                {
                    constraintValidatorContext.AddInvalid(
                        "no debe ser nulo o vacío o cero|Volumen", "Volumen");

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
                    constraintValidatorContext.AddInvalid("página inicial y final no pueden ser cero|PaginaInicial", "PaginaInicial");
                    constraintValidatorContext.AddInvalid("página inicial y final no pueden ser cero|PaginaFinal", "PaginaFinal");
                    isValid = false;
                }
            }

            if (!isValid)
                constraintValidatorContext.DisableDefaultError();

            return isValid;
        }

        bool ResenaTraducida(Resena resena, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;

            if (resena.ResenaTraducida)
            {
                if (resena.Idioma == null)
                {
                    constraintValidatorContext.AddInvalid("seleccione el idioma|Idioma", "Idioma");

                    isValid = false;
                }
            }

            if (!isValid)
                constraintValidatorContext.DisableDefaultError();

            return isValid;
        }
    }
}