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
                <h4>Informaci&oacute;n general del proyecto</h4>
                <p>
                    <label>Nombre</label>
                    <span class="valor"><%= Html.Encode(Model.Form.Nombre)%>&nbsp;</span>
                </p>
                <p>
                    <label>Tipo de proyecto</label>
                    <span class="valor"><%= Html.Encode(Model.Form.TipoProyectoNombre)%>&nbsp;</span>
                </p>
                
                <h4>Investigadores participantes</h4>
                <% Html.RenderPartial("_ShowResponsable", Model.Form);%>
                <% Html.RenderPartial("_ShowParticipanteInterno", new ParticipanteForm { ParticipantesInternos = Model.Form.ParticipanteInternoProyectos, ModelId = Model.Form.Id });%>
	            <% Html.RenderPartial("_ShowParticipanteExterno", new ParticipanteForm { ParticipantesExternos = Model.Form.ParticipanteExternoProyectos, ModelId = Model.Form.Id });%>
                
                <h4>Calendario del proyecto</h4>
                <p>
                    <label>Fecha inicial</label>
                    <span class="valor"><%= Html.Encode(Model.Form.FechaInicial)%>&nbsp;</span>
                    <span>Formato (dd/mm/yyyy)</span>
                </p>
                <p>
                    <label>Fecha final</label>
                    <span class="valor"><%= Html.Encode(Model.Form.FechaFinal) %>&nbsp;</span>
                    <span>Formato (dd/mm/yyyy)</span>
                </p>
                <p>
                    <label>Fecha de pr&oacute;rroga</label>
                    <span class="valor"><%= Html.Encode(Model.Form.FechaProrroga)%>&nbsp;</span>
                    <span>Formato (dd/mm/yyyy)</span>
                </p>
                <p>
                    <label>Estatus del proyecto</label>
                    <span class="valor"><%= HumanizeHelper.EstadoProyecto(Model.Form.EstadoProyecto)%>&nbsp;</span>
                </p>
                <%if(Model.Form.EstadoProyecto == 2) { %>
                    <p>
                        <label>Fecha de conclusi&oacute;n</label>
                        <span class="valor"><%= Html.Encode(Model.Form.FechaConclusion)%>&nbsp;</span>
                        <span>Formato (dd/mm/yyyy)</span>
                    </p>
                <% } %>
                <p>
                    <label>Obra publicada</label>
                    <span class="valor">
                        <%if(!String.IsNullOrEmpty(Model.Form.ComprobanteCalendarioProyectoNombre)) { %> 
    	                    <%=Html.ActionLink<ArchivoController>(x => x.Show(Model.Form.ComprobanteCalendarioProyectoId), Model.Form.ComprobanteCalendarioProyectoNombre, new { target = "_blank" })%> 
    	                <% } else { %>
    	                    &nbsp;
    	                <% } %>
                    </span><br />
                </p>
                
                <h4>Fuentes de financiamiento</h4>
                <p>
                    <label></label>
                    ¿Proyecto con recursos complementarios?
                    <span class="valor"><%= HumanizeHelper.Boolean(Model.Form.ConRecursos) %>&nbsp;</span>
                </p>
                <%if(Model.Form.ConRecursos) { %>
                    <p>
                        <label></label>
                        ¿Cuenta con convenio?
                        <span class="valor"><%= HumanizeHelper.Boolean(Model.Form.ConConvenio) %>&nbsp;</span>
                    </p>
                    <%if(Model.Form.ConConvenio) { %>
                        <p>
                            <label>Nombre del convenio</label>
                            <span class="valor"><%= Html.Encode(Model.Form.SectorFinanciamientoNombre)%>&nbsp;</span>
                        </p>
                        <p>
                            <label>Fecha de la firma del contrato</label>
                            <span id="span_fechafirma" class="valor"><%=Html.Encode(Model.Form.ConvenioFechaFirma)%>&nbsp;</span>
                        </p>
                        <p>
                            <label>Fecha de conclusi&oacute;n</label>
                            <span id="span_fechaconclusion" class="valor"><%=Html.Encode(Model.Form.ConvenioFechaConclusion)%>&nbsp;</span>
                        </p>
                        <p>
                            <label>Termino referencia</label>
                            <span id="span_terminoreferencia" class="valor"><%=Html.Encode(Model.Form.ConvenioTerminoReferencia)%>&nbsp;</span>
                        </p>
                        <p>
                            <label>Producto comprometido</label>
                            <span id="span_productocomprometido" class="valor"><%=Html.Encode(Model.Form.ConvenioProductoComprometido)%>&nbsp;</span>
                        </p>
                    <% } %>
                <% } %>
                <p>
                    <label>Sector de financiamiento</label>
                    <span class="valor"><%= Html.Encode(Model.Form.SectorFinanciamientoNombre)%>&nbsp;</span>
                </p>
                <%if(Model.Form.SectorFinanciamientoNombre.Contains("Fondos CONACyT")) { %>
                    <p>
                        <label>Fondo del CONACyT</label>
                        <span class="valor"><%= Html.Encode(Model.Form.FondoConacytNombre)%>&nbsp;</span>
                    </p>
                <% } %>
                
                <h4>Recursos financieros</h4>
                <% Html.RenderPartial("_ShowRecursoFinanciero", Model.Form); %>
                <p>
                    <label></label>
                    Total pesos: <span id="totalpesos" class="valor"><%=Html.Encode(Math.Round(Model.Form.TotalPesos, 2)) %></span>
                    Total d&oacute;lares: <span id="totaldolares" class="valor"><%=Html.Encode(Math.Round(Model.Form.TotalDolares, 2)) %></span>
                </p>
                
                <h4>Tem&aacute;tica del proyecto</h4>
                <p>
                    <label>Objetivo general</label>
                    <span class="valor"><%= Html.Encode(Model.Form.ObjetivoGeneral)%>&nbsp;</span>
                </p>
                
                <% Html.RenderPartial("_ShowAreaTematica", Model.Form.ShowFields); %>
                
                <p>
                    <label>Impacto en la pol&iacute;tica p&uacute;blica</label>
                    <span class="valor"><%= HumanizeHelper.ImpactoPoliticaPublica(Model.Form.ImpactoPoliticaPublica)%>&nbsp;</span>
                </p>
                <p>
                    <label>Vinculaci&oacute;n con la APyD</label>
                    <span class="valor"><%= Html.Encode(Model.Form.VinculacionAPyDNombre)%>&nbsp;</span>
                </p>
                <p>
                    <label>Resumen del proyecto</label>
                    <span class="valor"><%= Html.Encode(Model.Form.ResumenProyecto)%>&nbsp;</span>
                </p>
                
                <% Html.RenderPartial("_ShowSubdisciplina", Model.Form.ShowFields); %>
                
                <p>
                    <label>Documento probatorio</label>
                    <span class="valor">
                        <%if(!String.IsNullOrEmpty(Model.Form.ComprobanteTematicaProyectoNombre)) { %> 
    	                    <%=Html.ActionLink<ArchivoController>(x => x.Show(Model.Form.ComprobanteTematicaProyectoId), Model.Form.ComprobanteTematicaProyectoNombre, new { target = "_blank" })%> 
    	                <% } else { %>
    	                    &nbsp;
    	                <% } %>
                    </span><br />
                </p>
                
                <h4>Productos acad&eacute;micos contemplados</h4>
                <p>
                    <label>Actividades a realizar</label>
                    <span class="valor"><%= Html.Encode(Model.Form.Actividades)%>&nbsp;</span>
                </p>
                <p>
                    <label>Productos acad&eacute;micos esperados</label>
                    <span class="valor"><%= Html.Encode(Model.Form.ProductoAcademicoEsperado)%>&nbsp;</span>
                </p>
                
                <h4>Participaci&oacute;n de estudiantes/becarios</h4>
                <p>
	                <label></label> ¿Participan estudiantes?
                    <span class="valor"><%= HumanizeHelper.Boolean(Model.Form.ParticipaEstudiante)%>&nbsp;</span>
                </p>
                <%if (Model.Form.ParticipaEstudiante) { %>
                    <% Html.RenderPartial("_ShowParticipaEstudiante", Model.Form); %>
                <% } %>
                
            	<% Html.RenderPartial("_Show2doNivel", Model.Form.ShowFields); %>
            	<% Html.RenderPartial("_ShowClase", Model.Form.ShowFields); %>
            	
            	<h4>Productos generados del proyecto</h4>
            	<% Html.RenderPartial("_ShowProductoGenerado", Model.Form); %>
                
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
