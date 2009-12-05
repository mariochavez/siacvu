using System;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Core.DataInterfaces;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
    public class ProductoService : IProductoService
    {
        readonly IProductoQuerying productoQuerying;

        public ProductoService(IProductoQuerying productoQuerying)
        {
            this.productoQuerying = productoQuerying;
        }

        public object[] GetProductosBandeja(Usuario usuario)
        {
            return productoQuerying.GetProductosBandeja(usuario);
        }
    }
}