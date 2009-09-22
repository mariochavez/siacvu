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
            {
                isValid &= !ValidateIsNullOrEmpty<Libro>(libro, x => x.TipoPublicacion, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Libro>(libro, x => x.EstadoProducto, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Libro>(libro, x => x.LineaTematica, "LineaTematicaNombre",
                                                          constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Libro>(libro, x => x.FechaAceptacion, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Libro>(libro, x => x.Editorial, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Libro>(libro, x => x.Pais, constraintValidatorContext);
                isValid &= !ValidateIsNullOrEmpty<Libro>(libro, x => x.NoPaginas, constraintValidatorContext);
            }

            isValid &= ValidateFechas(libro, constraintValidatorContext);
            isValid &= TieneProyecto(libro, constraintValidatorContext);

            if (libro.TipoPublicacion != null)
                isValid &= ValidateTipoPublicacion(libro, constraintValidatorContext);

            if(libro.EstadoProducto != null)
                isValid &= ValidateEstadoProducto(libro, constraintValidatorContext);

            return isValid;
        }

        bool TieneProyecto(Libro libro, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;

            if (libro.TieneProyecto)
            {
                if (libro.Proyecto == null)
                {
                    constraintValidatorContext.AddInvalid("seleccione el proyecto|Proyecto", "Proyecto");

                    isValid = false;
                }
            }

            if (!isValid)
                constraintValidatorContext.DisableDefaultError();

            return isValid;
        }

        bool ValidateFechas(Libro libro, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;

            if (libro.FechaAceptacion == DateTime.Parse("1900-01-01"))
            {
                constraintValidatorContext.AddInvalid(
                    "formato de fecha no válido|FechaAceptacion", "FechaAceptacion");
                isValid = false;
            }

            if (libro.FechaEdicion == DateTime.Parse("1900-01-01"))
            {
                constraintValidatorContext.AddInvalid(
                    "formato de fecha no válido|FechaEdicion", "FechaEdicion");
                isValid = false;
            }

            if (libro.FechaEvento == DateTime.Parse("1900-01-01"))
            {
                constraintValidatorContext.AddInvalid(
                    "formato de fecha no válido|FechaEvento", "FechaEvento");
                isValid = false;
            }

            if (libro.FechaAceptacion > DateTime.Now)
            {
                constraintValidatorContext.AddInvalid(
                    "el año no puede estar en el futuro|FechaAceptacion", "FechaAceptacion");
                isValid = false;
            }

            if (libro.FechaEdicion > DateTime.Now)
            {
                constraintValidatorContext.AddInvalid(
                    "el año no puede estar en el futuro|FechaEdicion", "FechaEdicion");
                isValid = false;
            }

            if (libro.FechaEvento > DateTime.Now)
            {
                constraintValidatorContext.AddInvalid(
                    "el año no puede estar en el futuro|FechaEvento", "FechaEvento");
                isValid = false;
            }

            if (!isValid)
                constraintValidatorContext.DisableDefaultError();

            return isValid;
        }

        bool ValidateEstadoProducto(Libro libro, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;

            //Estado Producto - Publicado
            if (libro.EstadoProducto.Nombre.Contains("Publicado"))
            {
                if (libro.ISBN == "")
                {
                    constraintValidatorContext.AddInvalid(
                        "no puede ser nulo, vacío o cero|ISBN", "ISBN");

                    isValid = false;
                }

                if (libro.FechaEdicion <= DateTime.Parse("1980-01-01"))
                {
                    constraintValidatorContext.AddInvalid(
                        "formato de fecha no Válido|FechaEdicion", "FechaEdicion");

                    isValid = false;
                }
            }

            if (!isValid)
                constraintValidatorContext.DisableDefaultError();

            return isValid;
        }

        bool ValidateTipoPublicacion(Libro libro, IConstraintValidatorContext constraintValidatorContext)
        {
            var isValid = true;

            //Tipo Publicacion - Coordinacion de libro sin/con arbitraje
            if (libro.TipoPublicacion.Nombre.Contains("Coordinación de libro"))
            {
                if (libro.FormaParticipacion == null)
                {
                    constraintValidatorContext.AddInvalid(
                        "seleccione la forma de participación|FormaParticipacion", "FormaParticipacion");

                    isValid = false;
                }
            }

            //Tipo Publicacion - Coordinacion de memoria
            if (libro.TipoPublicacion.Nombre.Contains("de memoria"))
            {
                if (libro.NombreEvento == null)
                {
                    constraintValidatorContext.AddInvalid(
                        "seleccione el evento|NombreEvento", "NombreEvento");

                    isValid = false;
                }
            }

            //Tipo Publicacion - Coordinacion de un numero especial de revista
            if (libro.TipoPublicacion.Nombre.Contains("número especial de revista"))
            {
                if (libro.NombreRevista == null)
                {
                    constraintValidatorContext.AddInvalid(
                        "no puede ser nulo, vacío o cero|NombreRevistaTitulo", "NombreRevistaTitulo");

                    isValid = false;
                }

                if (libro.Institucion == null)
                {
                    constraintValidatorContext.AddInvalid(
                        "no puede ser nulo, vacío o cero|InstitucionNombre", "InstitucionNombre");

                    isValid = false;
                }

                if (libro.EstadoProducto != null)
                {
                    if (libro.EstadoProducto.Nombre.Contains("Publicado"))
                    {
                        if (libro.Numero == 0)
                        {
                            constraintValidatorContext.AddInvalid(
                                "no puede ser nulo, vacío o cero|Numero", "Numero");

                            isValid = false;
                        }

                        if (libro.Volumen == "")
                        {
                            constraintValidatorContext.AddInvalid(
                                "no puede ser nulo, vacío o cero|Volumen", "Volumen");

                            isValid = false;
                        }
                    }
                }
            }

            //Tipo Publicacion - Libro traducido a otro idioma
            if (libro.TipoPublicacion.Nombre.Contains("otro idioma"))
            {
                if (libro.Idioma == null)
                {
                    constraintValidatorContext.AddInvalid(
                        "seleccione el idioma de tradución|Idioma", "Idioma");

                    isValid = false;
                }

                if (libro.Traductor == false)
                {
                    constraintValidatorContext.AddInvalid(
                        "seleccione el traductor|Traductor", "Traductor");

                    isValid = false;
                }

                else
                {
                    if (libro.NombreTraductor == "")
                    {
                        constraintValidatorContext.AddInvalid(
                            "no puede ser nulo, vacío o cero|NombreTraductor", "NombreTraductor");

                        isValid = false;
                    }
                }
            }

            if (!isValid)
                constraintValidatorContext.DisableDefaultError();

            return isValid;
        }
    }
}