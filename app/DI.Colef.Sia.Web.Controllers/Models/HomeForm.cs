using System;
using DecisionesInteligentes.Colef.Sia.Core.DataInterfaces;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class HomeForm
    {
        public ProductoDTO[] ProduccionAcademica { get; set; }

        public ProductoDTO[] FormacionRecursosHumanos { get; set; }

        public ProductoDTO[] Proyectos { get; set; }

        public ProductoDTO[] Vinculacion { get; set; }
    }
}