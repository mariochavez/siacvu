namespace DecisionesInteligentes.Colef.Sia.Core.DataInterfaces
{
    public interface ICursoInvestigadorQuerying
    {
        CursoInvestigador[] FindUnsedCursosInvestigador(Investigador investigador);
    }
}