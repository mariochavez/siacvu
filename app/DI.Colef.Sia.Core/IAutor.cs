namespace DecisionesInteligentes.Colef.Sia.Core
{
    public interface IAutor
    {
        void AddAutorExterno(AutorExternoProducto autorExterno);
        void AddAutorInterno(AutorInternoProducto autorInterno);
        void DeleteAutorInterno(AutorInternoProducto autorInterno);
        void DeleteAutorExterno(AutorExternoProducto autorExterno);
    }
}