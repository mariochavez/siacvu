using System;
using System.Collections.Generic;
using DecisionesInteligentes.Colef.Sia.Core;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
    public class CursoInvestigadorService : ICursoInvestigadorService
    {
        readonly IRepository<CursoInvestigador> cursoInvestigadorRepository;

        public CursoInvestigadorService(IRepository<CursoInvestigador> cursoInvestigadorRepository)
        {
            this.cursoInvestigadorRepository = cursoInvestigadorRepository;
        }

        public CursoInvestigador GetCursoInvestigadorById(int id)
        {
            return cursoInvestigadorRepository.Get(id);
        }

        public CursoInvestigador[] GetAllCursosInvestigador()
        {
            return ((List<CursoInvestigador>) cursoInvestigadorRepository.GetAll()).ToArray();
        }
    }
}