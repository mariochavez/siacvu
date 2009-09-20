<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true"
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<ProyectoForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Productos"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DI.Colef.Sia.Web.Controllers" %>

<asp:Content ID="titleContent" ContentPlaceHolderID="TituloPlaceHolder" runat="server">
    <h2>
        <%=Html.Encode(Model.Title) %>
    </h2>
</asp:Content>

<asp:Content ID="introductionContent" ContentPlaceHolderID="IntroduccionPlaceHolder" runat="server">
    <div id="introduccion">
        <p>
            Aqu&iacute; se muestra la informaci&oacute;n detallada del proyecto como est&aacute; en el sistema.
		</p>
    </div><!--end introduccion-->
</asp:Content>

<asp:Content ID="sidebarContent" ContentPlaceHolderID="SidebarContentPlaceHolder" runat="server">
    <div id="barra">
        <div id="asistente">
            <h3>Asistente de secci&oacute;n</h3>
            <% Html.RenderPartial("_ShowSidebar"); %>
        </div><!--end asistente-->

    </div><!--end barra-->
</asp:Content>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div id="textos">
        <div id="forma">
            <div id="campos">
                <p>
                    <label>Nombre</label>
                    <strong><%= Html.Encode(Model.Form.Nombre)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Tipo de proyecto</label>
                    <strong><%= Html.Encode(Model.Form.TipoProyectoNombre)%>&nbsp;</strong>
                </p>
                <h4>Responsables</h4>
                <div class="minilista" id="responsableinternoList">
                    <h5>Responsable Interno</h5>                    
                    <% if (Model.Form.ResponsableInternoProyectos != null && Model.Form.ResponsableInternoProyectos.Length > 0) { %>
                        <% foreach(var responsableInterno in Model.Form.ResponsableInternoProyectos) { %>
	                        <div class="sublista" id="responsableinterno_<%=Html.Encode(responsableInterno.InvestigadorId) %>">
	                            <h6>
	                                <%=Html.Encode(responsableInterno.NombreResponsable)%>
	                            </h6>
			                </div><!--end sublista-->
                        <% } %>
                    <% } else { %>
                        <div class="sublista" id="responsableinternoEmptyList_form">
                            <h6><span>No hay responsables internos registrados</span></h6>
		                </div><!--end elementodescripcion-->
                    <% } %>
                </div>
                <h4>Participantes</h4>
                <div class="minilista" id="participanteinternoList">
                    <h5>Participante Interno</h5>                    
                    <% if (Model.Form.ParticipanteInternoProyectos != null && Model.Form.ParticipanteInternoProyectos.Length > 0) { %>
                        <% foreach(var participanteInterno in Model.Form.ParticipanteInternoProyectos) { %>
	                        <div class="sublista" id="participanteinterno_<%=Html.Encode(participanteInterno.InvestigadorId) %>">
	                            <h6>
	                                <%=Html.Encode(participanteInterno.NombreParticipante)%>
	                            </h6>
			                </div><!--end sublista-->
                        <% } %>
                    <% } else { %>
                        <div class="sublista" id="participanteinternoEmptyList_form">
                            <h6><span>No hay participantes internos registrados</span></h6>
		                </div><!--end elementodescripcion-->
                    <% } %>
                </div>
                <div class="minilista" id="participanteexternoList">
                    <h5>Participante Externo</h5>
                    <% if (Model.Form.ParticipanteExternoProyectos != null && Model.Form.ParticipanteExternoProyectos.Length > 0) { %>
                        <% foreach(var participanteExterno in Model.Form.ParticipanteExternoProyectos) { %>
	                        <div class="sublista" id="participanteexterno_<%=Html.Encode(participanteExterno.InvestigadorExternoId) %>">
	                            <h6>
	                                <%=Html.Encode(participanteExterno.InvestigadorExternoNombre)%>
	                            </h6>
			                </div><!--end sublista-->
                        <% } %>
                    <% } else { %>
                        <div class="sublista" id="participanteexternoEmptyList_form">
                            <h6><span>No hay participantes externos registrados</span></h6>
		                </div><!--end elementodescripcion-->
                    <% } %>
                </div>
                <p>
                    <label>Cuenta con convenio</label>
                    <strong><%= Html.Encode(Model.Form.ConConvenio)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Nombre del convenio</label>
                    <strong><%= Html.Encode(Model.Form.Convenio)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Fecha inicial</label>
                    <strong><%= Html.Encode(Model.Form.FechaInicial)%>&nbsp;</strong><span>Formato (dd/mm/yyyy)</span>
                </p>
                <p>
                    <label>Fecha final</label>
                    <strong><%= Html.Encode(Model.Form.FechaFinal) %>&nbsp;</strong><span>Formato (dd/mm/yyyy)</span>
                </p>
                <p>
                    <label>Fecha de pr&oacute;rroga</label>
                    <strong><%= Html.Encode(Model.Form.FechaProrroga)%>&nbsp;</strong><span>Formato (dd/mm/yyyy)</span>
                </p>
                <p>
                    <label>Estatus del proyecto</label>
                    <strong><%= Html.Encode(Model.Form.EstatusProyectoNombre)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Fecha de conclusi&oacute;n</label>
                    <strong><%= Html.Encode(Model.Form.FechaConclusion)%>&nbsp;</strong><span>Formato (dd/mm/yyyy)</span>
                </p>
                <p>
                    <label>Proyecto con recursos complementarios</label>
                    <strong><%= Html.Encode(Model.Form.ConRecursos) %>&nbsp;</strong>
                </p>                
                <h4>Financiamiento del proyecto</h4>
                <p>
                    <label>Sector de financiamiento</label>
                    <strong><%= Html.Encode(Model.Form.SectorFinanciamientoNombre)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Fondo del CONACyT</label>
                    <strong><%= Html.Encode(Model.Form.FondoConacytNombre)%>&nbsp;</strong>
                </p>
                <h4>Recursos Financieros</h4>
                
                <h4>Tem&aacute;tica del proyecto</h4>
                <p>
                    <label>Objetivo general</label>
                    <strong><%= Html.Encode(Model.Form.ObjetivoGeneral)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Palabra clave 1</label>
                    <strong><%= Html.Encode(Model.Form.PalabraClave1)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Palabra clave 2</label>
                    <strong><%= Html.Encode(Model.Form.PalabraClave2)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Palabra clave 3</label>
                    <strong><%= Html.Encode(Model.Form.PalabraClave3)%>&nbsp;</strong>
                </p>
                <p>
                    <label>L&iacute;nea tem&aacute;tica institucional</label>
                    <strong><%= Html.Encode(Model.Form.LineaTematicaNombre)%>&nbsp;</strong>
                </p>
                <p>
                    <label>&Aacute;rea tem&aacute;tica institucional</label>
                    <strong><%= Html.Encode(Model.Form.AreaTematicaNombre)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Impacto en la pol&iacute;tica p&uacute;blica</label>
                    <strong><%= Html.Encode(Model.Form.ImpactoPoliticaPublicaNombre)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Impacto acad&eacute;mico esperado</label>
                    <strong><%= Html.Encode(Model.Form.ImpactoAcademicoEsperado)%>&nbsp;</strong>
                </p>
                <p>    
                    <label>Usuarios potenciales</label>
                    <strong><%= Html.Encode(Model.Form.UsuariosPotenciales)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Posibles beneficiarios</label>
                    <strong><%= Html.Encode(Model.Form.PosiblesBeneficiarios)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Requiere servicio de la USEG</label>
                    <strong><%= Html.Encode(Model.Form.RequiereServicioUSEG)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Servicio USEG</label>
                    <strong><%= Html.Encode(Model.Form.USEGNombre)%>&nbsp;</strong>
                </p>
                <h4>Productos acad&eacute;micos contemplados</h4>
                <p>
                    <label>Producto acad&eacute;mico</label>
                    <strong><%= Html.Encode(Model.Form.ProductoAcademicoNombre)%>&nbsp;</strong>
                </p>
                <p>
	                <label>Actividad prevista</label>
	                <strong><%= Html.Encode(Model.Form.ActividadPrevistaNombre)%>&nbsp;</strong>
                </p>
                <p>
	                <label>Fecha de entrega</label>
	                <strong><%= Html.Encode(Model.Form.FechaEntregaProducto)%>&nbsp;</strong><span>Formato (dd/mm/yyyy)</span>
                </p>
                <h4>Participaci&oacute;n de estudiantes</h4>
                <p>
	                <label>Participa estudiante</label>
                    <strong><%= Html.Encode(Model.Form.ParticipaEstudiante)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Nombre del estudiante</label>
                    <strong><%= Html.Encode(Model.Form.NombreEstudiante)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Tipo de estudiante</label>
                    <strong><%= Html.Encode(Model.Form.TipoEstudianteNombre)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Grado acad&eacute;mico</label>
                    <strong><%= Html.Encode(Model.Form.GradoAcademicoNombre)%>&nbsp;</strong>
                </p>
                <h4>Opcionales CVU</h4>
                <p>
                    <label>Sector</label>
                    <strong><%= Html.Encode(Model.Form.SectorNombre)%>&nbsp;</strong>
                </p>
                <p>
	                <label>Organizaci&oacute;n</label>
	                <strong><%= Html.Encode(Model.Form.OrganizacionNombre)%>&nbsp;</strong>
                </p>
                <p>
	                <label>Nivel 2</label>
	                <strong><%= Html.Encode(Model.Form.Nivel2Nombre)%>&nbsp;</strong>
                </p>
                <p>
	                <label>Nivel 3</label>
                    <strong><%= Html.Encode(Model.Form.Nivel3Nombre)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Nivel 4</label>
                    <strong><%= Html.Encode(Model.Form.Nivel4Nombre)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Nivel 5</label>
                    <strong><%= Html.Encode(Model.Form.Nivel5Nombre)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Nivel 6</label>
                    <strong><%= Html.Encode(Model.Form.Nivel6Nombre)%>&nbsp;</strong>
                </p>
                <p>
                    <label>&Aacute;rea</label>
                    <strong><%= Html.Encode(Model.Form.AreaNombre)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Disciplina</label>
                    <strong><%= Html.Encode(Model.Form.DisciplinaNombre)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Subdisciplina</label>
                    <strong><%= Html.Encode(Model.Form.SubdisciplinaNombre)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Sector econ&oacute;mico</label>
                    <strong><%= Html.Encode(Model.Form.SectorEconomicoNombre)%>&nbsp;</strong>
                </p>
                <p>
	                <label>Rama</label>
	                <strong><%= Html.Encode(Model.Form.RamaNombre)%>&nbsp;</strong>
                </p>
                <p>
	                <label>Clase</label>
	                <strong><%= Html.Encode(Model.Form.ClaseNombre)%>&nbsp;</strong>
                </p>
                
                <p class="submit">
                    <%=Html.ActionLink<ProyectoController>(x => x.Index(), "Regresar") %>
                </p>
             </div><!--end campos-->
        </div><!--end lista-->

    </div><!--end textos-->
    
<script type="text/javascript">
    $(document).ready(function() {
        setupDocument();
    });
</script>
</asp:Content>
