using System;
using System.Collections.Generic;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Core.DataInterfaces;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public class ParticipacionMedioService : IParticipacionMedioService
    {
        readonly IRepository<ParticipacionMedio> participacionMedioRepository;
	    readonly IFirmaService firmaService;

        public ParticipacionMedioService(IRepository<ParticipacionMedio> participacionMedioRepository, IFirmaService firmaService)
        {
            this.participacionMedioRepository = participacionMedioRepository;
            this.firmaService = firmaService;
        }

        public ParticipacionMedio GetParticipacionMedioById(int id)
        {
            return participacionMedioRepository.Get(id);
        }

        public ParticipacionMedio[] GetAllParticipacionMedios()
        {
            return ((List<ParticipacionMedio>)participacionMedioRepository.GetAll()).ToArray();
        }
        
        public ParticipacionMedio[] GetActiveParticipacionMedios()
        {
            return ((List<ParticipacionMedio>)participacionMedioRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public void SaveParticipacionMedio(ParticipacionMedio participacionMedio)
        {
            SaveParticipacionMedio(participacionMedio, false);
        }

        public void SaveParticipacionMedio(ParticipacionMedio participacionMedio, bool useCommit)
        {
            if(participacionMedio.IsTransient())
            {
                participacionMedio.Puntuacion = 0.0m;
                participacionMedio.Activo = true;
                participacionMedio.CreadoEl = DateTime.Now;

                var firma = new Firma
                                {
                                    Aceptacion1 = 0,
                                    Aceptacion2 = 0,
                                    Aceptacion3 = 0,
                                    Firma1 = DateTime.Now,
                                    Firma2 = DateTime.Now,
                                    Firma3 = DateTime.Now,
                                    TipoProducto = participacionMedio.TipoProducto,
                                    CreadoPor = participacionMedio.Usuario,
                                    ModificadoPor = participacionMedio.Usuario
                                };

                firmaService.SaveFirma(firma);

                participacionMedio.Firma = firma;
            }
            participacionMedio.ModificadoEl = DateTime.Now;
            
            participacionMedioRepository.SaveOrUpdate(participacionMedio);

            if(useCommit)
                participacionMedioRepository.DbContext.CommitChanges();
        }

	    public ParticipacionMedio[] GetAllParticipacionMedios(Usuario usuario)
	    {
            return ((List<ParticipacionMedio>)participacionMedioRepository.FindAll(new Dictionary<string, object> { { "Usuario", usuario } })).ToArray();
	    }
    }
}
