using System;
using System.Linq;
using System.Reflection;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    public enum TipoProductoEnum
    {
        Articulo = 1,
        Curso = 3,
        Evento = 6,
        Libro = 7,
        OrganoExterno = 8,
        Resena = 12,
        TesisDirigida = 13,
        ArticuloDifusion = 16
    }

    public class EntityHelper
    {
        public static TipoProductoEnum GetTipoProducto<T>()
        {
            switch (typeof(T).Name)
            {
                case "Articulo" :
                    return TipoProductoEnum.Articulo;
                
                case "Curso":
                    return TipoProductoEnum.Curso;

                case "Evento":
                    return TipoProductoEnum.Evento;

                case "Libro":
                    return TipoProductoEnum.Libro;

                case "OrganoExterno":
                    return TipoProductoEnum.OrganoExterno;

                case "Resena":
                    return TipoProductoEnum.Resena;
                    
                case "TesisDirigida" :
                    return TipoProductoEnum.TesisDirigida;

                case "ArticuloDifusion":
                    return TipoProductoEnum.ArticuloDifusion;
            }

            return 0;
        }

        public static bool HasCoautores<T>()
        {
            return GetCoautorTable<T>() != String.Empty;
        }

        public static string GetCoautorTable<T>()
        {
            return GetTableName<T>("CoautorInterno");
        }

        public static string GetRevistaTable<T>()
        {
            return GetTableName<T>("RevistaPublicacion");
        }

        public static bool HasRevista<T>()
        {
            return GetRevistaTable<T>() != String.Empty;
        }

        public static string GetEstadoTable<T>()
        {
            return GetTableName<T>("Estado");
        }

        public static bool HasEstado<T>()
        {
            return GetEstadoTable<T>() != String.Empty;
        }

        public static string GetInstitucionTable<T>()
        {
            return GetTableName<T>("Institucion");
        }

        public static bool HasInstitucion<T>()
        {
            return GetInstitucionTable<T>() != String.Empty;
        }

        public static string GetTipoTable<T>()
        {
            return GetTableName<T>("Tipo");
        }

        public static bool HasTipo<T>()
        {
            return GetTipoTable<T>() != String.Empty;
        }

        static string GetTableName<T>(string reference)
        {
            var tableName = String.Empty;
            var propertiesInfo = typeof(T).GetProperties(BindingFlags.Public | BindingFlags.Instance);
            foreach (var propertyInfo in
                propertiesInfo.Where(propertyInfo => propertyInfo.Name.StartsWith(reference)))
            {
                tableName = propertyInfo.Name;
                break;
            }

            return tableName;
        }
    }
}
