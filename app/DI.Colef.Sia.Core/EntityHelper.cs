﻿using System;
using System.Linq;
using System.Reflection;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    public enum TipoProductoEnum
    {
        Articulo = 1,
        Capitulo = 2,
        Curso = 3,
        Dictamen = 4,
        Evento = 6,
        Libro = 7,
        OrganoExterno = 8,
        ParticipacionMedio = 10,
        Reporte = 11,
        Resena = 12,
        TesisDirigida = 13,
        Proyecto = 15,
        ArticuloDifusion = 16,
        ObraTraducida = 20,
        OrganoInterno = 14,
        Distincion = 5,
        ExperienciaProfesional = 21,
        GrupoInvestigacion = 22,
        Idioma = 23,
        FormacionAcademica = 24,
        EstanciaAcademica = 25,
        ApoyoConacyt = 26

    }

    public class EntityHelper
    {
        public static TipoProductoEnum GetTipoProducto<T>()
        {
            switch (typeof(T).Name)
            {
                case "Articulo" :
                    return TipoProductoEnum.Articulo;

                case "Capitulo":
                    return TipoProductoEnum.Capitulo;
                
                case "Curso":
                    return TipoProductoEnum.Curso;

                case "Dictamen":
                    return TipoProductoEnum.Dictamen;

                case "Evento":
                    return TipoProductoEnum.Evento;

                case "Libro":
                    return TipoProductoEnum.Libro;

                case "OrganoExterno":
                    return TipoProductoEnum.OrganoExterno;

                case "ParticipacionMedio":
                    return TipoProductoEnum.ParticipacionMedio;

                case "Reporte":
                    return TipoProductoEnum.Reporte;

                case "Resena":
                    return TipoProductoEnum.Resena;
                    
                case "TesisDirigida" :
                    return TipoProductoEnum.TesisDirigida;

                case "Proyecto" :
                    return TipoProductoEnum.Proyecto;

                case "ArticuloDifusion":
                    return TipoProductoEnum.ArticuloDifusion;

                case "ObraTraducida":
                    return TipoProductoEnum.ObraTraducida;
                case "OrganoInterno":
                    return TipoProductoEnum.OrganoInterno;
                case "Distincion":
                    return TipoProductoEnum.Distincion;
                case "ExperienciaProfesional":
                    return TipoProductoEnum.ExperienciaProfesional;
                case "ApoyoConacyt":
                    return TipoProductoEnum.ApoyoConacyt;
                case "GrupoInvestigacion":
                    return TipoProductoEnum.GrupoInvestigacion;
                case "Idioma":
                    return TipoProductoEnum.Idioma;
                case "FormacionAcademica":
                    return TipoProductoEnum.FormacionAcademica;
                case "EstanciaAcademica":
                    return TipoProductoEnum.EstanciaAcademica;

            }

            return 0;
        }

        public static bool HasCoautores<T>()
        {
            return GetCoautorTable<T>() != String.Empty;
        }

        public static string GetCoautorTable<T>()
        {
            //return GetTableName<T>("CoautorInterno");
            return GetCoautorTableName<T>("CoautorInterno");
        }

        public static string GetRevistaTable<T>()
        {
            return GetTableName<T>("RevistaPublicacion");
        }

        public static string GetFirmaTable<T>()
        {
            return GetTableName<T>("Firma");
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

        public static string GetPropertyName<T>(string propertyName)
        {
            return GetTableName<T>(propertyName);
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
                propertiesInfo.Where(propertyInfo => propertyInfo.Name.StartsWith(reference) && !propertyInfo.PropertyType.IsInterface && !propertyInfo.PropertyType.IsArray && propertyInfo.PropertyType.Name != typeof(String).Name))
            {
                tableName = propertyInfo.Name;
                break;
            }

            return tableName;
        }

        static string GetCoautorTableName<T>(string reference)
        {
            var tableName = String.Empty;
            var propertiesInfo = typeof(T).GetProperties(BindingFlags.Public | BindingFlags.Instance);
            foreach (var propertyInfo in
                propertiesInfo.Where(propertyInfo => propertyInfo.Name.StartsWith(reference) && !propertyInfo.PropertyType.IsArray && propertyInfo.PropertyType.Name != typeof(String).Name))
            {
                tableName = propertyInfo.Name;
                break;
            }

            return tableName;
        }
    }
}
