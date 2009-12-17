using System;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Core.DataInterfaces;
using Machine.Specifications;
using SharpArch.Data.NHibernate;
using Tests.Extensions;

namespace Tests.DI.Colef.Sia.Data
{
    [Subject(typeof(ArchivoService))]
    public class when_a_file_is_uploaded_it_should_relate : ConnectionSetup
    {
        static IArchivoService archivoService;
        static IInvestigadorService investigadorService;
        static Investigador investigador;

        Because of = () =>
            {
                archivoService = new ArchivoService(new Repository<Archivo>());

                investigadorService = new InvestigadorService(new Repository<Investigador>(), new UsuarioQuerying(), new InvestigadorQuerying());
                
                investigador = investigadorService.GetInvestigadorById(1);
                Archivo archivo = new Archivo
                                                    {
                                                        Nombre = "Mi archivo",
                                                        Activo = true,
                                                        CreadoEl = DateTime.Now,
                                                        ModificadoEl = DateTime.Now,
                                                        Tamano = 200,
                                                        Contenido = "text"
                                                    };

                archivoService.Save(archivo);
                var grado = investigador.GradosAcademicosInvestigador[0];
                grado.Comprobante = archivo;

                //investigador.ModificadoEl = DateTime.Now;
                investigadorService.SaveInvestigador(investigador);

                string factoryKey = SessionFactoryAttribute.GetKeyFrom(null);
                var session = NHibernateSession.CurrentFor(factoryKey);
                session.Flush();
            };

        It should_have_comprobante = () =>
            {
                investigador = investigadorService.GetInvestigadorById(1);
                investigador.GradosAcademicosInvestigador[0].Comprobante.ShouldNotBeNull();
                investigador.GradosAcademicosInvestigador[0].Comprobante.ShouldBeOfType(typeof(Archivo));
            };
    }
}
