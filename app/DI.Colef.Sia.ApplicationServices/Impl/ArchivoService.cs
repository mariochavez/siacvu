using System;
using System.Collections.Generic;
using DecisionesInteligentes.Colef.Sia.Core;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
    public class ArchivoService : IArchivoService
    {
        readonly IRepository<Archivo> archivoRepository;

        public ArchivoService(IRepository<Archivo> archivoRepository)
        {
            this.archivoRepository = archivoRepository;
        }
    }
}
