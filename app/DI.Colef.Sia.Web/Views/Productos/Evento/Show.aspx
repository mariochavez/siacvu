<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true"
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<EventoForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
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
            Aqu&iacute; se muestra la informaci&oacute;n detallada del evento como est&aacute; en el sistema.
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
                <h4>Datos del investigador</h4>
	            <p>
                    <label>Departamento</label>
                    <span class="valor"><%= Html.Encode(Model.Form.DepartamentoNombre)%>&nbsp;</span>
                </p>
                <p>
                    <label>Sede</label>
                    <span class="valor"><%= Html.Encode(Model.Form.SedeNombre)%>&nbsp;</span>
                </p>
                <h4>Datos del evento</h4>
                <p>
                    <label>Nombre del evento</label>
                    <span class="valor"><%= Html.Encode(Model.Form.Nombre) %>&nbsp;</span>
                </p>
                <p>
                    <label>Tipo de evento</label>
                    <span class="valor"><%= Html.Encode(Model.Form.TipoEventoNombre)%>&nbsp;</span>
                </p>
                <p>
                    <label>Objetivo del evento</label>
                    <span class="valor"><%= Html.Encode(Model.Form.ObjetivoEvento)%>&nbsp;</span>
                </p>
                <p>
                    <label>Tipo de participaci&oacute;n</label>
                    <span class="valor"><%= Html.Encode(Model.Form.TipoParticipacionNombre)%>&nbsp;</span>
                </p>
                
                <% if (Model.Form.TipoEventoNombre.Contains("Evento Estratégico (El Colef)")){ %>
                    <% Html.RenderPartial("_ShowInstitucion", new InstitucionForm { Instituciones = Model.Form.InstitucionEventos, ModelId = Model.Form.Id }); %>
                <% } %>
                
                <% Html.RenderPartial("_ShowPalabrasClave", Model.Form.ShowFields); %>
                
                <p>
                    <label>&Aacute;mbito</label>
                    <span class="valor"><%= Html.Encode(Model.Form.AmbitoNombre)%>&nbsp;</span>
                </p>
                <p>
                    <label>Con invitaci&oacute;n</label>
                    <span class="valor"><%= HumanizeHelper.Boolean(Model.Form.Invitacion)%>&nbsp;</span>
                </p>
                
                <% if (Model.Form.TipoParticipacionNombre.Contains("Conferencista magistral") || Model.Form.TipoParticipacionNombre.Contains("Ponente")){ %>
                    <p>
                        <label>T&iacute;tulo del trabajo</label>
                        <span class="valor"><%= Html.Encode(Model.Form.TituloTrabajo)%>&nbsp;</span>
                    </p>
                    
                    <h4>Coautores</h4>
				    <% Html.RenderPartial("_ShowCoautorInterno",
                                           new CoautorForm { CoautoresInternos = Model.Form.CoautorInternoEventos, ModelId = Model.Form.Id });%>
	                <% Html.RenderPartial("_ShowCoautorExterno",
                                           new CoautorForm { CoautoresExternos = Model.Form.CoautorExternoEventos, ModelId = Model.Form.Id });%>
                    
                    <p>
	                    <label>Total de autores</label>
	                    <span id="totalcoautores" class="valor"><%=Html.Encode(Model.Form.TotalAutores)%></span>	          
	                </p>
	                <p>
	                    <label>Posici&oacute;n del autor</label>
	                    <span class="valor"><%=Html.Encode(Model.Form.PosicionAutor) %></span>
	                </p>
	            <% } %>
	            
                <p>
                    <label>Fecha del evento</label>
                    <span class="valor"><%= Html.Encode(Model.Form.FechaEvento)%>&nbsp;</span>
                    <span>Formato (dd/mm/yyyy)</span>
                </p>
                <p>
                    <label>Lugar(Ciudad/Estado)</label>
                    <span class="valor"><%= Html.Encode(Model.Form.Lugar)%>&nbsp;</span>
                </p>
                
                <% if(Model.Form.AmbitoNombre.Contains("Binacional") || Model.Form.AmbitoNombre.Contains("Internacional")){ %>
                    <p>
                        <label>Pa&iacute;s</label>
                        <span class="valor"><%= Html.Encode(Model.Form.PaisNombre)%>&nbsp;</span>
                    </p>
                <% } %>
                
                <p class="submit">
                    <%=Html.ActionLink<EventoController>(x => x.Index(), "Regresar") %>
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