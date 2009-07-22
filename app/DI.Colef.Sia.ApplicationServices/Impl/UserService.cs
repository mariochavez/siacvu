using System.Collections.Generic;
using DecisionesInteligentes.Colef.Sia.Core;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
    public class UserService : IUserService
    {
        readonly IRepository<Rol> rolRepository;

        public UserService(IRepository<Rol> rolRepository)
        {
            this.rolRepository = rolRepository;
        }

        public Rol GetRolById(int id)
        {
            return rolRepository.Get(id);
        }

        public Rol[] GetAllRoles()
        {
            return ((List<Rol>) rolRepository.GetAll()).ToArray();
        }

        public void SaveRol(Rol rol)
        {
            rolRepository.SaveOrUpdate(rol);
        }
    }
}