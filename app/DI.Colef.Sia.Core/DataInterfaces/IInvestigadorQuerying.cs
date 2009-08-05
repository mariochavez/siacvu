namespace DecisionesInteligentes.Colef.Sia.Core.DataInterfaces
{
    public interface IInvestigadorQuerying
    {
        Investigador FindInvestigadorByUsuario(Usuario usuario);
    }
}