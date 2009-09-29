namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers
{
    public class HumanizeHelper
    {
        public static string Sexo(string sexo)
        {
            return sexo == "H" ? "Masculino" : (sexo == "M" ? "Femenino" : "");
        }

        public static string Bolean(bool value)
        {
            return value ? "Si" : "No";
        }
    }
}