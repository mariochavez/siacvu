<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true" 
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<ProyectoForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DI.Colef.Sia.Web.Controllers" %>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <h2><%=Html.Encode(Model.Title) %></h2>
    <% Html.RenderPartial("_Message"); %>
    <br />
    <% using (Html.BeginForm("Create", "Proyecto")) { %>
		<div id="form">
		<%=Html.AntiForgeryToken() %>
        <%=Html.Hidden("Id", Model.Form.Id) %>
        
			<table class="form">
							<tr>
					<td>
						<label>Tipo Proyecto:<em>*</em></label>
					</td>
					<td>
												
												
												
												
												
													<%=Html.DropDownList("TipoProyecto", Model.Form.TiposProyectos.CreateSelectList<TipoProyectoForm>("Id", "Nombre"),
								"Seleccione ...")%>
							<%=Html.ValidationMessage("TipoProyecto") %>
											</td>
				</tr>
			
							<tr>
					<td>
						<label>Nombre:<em>*</em></label>
					</td>
					<td>
												
												
													<%=Html.TextBox("Nombre", Model.Form.Nombre, new { maxlength = 100 })%>
							<%=Html.ValidationMessage("Nombre")%>
												
												
												
											</td>
				</tr>
			
							<tr>
					<td>
						<label>Fecha Inicial:<em>*</em></label>
					</td>
					<td>
												
												
												
													<%=Html.TextBox("FechaInicial", Model.Form.FechaInicial, new { @class="datetime", maxlength = 10 })%>
							<span class="helper_message">(Formato dd/mm/yyyy)</span>
							<%=Html.ValidationMessage("FechaInicial")%>
												
												
											</td>
				</tr>
			
							<tr>
					<td>
						<label>Fecha Final:<em>*</em></label>
					</td>
					<td>
												
												
												
													<%=Html.TextBox("FechaFinal", Model.Form.FechaFinal, new { @class="datetime", maxlength = 10 })%>
							<span class="helper_message">(Formato dd/mm/yyyy)</span>
							<%=Html.ValidationMessage("FechaFinal")%>
												
												
											</td>
				</tr>
			
							<tr>
					<td>
						<label>Estado Proyecto:<em>*</em></label>
					</td>
					<td>
												
													<%=Html.TextBox("EstadoProyecto", Model.Form.EstadoProyecto, new { maxlength = 100, size = 14 })%>
							<%=Html.ValidationMessage("EstadoProyecto")%>						
												
												
												
												
											</td>
				</tr>
			
							<tr>
					<td>
						<label>Proyecto Convenio:<em>*</em></label>
					</td>
					<td>
													<%= Html.CheckBox("ProyectoConvenio", Model.Form.ProyectoConvenio) %>
							<%=Html.ValidationMessage("ProyectoConvenio")%>
												
												
												
												
												
											</td>
				</tr>
			
							<tr>
					<td>
						<label>Convenio:<em>*</em></label>
					</td>
					<td>
												
												
												
												
												
													<%=Html.DropDownList("Convenio", Model.Form.Convenios.CreateSelectList<ConvenioForm>("Id", "Nombre"),
								"Seleccione ...")%>
							<%=Html.ValidationMessage("Convenio") %>
											</td>
				</tr>
			
							<tr>
					<td>
						<label>Responsable Interno Proyectos:<em>*</em></label>
					</td>
					<td>
												
												
												
												
													<%=Html.DropDownList("ResponsableInternoProyecto.ResponsableInterno", Model.Form.ResponsablesInternos.CreateSelectList<ResponsableInternoForm>("Id", "Nombre"),
							"Seleccione ...")%>
							<%=Html.ValidationMessage("ResponsableInternoProyecto.ResponsableInterno") %>
												
											</td>
				</tr>
			
							<tr>
					<td>
						<label>Responsable Externo Proyectos:<em>*</em></label>
					</td>
					<td>
												
												
												
												
													<%=Html.DropDownList("ResponsableExternoProyecto.ResponsableExterno", Model.Form.ResponsablesExternos.CreateSelectList<ResponsableExternoForm>("Id", "Nombre"),
							"Seleccione ...")%>
							<%=Html.ValidationMessage("ResponsableExternoProyecto.ResponsableExterno") %>
												
											</td>
				</tr>
			
							<tr>
					<td>
						<label>Participante Interno Proyectos:<em>*</em></label>
					</td>
					<td>
												
												
												
												
													<%=Html.DropDownList("ParticipanteInternoProyecto.ParticipanteInterno", Model.Form.ParticipantesInternos.CreateSelectList<ParticipanteInternoForm>("Id", "Nombre"),
							"Seleccione ...")%>
							<%=Html.ValidationMessage("ParticipanteInternoProyecto.ParticipanteInterno") %>
												
											</td>
				</tr>
			
							<tr>
					<td>
						<label>Participante Externo Proyectos:<em>*</em></label>
					</td>
					<td>
												
												
												
												
													<%=Html.DropDownList("ParticipanteExternoProyecto.ParticipanteExterno", Model.Form.ParticipantesExternos.CreateSelectList<ParticipanteExternoForm>("Id", "Nombre"),
							"Seleccione ...")%>
							<%=Html.ValidationMessage("ParticipanteExternoProyecto.ParticipanteExterno") %>
												
											</td>
				</tr>
			
							<tr>
					<td>
						<label>Sede:<em>*</em></label>
					</td>
					<td>
												
												
												
												
												
													<%=Html.DropDownList("Sede", Model.Form.Sedes.CreateSelectList<SedeForm>("Id", "Nombre"),
								"Seleccione ...")%>
							<%=Html.ValidationMessage("Sede") %>
											</td>
				</tr>
			
							<tr>
					<td>
						<label>Linea Tematica:<em>*</em></label>
					</td>
					<td>
												
												
												
												
												
													<%=Html.DropDownList("LineaTematica", Model.Form.LineasTematicas.CreateSelectList<LineaTematicaForm>("Id", "Nombre"),
								"Seleccione ...")%>
							<%=Html.ValidationMessage("LineaTematica") %>
											</td>
				</tr>
			
							<tr>
					<td>
						<label>Objetivo General:<em>*</em></label>
					</td>
					<td>
												
												
													<%=Html.TextBox("ObjetivoGeneral", Model.Form.ObjetivoGeneral, new { maxlength = 100 })%>
							<%=Html.ValidationMessage("ObjetivoGeneral")%>
												
												
												
											</td>
				</tr>
			
							<tr>
					<td>
						<label>Impacto Academico:<em>*</em></label>
					</td>
					<td>
												
												
													<%=Html.TextBox("ImpactoAcademico", Model.Form.ImpactoAcademico, new { maxlength = 100 })%>
							<%=Html.ValidationMessage("ImpactoAcademico")%>
												
												
												
											</td>
				</tr>
			
							<tr>
					<td>
						<label>Impacto Politica Publica:<em>*</em></label>
					</td>
					<td>
												
												
												
												
												
													<%=Html.DropDownList("ImpactoPoliticaPublica", Model.Form.ImpactosPoliticasPublicas.CreateSelectList<ImpactoPoliticaPublicaForm>("Id", "Nombre"),
								"Seleccione ...")%>
							<%=Html.ValidationMessage("ImpactoPoliticaPublica") %>
											</td>
				</tr>
			
							<tr>
					<td>
						<label>Otro Impacto:<em>*</em></label>
					</td>
					<td>
												
												
													<%=Html.TextBox("OtroImpacto", Model.Form.OtroImpacto, new { maxlength = 100 })%>
							<%=Html.ValidationMessage("OtroImpacto")%>
												
												
												
											</td>
				</tr>
			
							<tr>
					<td>
						<label>Ambito:<em>*</em></label>
					</td>
					<td>
												
												
												
												
												
													<%=Html.DropDownList("Ambito", Model.Form.Ambitos.CreateSelectList<AmbitoForm>("Id", "Nombre"),
								"Seleccione ...")%>
							<%=Html.ValidationMessage("Ambito") %>
											</td>
				</tr>
			
							<tr>
					<td>
						<label>Usuarios Potenciales:<em>*</em></label>
					</td>
					<td>
												
												
													<%=Html.TextBox("UsuariosPotenciales", Model.Form.UsuariosPotenciales, new { maxlength = 100 })%>
							<%=Html.ValidationMessage("UsuariosPotenciales")%>
												
												
												
											</td>
				</tr>
			
							<tr>
					<td>
						<label>Beneficiarios Proyecto:<em>*</em></label>
					</td>
					<td>
												
												
													<%=Html.TextBox("BeneficiariosProyecto", Model.Form.BeneficiariosProyecto, new { maxlength = 100 })%>
							<%=Html.ValidationMessage("BeneficiariosProyecto")%>
												
												
												
											</td>
				</tr>
			
							<tr>
					<td>
						<label>Tipo Financiamiento:<em>*</em></label>
					</td>
					<td>
												
												
												
												
												
													<%=Html.DropDownList("TipoFinanciamiento", Model.Form.TiposFinanciamientos.CreateSelectList<TipoFinanciamientoForm>("Id", "Nombre"),
								"Seleccione ...")%>
							<%=Html.ValidationMessage("TipoFinanciamiento") %>
											</td>
				</tr>
			
							<tr>
					<td>
						<label>Monto:<em>*</em></label>
					</td>
					<td>
												
													<%=Html.TextBox("Monto", Model.Form.Monto, new { maxlength = 100, size = 14 })%>
							<%=Html.ValidationMessage("Monto")%>						
												
												
												
												
											</td>
				</tr>
			
							<tr>
					<td>
						<label>Moneda:<em>*</em></label>
					</td>
					<td>
												
												
												
												
												
													<%=Html.DropDownList("Moneda", Model.Form.Monedas.CreateSelectList<MonedaForm>("Id", "Nombre"),
								"Seleccione ...")%>
							<%=Html.ValidationMessage("Moneda") %>
											</td>
				</tr>
			
							<tr>
					<td>
						<label>Sector Financiamiento:<em>*</em></label>
					</td>
					<td>
												
												
												
												
												
													<%=Html.DropDownList("SectorFinanciamiento", Model.Form.SectoresFinanciamientos.CreateSelectList<SectorFinanciamientoForm>("Id", "Nombre"),
								"Seleccione ...")%>
							<%=Html.ValidationMessage("SectorFinanciamiento") %>
											</td>
				</tr>
			
							<tr>
					<td>
						<label>Producto Esperado:<em>*</em></label>
					</td>
					<td>
												
												
													<%=Html.TextBox("ProductoEsperado", Model.Form.ProductoEsperado, new { maxlength = 100 })%>
							<%=Html.ValidationMessage("ProductoEsperado")%>
												
												
												
											</td>
				</tr>
			
							<tr>
					<td>
						<label>Fecha Entrega Compromiso:<em>*</em></label>
					</td>
					<td>
												
												
												
													<%=Html.TextBox("FechaEntregaCompromiso", Model.Form.FechaEntregaCompromiso, new { @class="datetime", maxlength = 10 })%>
							<span class="helper_message">(Formato dd/mm/yyyy)</span>
							<%=Html.ValidationMessage("FechaEntregaCompromiso")%>
												
												
											</td>
				</tr>
			
							<tr>
					<td>
						<label>Producto Academico:<em>*</em></label>
					</td>
					<td>
												
												
												
												
												
													<%=Html.DropDownList("ProductoAcademico", Model.Form.ProductosAcademicos.CreateSelectList<ProductoAcademicoForm>("Id", "Nombre"),
								"Seleccione ...")%>
							<%=Html.ValidationMessage("ProductoAcademico") %>
											</td>
				</tr>
			
							<tr>
					<td>
						<label>Actividad Prevista:<em>*</em></label>
					</td>
					<td>
												
												
												
												
												
													<%=Html.DropDownList("ActividadPrevista", Model.Form.ActividadesPrevistas.CreateSelectList<ActividadPrevistaForm>("Id", "Nombre"),
								"Seleccione ...")%>
							<%=Html.ValidationMessage("ActividadPrevista") %>
											</td>
				</tr>
			
							<tr>
					<td>
						<label>Fecha Entrega Producto:<em>*</em></label>
					</td>
					<td>
												
												
												
													<%=Html.TextBox("FechaEntregaProducto", Model.Form.FechaEntregaProducto, new { @class="datetime", maxlength = 10 })%>
							<span class="helper_message">(Formato dd/mm/yyyy)</span>
							<%=Html.ValidationMessage("FechaEntregaProducto")%>
												
												
											</td>
				</tr>
			
							<tr>
					<td>
						<label>Servicio Useg:<em>*</em></label>
					</td>
					<td>
													<%= Html.CheckBox("ServicioUSEG", Model.Form.ServicioUSEG) %>
							<%=Html.ValidationMessage("ServicioUSEG")%>
												
												
												
												
												
											</td>
				</tr>
			
							<tr>
					<td>
						<label>Useg:<em>*</em></label>
					</td>
					<td>
												
												
												
												
												
													<%=Html.DropDownList("USEG", Model.Form.Usegs.CreateSelectList<USEGForm>("Id", "Nombre"),
								"Seleccione ...")%>
							<%=Html.ValidationMessage("USEG") %>
											</td>
				</tr>
			
							<tr>
					<td>
						<label>Nombre Estudiante:<em>*</em></label>
					</td>
					<td>
												
												
													<%=Html.TextBox("NombreEstudiante", Model.Form.NombreEstudiante, new { maxlength = 100 })%>
							<%=Html.ValidationMessage("NombreEstudiante")%>
												
												
												
											</td>
				</tr>
			
							<tr>
					<td>
						<label>Tipo Estudiante:<em>*</em></label>
					</td>
					<td>
												
													<%=Html.TextBox("TipoEstudiante", Model.Form.TipoEstudiante, new { maxlength = 100, size = 14 })%>
							<%=Html.ValidationMessage("TipoEstudiante")%>						
												
												
												
												
											</td>
				</tr>
			
							<tr>
					<td>
						<label>Institucion:<em>*</em></label>
					</td>
					<td>
												
												
												
												
												
													<%=Html.DropDownList("Institucion", Model.Form.Instituciones.CreateSelectList<InstitucionForm>("Id", "Nombre"),
								"Seleccione ...")%>
							<%=Html.ValidationMessage("Institucion") %>
											</td>
				</tr>
			
							<tr>
					<td>
						<label>Nivel Estudio:<em>*</em></label>
					</td>
					<td>
												
												
												
												
												
													<%=Html.DropDownList("NivelEstudio", Model.Form.NivelesEstudios.CreateSelectList<NivelEstudioForm>("Id", "Nombre"),
								"Seleccione ...")%>
							<%=Html.ValidationMessage("NivelEstudio") %>
											</td>
				</tr>
			
							<tr>
					<td>
						<label>Incluir Web:<em>*</em></label>
					</td>
					<td>
													<%= Html.CheckBox("IncluirWeb", Model.Form.IncluirWeb) %>
							<%=Html.ValidationMessage("IncluirWeb")%>
												
												
												
												
												
											</td>
				</tr>
			
							<tr>
					<td>
						<label>Entidad:<em>*</em></label>
					</td>
					<td>
												
												
													<%=Html.TextBox("Entidad", Model.Form.Entidad, new { maxlength = 100 })%>
							<%=Html.ValidationMessage("Entidad")%>
												
												
												
											</td>
				</tr>
			
							<tr>
					<td>
						<label>Sector:<em>*</em></label>
					</td>
					<td>
												
												
												
												
												
													<%=Html.DropDownList("Sector", Model.Form.Sectores.CreateSelectList<SectorForm>("Id", "Nombre"),
								"Seleccione ...")%>
							<%=Html.ValidationMessage("Sector") %>
											</td>
				</tr>
			
							<tr>
					<td>
						<label>Organizacion:<em>*</em></label>
					</td>
					<td>
												
												
												
												
												
													<%=Html.DropDownList("Organizacion", Model.Form.Organizaciones.CreateSelectList<OrganizacionForm>("Id", "Nombre"),
								"Seleccione ...")%>
							<%=Html.ValidationMessage("Organizacion") %>
											</td>
				</tr>
			
							<tr>
					<td>
						<label>Nivel:<em>*</em></label>
					</td>
					<td>
												
												
												
												
												
													<%=Html.DropDownList("Nivel", Model.Form.Niveles.CreateSelectList<NivelForm>("Id", "Nombre"),
								"Seleccione ...")%>
							<%=Html.ValidationMessage("Nivel") %>
											</td>
				</tr>
			
							<tr>
					<td>
						<label>Nivel:<em>*</em></label>
					</td>
					<td>
												
												
												
												
												
													<%=Html.DropDownList("Nivel", Model.Form.Niveles.CreateSelectList<NivelForm>("Id", "Nombre"),
								"Seleccione ...")%>
							<%=Html.ValidationMessage("Nivel") %>
											</td>
				</tr>
			
							<tr>
					<td>
						<label>Nivel:<em>*</em></label>
					</td>
					<td>
												
												
												
												
												
													<%=Html.DropDownList("Nivel", Model.Form.Niveles.CreateSelectList<NivelForm>("Id", "Nombre"),
								"Seleccione ...")%>
							<%=Html.ValidationMessage("Nivel") %>
											</td>
				</tr>
			
							<tr>
					<td>
						<label>Nivel:<em>*</em></label>
					</td>
					<td>
												
												
												
												
												
													<%=Html.DropDownList("Nivel", Model.Form.Niveles.CreateSelectList<NivelForm>("Id", "Nombre"),
								"Seleccione ...")%>
							<%=Html.ValidationMessage("Nivel") %>
											</td>
				</tr>
			
							<tr>
					<td>
						<label>Nivel:<em>*</em></label>
					</td>
					<td>
												
												
												
												
												
													<%=Html.DropDownList("Nivel", Model.Form.Niveles.CreateSelectList<NivelForm>("Id", "Nombre"),
								"Seleccione ...")%>
							<%=Html.ValidationMessage("Nivel") %>
											</td>
				</tr>
			
							<tr>
					<td>
						<label>Departamento:<em>*</em></label>
					</td>
					<td>
												
												
												
												
												
													<%=Html.DropDownList("Departamento", Model.Form.Departamentos.CreateSelectList<DepartamentoForm>("Id", "Nombre"),
								"Seleccione ...")%>
							<%=Html.ValidationMessage("Departamento") %>
											</td>
				</tr>
			
							<tr>
					<td>
						<label>Otra Empresa Institucion Participante:<em>*</em></label>
					</td>
					<td>
												
												
													<%=Html.TextBox("OtraEmpresaInstitucionParticipante", Model.Form.OtraEmpresaInstitucionParticipante, new { maxlength = 100 })%>
							<%=Html.ValidationMessage("OtraEmpresaInstitucionParticipante")%>
												
												
												
											</td>
				</tr>
			
							<tr>
					<td>
						<label>Becario Participante:<em>*</em></label>
					</td>
					<td>
												
												
													<%=Html.TextBox("BecarioParticipante", Model.Form.BecarioParticipante, new { maxlength = 100 })%>
							<%=Html.ValidationMessage("BecarioParticipante")%>
												
												
												
											</td>
				</tr>
			
							<tr>
					<td>
						<label>Area:<em>*</em></label>
					</td>
					<td>
												
												
												
												
												
													<%=Html.DropDownList("Area", Model.Form.Areas.CreateSelectList<AreaForm>("Id", "Nombre"),
								"Seleccione ...")%>
							<%=Html.ValidationMessage("Area") %>
											</td>
				</tr>
			
							<tr>
					<td>
						<label>Disciplina:<em>*</em></label>
					</td>
					<td>
												
												
												
												
												
													<%=Html.DropDownList("Disciplina", Model.Form.Disciplinas.CreateSelectList<DisciplinaForm>("Id", "Nombre"),
								"Seleccione ...")%>
							<%=Html.ValidationMessage("Disciplina") %>
											</td>
				</tr>
			
							<tr>
					<td>
						<label>Subdisciplina:<em>*</em></label>
					</td>
					<td>
												
												
												
												
												
													<%=Html.DropDownList("Subdisciplina", Model.Form.Subdisciplinas.CreateSelectList<SubdisciplinaForm>("Id", "Nombre"),
								"Seleccione ...")%>
							<%=Html.ValidationMessage("Subdisciplina") %>
											</td>
				</tr>
			
						</table>
		
			<div class="btn_container_footer">
				<span class="btn btn_normal_brown">
					<%=Html.SubmitButton("Guardar", "Guardar Cambios") %>
				</span>
				<span class="btn btn_normal_white">
					<%=Html.ActionLink<ProyectoController>(x => x.Index(), "Regresar") %>
				</span>
			</div>
	    </div>
    <% } %>
    
<script type="text/javascript">
    $(document).ready(function() {
        setupDocument();
    });
</script>
</asp:Content>
