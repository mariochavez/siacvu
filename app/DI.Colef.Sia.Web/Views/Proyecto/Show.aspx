<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true"
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<ProyectoForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
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
                    <span class="valor"><%= Html.Encode(Model.Form.Nombre)%>&nbsp;</span>
                </p>
                <p>
                    <label>Tipo de proyecto</label>
                    <span class="valor"><%= Html.Encode(Model.Form.TipoProyectoNombre)%>&nbsp;</span>
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
                    <span class="valor"><%= HumanizeHelper.Boolean(Model.Form.ConConvenio)%>&nbsp;</span>
                </p>
                <p>
                    <label>Nombre del convenio</label>
                    <span class="valor"><%= Html.Encode(Model.Form.Convenio)%>&nbsp;</span>
                </p>
                <p>
                    <label>Fecha inicial</label>
                    <span class="valor"><%= Html.Encode(Model.Form.FechaInicial)%>&nbsp;</span><span>Formato (dd/mm/yyyy)</span>
                </p>
                <p>
                    <label>Fecha final</label>
                    <span class="valor"><%= Html.Encode(Model.Form.FechaFinal) %>&nbsp;</span><span>Formato (dd/mm/yyyy)</span>
                </p>
                <p>
                    <label>Fecha de pr&oacute;rroga</label>
                    <span class="valor"><%= Html.Encode(Model.Form.FechaProrroga)%>&nbsp;</span><span>Formato (dd/mm/yyyy)</span>
                </p>
                <p>
                    <label>Estatus del proyecto</label>
                    <span class="valor"><%= Html.Encode(Model.Form.EstatusProyectoNombre)%>&nbsp;</span>
                </p>
                <p>
                    <label>Fecha de conclusi&oacute;n</label>
                    <span class="valor"><%= Html.Encode(Model.Form.FechaConclusion)%>&nbsp;</span><span>Formato (dd/mm/yyyy)</span>
                </p>
                <p>
                    <label>Proyecto con recursos complementarios</label>
                    <span class="valor"><%= HumanizeHelper.Boolean(Model.Form.ConRecursos) %>&nbsp;</span>
                </p>                
                <h4>Financiamiento del proyecto</h4>
                <p>
                    <label>Sector de financiamiento</label>
                    <span class="valor"><%= Html.Encode(Model.Form.SectorFinanciamientoNombre)%>&nbsp;</span>
                </p>
                <p>
                    <label>Fondo del CONACyT</label>
                    <span class="valor"><%= Html.Encode(Model.Form.FondoConacytNombre)%>&nbsp;</span>
                </p>
                <h4>Recursos Financieros</h4>
                
                <h4>Tem&aacute;tica del proyecto</h4>
                <p>
                    <label>Objetivo general</label>
                    <span class="valor"><%= Html.Encode(Model.Form.ObjetivoGeneral)%>&nbsp;</span>
                </p>
                <p>
                    <label>Palabra clave 1</label>
                    <span class="valor"><%= Html.Encode(Model.Form.PalabraClave1)%>&nbsp;</span>
                </p>
                <p>
                    <label>Palabra clave 2</label>
                    <span class="valor"><%= Html.Encode(Model.Form.PalabraClave2)%>&nbsp;</span>
                </p>
                <p>
                    <label>Palabra clave 3</label>
                    <span class="valor"><%= Html.Encode(Model.Form.PalabraClave3)%>&nbsp;</span>
                </p>
                <p>
                    <label>L&iacute;nea tem&aacute;tica institucional</label>
                    <span class="valor"><%= Html.Encode(Model.Form.LineaTematicaNombre)%>&nbsp;</span>
                </p>
                <p>
                    <label>&Aacute;rea tem&aacute;tica institucional</label>
                    <span class="valor"><%= Html.Encode(Model.Form.AreaTematicaNombre)%>&nbsp;</span>
                </p>
                <p>
                    <label>Impacto en la pol&iacute;tica p&uacute;blica</label>
                    <span class="valor"><%= Html.Encode(Model.Form.ImpactoPoliticaPublicaNombre)%>&nbsp;</span>
                </p>
                <p>
                    <label>Impacto acad&eacute;mico esperado</label>
                    <span class="valor"><%= Html.Encode(Model.Form.ImpactoAcademicoEsperado)%>&nbsp;</span>
                </p>
                <p>    
                    <label>Usuarios potenciales</label>
                    <span class="valor"><%= Html.Encode(Model.Form.UsuariosPotenciales)%>&nbsp;</span>
                </p>
                <p>
                    <label>Posibles beneficiarios</label>
                    <span class="valor"><%= Html.Encode(Model.Form.PosiblesBeneficiarios)%>&nbsp;</span>
                </p>
                <p>
                    <label>Requiere servicio de la USEG</label>
                    <span class="valor"><%= HumanizeHelper.Boolean(Model.Form.RequiereServicioUSEG)%>&nbsp;</span>
                </p>
                <p>
                    <label>Servicio USEG</label>
                    <span class="valor"><%= Html.Encode(Model.Form.USEGNombre)%>&nbsp;</span>
                </p>
                <h4>Productos acad&eacute;micos contemplados</h4>
                <p>
                    <label>Producto acad&eacute;mico</label>
                    <span class="valor"><%= Html.Encode(Model.Form.ProductoAcademicoNombre)%>&nbsp;</span>
                </p>
                <p>
	                <label>Actividad prevista</label>
	                <span class="valor"><%= Html.Encode(Model.Form.ActividadPrevistaNombre)%>&nbsp;</span>
                </p>
                <p>
	                <label>Fecha de entrega</label>
	                <span class="valor"><%= Html.Encode(Model.Form.FechaEntregaProducto)%>&nbsp;</span><span>Formato (dd/mm/yyyy)</span>
                </p>
                <h4>Participaci&oacute;n de estudiantes</h4>
                <p>
	                <label>Participa estudiante</label>
                    <span class="valor"><%= HumanizeHelper.Boolean(Model.Form.ParticipaEstudiante)%>&nbsp;</span>
                </p>
                <p>
                    <label>Nombre del estudiante</label>
                    <span class="valor"><%= Html.Encode(Model.Form.NombreEstudiante)%>&nbsp;</span>
                </p>
                <p>
                    <label>Tipo de estudiante</label>
                    <span class="valor"><%= HumanizeHelper.TipoAlumnoCurso(Model.Form.TipoEstudiante)%>&nbsp;</span>
                </p>
                <p>
                    <label>Grado acad&eacute;mico</label>
                    <span class="valor"><%= Html.Encode(Model.Form.GradoAcademicoNombre)%>&nbsp;</span>
                </p>

            	<% Html.RenderPartial("_Show2doNivel", Model.Form.ShowFields); %>
                    
            	<% Html.RenderPartial("_ShowSubdisciplina", Model.Form.ShowFields); %>
            
            	<% Html.RenderPartial("_ShowClase", Model.Form.ShowFields); %>
                
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
