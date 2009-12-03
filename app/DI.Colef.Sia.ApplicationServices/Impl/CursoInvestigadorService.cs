using System;
using System.Collections.Generic;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Core.DataInterfaces;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
    public class CursoInvestigadorService : ICursoInvestigadorService
    {
        readonly IRepository<CursoInvestigador> cursoInvestigadorRepository;
        readonly ICursoInvestigadorQuerying cursoInvestigadorQuerying;

        public CursoInvestigadorService(IRepository<CursoInvestigador> cursoInvestigadorRepository, ICursoInvestigadorQuerying cursoInvestigadorQuerying)
        {
            this.cursoInvestigadorRepository = cursoInvestigadorRepository;
            this.cursoInvestigadorQuerying = cursoInvestigadorQuerying;
        }

        public CursoInvestigador GetCursoInvestigadorById(int id)
        {
            return cursoInvestigadorRepository.Get(id);
        }

        public CursoInvestigador[] GetAllCursosInvestigador()
        {
            return ((List<CursoInvestigador>) cursoInvestigadorRepository.GetAll()).ToArray();
        }

        public CursoInvestigador[] FindUnsedCursosInvestigador(Investigador investigador)
        {
            return cursoInvestigadorQuerying.FindUnsedCursosInvestigador(investigador);
        }
    }
}