using AutoMapper;

namespace DecisionesInteligentes.Colef.Sia.Web
{
    public class AutoMapperConfiguration
    {
        public static void Configure()
        {
            Mapper.Initialize(x => x.AddProfile<ColefProfile>());
        }
    }
}
