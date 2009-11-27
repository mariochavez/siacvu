using System;
using NHibernate.Validator.Engine;

namespace DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator
{
    [AttributeUsage(AttributeTargets.Class)]
    [ValidatorClass(typeof(LibroValidator))]
    public class LibroValidatorAttribute : Attribute, IRuleArgs
    {
        public LibroValidatorAttribute()
        {
            Message = "Entidad invalidad";
        }

        public string Message { get; set; }
    }

    public class LibroValidator : BaseValidatorAttribute<LibroValidatorAttribute>
    {
        public override void Initialize(LibroValidatorAttribute parameters)
        {
        }

        public override bool IsValid(object value, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;
            var libro = value as Libro;

            if (!libro.IsTransient())
            {/*
                isValid &= !ValidateIsNullOrEmpty<Libro>(libro, x => x.TipoPublicacion, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Libro>(libro, x => x.EstadoProducto, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Libro>(libro, x => x.LineaTematica, "LineaTematicaNombre",
                                                          constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Libro>(libro, x => x.FechaAceptacion, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Libro>(libro, x => x.Editorial, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Libro>(libro, x => x.Pais, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Libro>(libro, x => x.NoPaginas, constraintValidatorContext); */
            }

            if (libro.FormatoPublicacion != 0)
                isValid &= ValidateFormatoPublicacion(libro, constraintValidatorContext);

            if(libro.EstadoProducto != 0)
                isValid &= ValidateEstadoProducto(libro, constraintValidatorContext);

            isValid &= TieneProyecto(libro, constraintValidatorContext);

            return isValid;
        }

        bool ValidateFormatoPublicacion(Libro libro, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;

            //Tipo Publicacion - Memoria de evento
            if (libro.FormatoPublicacion == 2)
            {
                if (libro.Evento == null)
                {
                    constraintValidatorContext.AddInvalid(
                        "no puede ser nulo, vacío o cero|EventoNombre", "EventoNombre");

                    isValid = false;
                }
            }

            //Tipo Publicacion - Numero especial de revista
            if (libro.FormatoPublicacion == 3)
            {
                if (libro.RevistaPublicacion == null)
                {
                    constraintValidatorContext.AddInvalid(
                        "no puede ser nulo, vacío o cero|RevistaPublicacionTitulo", "RevistaPublicacionTitulo");

                    isValid = false;
                }

                if (libro.Numero <= 0)
                {
                    constraintValidatorContext.AddInvalid(
                        "no puede ser menor o igual a cero|Numero", "Numero");

                    isValid = false;
                }
            }

            if (!isValid)
                constraintValidatorContext.DisableDefaultError();

            return isValid;
        }

        bool ValidateEstadoProducto(Libro libro, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;

            //Estado Producto - Aceptado
            if (libro.EstadoProducto == 1)
            {
                if (libro.FechaAceptacion <= DateTime.Parse("1910-01-01"))
                {
                    constraintValidatorContext.AddInvalid(
                        "formato de fecha no válido|FechaAceptacion", "FechaAceptacion");

                    isValid = false;
                }

                if (libro.FechaAceptacion > DateTime.Now)
                {
                    constraintValidatorContext.AddInvalid(
                        "la fecha no puede estar en el futuro|FechaAceptacion", "FechaAceptacion");
                    isValid = false;
                }
            }

            //Estado Producto - Publicado
            if (libro.EstadoProducto == 2)
            {
                if (libro.FechaPublicacion <= DateTime.Parse("1910-01-01"))
                {
                    constraintValidatorContext.AddInvalid(
                        "formato de fecha no válido|FechaPublicacion", "FechaPublicacion");

                    isValid = false;
                }

                if (libro.FechaPublicacion > DateTime.Now)
                {
                    constraintValidatorContext.AddInvalid(
                        "la fecha no puede estar en el futuro|FechaPublicacion", "FechaPublicacion");
                    isValid = false;
                }
            }

            if (!isValid)
                constraintValidatorContext.DisableDefaultError();

            return isValid;
        }

        bool TieneProyecto(Libro libro, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;

            if (libro.TieneProyecto)
            {
                if (libro.Proyecto == null)
                {
                    constraintValidatorContext.AddInvalid("no puede ser nulo, vacío o cero|ProyectoNombre",
                                                          "ProyectoNombre");

                    isValid = false;
                }
            }

            if (!isValid)
                constraintValidatorContext.DisableDefaultError();

            return isValid;
        }
    }
}