using System;
using NHibernate.Validator.Engine;

namespace DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator
{
    [AttributeUsage(AttributeTargets.Class)]
    [ValidatorClass(typeof(ObraTraducidaValidator))]
    public class ObraTraducidaValidatorAttribute : Attribute, IRuleArgs
    {
        public ObraTraducidaValidatorAttribute()
        {
            Message = "Entidad invalidad";
        }

        public string Message { get; set; }
    }

    public class ObraTraducidaValidator : BaseValidatorAttribute<ObraTraducidaValidatorAttribute>
    {
        public override void Initialize(ObraTraducidaValidatorAttribute parameters)
        {
        }

        public override bool IsValid(object value, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;
            var obraTraducida = value as ObraTraducida;

            if (!obraTraducida.IsTransient())
            {

            }

            if (obraTraducida.EstadoProducto != 0)
                isValid &= ValidateProductoEstado(obraTraducida, constraintValidatorContext);

            if (obraTraducida.TipoObraTraducida != 0)
                isValid &= ValidateTipoObraTraducida(obraTraducida, constraintValidatorContext);

            return isValid;
        }

        bool ValidateTipoObraTraducida(ObraTraducida obraTraducida, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;

            if (obraTraducida.TipoObraTraducida == 1)
            {
                if (obraTraducida.PaginaInicial > obraTraducida.PaginaFinal)
                {
                    constraintValidatorContext.AddInvalid(
                        "página inicial debe ser menor a la final|PaginaInicial", "PaginaInicial");
                    constraintValidatorContext.AddInvalid(
                        "página final debe ser mayor a la inicial|PaginaFinal", "PaginaFinal");
                    isValid = false;
                }

                if (obraTraducida.PaginaInicial == 0 && obraTraducida.PaginaFinal == 0)
                {
                    constraintValidatorContext.AddInvalid("página inicial y final no pueden ser cero|PaginaInicial", "PaginaInicial");
                    constraintValidatorContext.AddInvalid("página inicial y final no pueden ser cero|PaginaFinal", "PaginaFinal");
                    isValid = false;
                }

                if (obraTraducida.Volumen == 0)
                {
                    constraintValidatorContext.AddInvalid(
                        "no debe ser nulo o vacío|Volumen", "Volumen");

                    isValid = false;
                }

                if (obraTraducida.Numero == 0)
                {
                    constraintValidatorContext.AddInvalid(
                        "no debe ser nulo, vacío o cero|Numero", "Numero");

                    isValid = false;
                }

                if (obraTraducida.RevistaPublicacion == null)
                {
                    constraintValidatorContext.AddInvalid(
                        "no debe ser nulo, vacío o cero|RevistaPublicacionTitulo", "RevistaPublicacionTitulo");

                    isValid = false;
                }
            }

            if (obraTraducida.TipoObraTraducida == 2)
            {
                if (obraTraducida.ISBN == "")
                {
                    constraintValidatorContext.AddInvalid(
                        "no debe ser nulo o vacío|ISBN", "ISBN");

                    isValid = false;
                }

                if (obraTraducida.Edicion == 0)
                {
                    constraintValidatorContext.AddInvalid(
                        "seleccione una edición|Edicion", "Edicion");

                    isValid = false;
                }

                if (obraTraducida.Reimpresion == 0)
                {
                    constraintValidatorContext.AddInvalid(
                        "seleccione una reimpresión|Reimpresion", "Reimpresion");

                    isValid = false;
                }

                if (obraTraducida.Volumen == 0)
                {
                    constraintValidatorContext.AddInvalid(
                        "no debe ser nulo o vacío|Volumen", "Volumen");

                    isValid = false;
                }

                if (obraTraducida.NoPaginas == 0)
                {
                    constraintValidatorContext.AddInvalid(
                        "no debe ser nulo o vacío|NoPaginas", "NoPaginas");

                    isValid = false;
                }

                if (obraTraducida.Tiraje == 0)
                {
                    constraintValidatorContext.AddInvalid(
                        "no debe ser nulo o vacío|Tiraje", "Tiraje");

                    isValid = false;
                }
            }

            if (obraTraducida.TipoObraTraducida == 3)
            {
                if (obraTraducida.Volumen == 0)
                {
                    constraintValidatorContext.AddInvalid(
                        "no debe ser nulo o vacío|Volumen", "Volumen");

                    isValid = false;
                }

                if (obraTraducida.NoPaginas == 0)
                {
                    constraintValidatorContext.AddInvalid(
                        "no debe ser nulo o vacío|NoPaginas", "NoPaginas");

                    isValid = false;
                }

                if (obraTraducida.NombreLibro == "")
                {
                    constraintValidatorContext.AddInvalid(
                        "no debe ser nulo o vacío|NombreLibro", "NombreLibro");

                    isValid = false;
                }

                if (obraTraducida.TipoLibro == 0)
                {
                    constraintValidatorContext.AddInvalid(
                        "no debe ser nulo o vacío|TipoLibro", "TipoLibro");

                    isValid = false;
                }

                if (obraTraducida.Resumen == "")
                {
                    constraintValidatorContext.AddInvalid(
                        "no debe ser nulo o vacío|Resumen", "Resumen");

                    isValid = false;
                }

                if (obraTraducida.NoCitas == 0)
                {
                    constraintValidatorContext.AddInvalid(
                        "no debe ser nulo o vacío|NoCitas", "NoCitas");

                    isValid = false;
                }
            }

            if (!isValid)
                constraintValidatorContext.DisableDefaultError();

            return isValid;
        }

        bool ValidateProductoEstado(ObraTraducida obraTraducida, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;

            if (obraTraducida.EstadoProducto == 3)
            {
                if (obraTraducida.FechaPublicacion <= DateTime.Parse("1910-01-01"))
                {
                    constraintValidatorContext.AddInvalid(
                        "formato de fecha no válido|FechaPublicacion", "FechaPublicacion");

                    isValid = false;
                }

                if (obraTraducida.FechaPublicacion > DateTime.Now)
                {
                    constraintValidatorContext.AddInvalid(
                        "el año no puede estar en el futuro|FechaPublicacion", "FechaPublicacion");
                    isValid = false;
                }
            }

            if (obraTraducida.EstadoProducto == 2)
            {
                if (obraTraducida.FechaAceptacion <= DateTime.Parse("1910-01-01"))
                {
                    constraintValidatorContext.AddInvalid(
                        "formato de fecha no válido|FechaAceptacion", "FechaAceptacion");

                    isValid = false;
                }

                if (obraTraducida.FechaAceptacion > DateTime.Now)
                {
                    constraintValidatorContext.AddInvalid(
                        "el año no puede estar en el futuro|FechaAceptacion", "FechaAceptacion");
                    isValid = false;
                }
            }

            if (!isValid)
                constraintValidatorContext.DisableDefaultError();

            return isValid;
        }
    }
}