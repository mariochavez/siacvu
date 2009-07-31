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

	    public InvestigadorService(IRepository<Investigador> investigadorRepository,
            IUsuarioQuerying usuarioQuerying)
        {
            this.investigadorRepository = investigadorRepository;
            this.usuarioQuerying = usuarioQuerying;
        }

	    public Investigador GetInvestigadorById(int id)
        {
            return investigadorRepository.Get(id);
        }

        public Investigador[] GetAllInvestigadors()
        {
            return ((List<Investigador>) investigadorRepository.GetAll()).ToArray();
        }

        public void SaveInvestigador(Investigador investigador)
        {
            if (investigador.IsTransient())
            {
                investigador.Activo = true;
                investigador.CreadorEl = DateTime.Now;
            }
            investigador.ModificadoEl = DateTime.Now;

            investigadorRepository.SaveOrUpdate(investigador);
        }

	    public Usuario[] FindUsuariosToBeInvestigador()
        {
            return usuarioQuerying.FindUsuariosToBeInvestigador();
        }
    }
}
