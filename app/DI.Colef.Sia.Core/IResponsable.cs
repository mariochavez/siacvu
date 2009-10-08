namespace DecisionesInteligentes.Colef.Sia.Core
{
    public interface IResponsable
    {
        void AddResponsableExterno(ResponsableExternoProducto responsableExterno);
        void AddResponsableInterno(ResponsableInternoProducto responsableInterno);
        void DeleteResponsableInterno(ResponsableInternoProducto responsableInterno);
        void DeleteResponsableExterno(ResponsableExternoProducto responsableExterno);
    }
}