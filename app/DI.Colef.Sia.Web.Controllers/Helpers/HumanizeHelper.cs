using System;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers
{
    public class HumanizeHelper
    {
        public static string Sexo(string sexo)
        {
            return sexo == "H" ? "Masculino" : (sexo == "M" ? "Femenino" : "");
        }

        public static string Boolean(bool value)
        {
            return value ? "Si" : "No";
        }

        public static string Volumen(int volumen)
        {
            string nombreVolumen;

            switch (volumen)
            {
                case 1:
                    nombreVolumen = "I";
                    break;
                case 2:
                    nombreVolumen = "II";
                    break;
                case 3:
                    nombreVolumen = "III";
                    break;
                case 4:
                    nombreVolumen = "IV";
                    break;
                default:
                    return null;
            }

            return nombreVolumen;
        }
    }
}