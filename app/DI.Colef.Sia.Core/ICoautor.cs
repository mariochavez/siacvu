namespace DecisionesInteligentes.Colef.Sia.Core
{
    interface ICoautor
    {
        void AddCoautorExterno(CoautorExternoProducto coautorExterno);
        void AddCoautorInterno(CoautorInternoProducto coautorInterno);
        void DeleteCoautorInterno(CoautorInternoProducto coautorInterno);
        void DeleteCoautorExterno(CoautorExternoProducto coautorExterno);
    }
}
