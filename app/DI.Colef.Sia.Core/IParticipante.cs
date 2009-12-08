namespace DecisionesInteligentes.Colef.Sia.Core
{
    interface IParticipante
    {
        void AddParticipanteExterno(ParticipanteExternoProducto participanteExterno);
        void AddParticipanteInterno(ParticipanteInternoProducto participanteInterno);
        void DeleteParticipanteInterno(ParticipanteInternoProducto participanteInterno);
        void DeleteParticipanteExterno(ParticipanteExternoProducto participanteExterno);
    }
}