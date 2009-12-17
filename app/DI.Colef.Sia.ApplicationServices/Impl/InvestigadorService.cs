using System;
using System.Collections.Generic;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Core.DataInterfaces;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
    public class InvestigadorService : IInvestigadorService
    {
        readonly IRepository<Investigador> investigadorRepository;
        readonly IUsuarioQuerying usuarioQuerying;
        readonly IInvestigadorQuerying investigadorQuerying;

        public InvestigadorService(IRepository<Investigador> investigadorRepository,
            IUsuarioQuerying usuarioQuerying, IInvestigadorQuerying investigadorQuerying)
        {
            this.investigadorRepository = investigadorRepository;
            this.usuarioQuerying = usuarioQuerying;
            this.investigadorQuerying = investigadorQuerying;
        }

        public Investigador GetInvestigadorById(int id)
        {
            return investigadorRepository.Get(id);
        }

        public Investigador[] GetAllInvestigadores()
        {
            return ((List<Investigador>)investigadorRepository.GetAll()).ToArray();
        }

        public Investigador[] GetActiveInvestigadores()
        {
            return ((List<Investigador>)investigadorRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public void SaveInvestigador(Investigador investigador)
        {
            SaveInvestigador(investigador, false);
        }

        public void SaveInvestigador(Investigador investigador, bool commit)
        {
            if (investigador.IsTransient())
            {
                investigador.Activo = true;
                investigador.CreadoEl = DateTime.Now;
            }
            investigador.ModificadoEl = DateTime.Now;

            investigadorRepository.SaveOrUpdate(investigador);

            if(commit)
                investigadorRepository.DbContext.CommitChanges();
        }

        public Usuario[] FindUsuariosToBeInvestigador()
        {
            return usuarioQuerying.FindUsuariosToBeInvestigador();
        }

        public Investigador GetInvestigadorByUsuario(string usuarioNombre)
        {
            return investigadorQuerying.FindInvestigadorByUsuario(usuarioNombre);
        }
    }
}
