using System;
using System.Collections.Generic;
using DecisionesInteligentes.Colef.Sia.Core;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public class IdiomasInvestigadorService : IIdiomasInvestigadorService
    {
        readonly IRepository<IdiomasInvestigador> idiomasInvestigadorRepository;

        public IdiomasInvestigadorService(IRepository<IdiomasInvestigador> idiomasInvestigadorRepository)
        {
            this.idiomasInvestigadorRepository = idiomasInvestigadorRepository;
        }

        public IdiomasInvestigador GetIdiomasInvestigadorById(int id)
        {
            return idiomasInvestigadorRepository.Get(id);
        }

        public IdiomasInvestigador[] GetAllIdiomasInvestigadores()
        {
            return ((List<IdiomasInvestigador>)idiomasInvestigadorRepository.GetAll()).ToArray();
        }
        
        public IdiomasInvestigador[] GetActiveIdiomasInvestigadores()
        {
            return ((List<IdiomasInvestigador>)idiomasInvestigadorRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public void SaveIdiomasInvestigador(IdiomasInvestigador idiomasInvestigador)
        {
            if(idiomasInvestigador.Id == 0)
            {
                idiomasInvestigador.Activo = true;
                idiomasInvestigador.CreadoEl = DateTime.Now;
            }
            idiomasInvestigador.ModificadoEl = DateTime.Now;
            
            idiomasInvestigadorRepository.SaveOrUpdate(idiomasInvestigador);
        }

	    public IdiomasInvestigador[] GetAllIdiomasInvestigadores(Usuario usuario)
	    {
            return ((List<IdiomasInvestigador>)idiomasInvestigadorRepository.FindAll(new Dictionary<string, object> { { "Usuario", usuario } })).ToArray();
	    }
    }
}
