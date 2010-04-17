<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true"
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<EventoForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Core"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Productos"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DI.Colef.Sia.Web.Controllers" %>

<asp:Content ID="titleContent" ContentPlaceHolderID="TituloPlaceHolder" runat="server">
    <h2>
        <%=Html.ProductoShowTitle(TipoProductoEnum.Evento) %>
    </h2>
</asp:Content>

<asp:Content ID="introductionContent" ContentPlaceHolderID="IntroduccionPlaceHolder" runat="server">
    <div id="introduccion">
        <p>
            <%=Html.ProductoShowMessage(TipoProductoEnum.Evento) %>
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
                    <label>Nombre</label>
                    <span class="valor"><%= Html.Encode(Model.Form.InvestigadorNombre)%>&nbsp;</span>
                </p>
	            <p>
                    <label>Departamento</label>
                    <span class="valor"><%= Html.Encode(Model.Form.DepartamentoNombre)%>&nbsp;</span>
                </p>
                <p>
                    <label>Sede</label>
                    <span class="valor"><%= Html.Encode(Model.Form.SedeNombre)%>&nbsp;</span>
                </p>
                <h4>Eventos acad&eacute;micos</h4>
                <p>
                    <label>Nombre del evento</label>
                    <span class="valor"><%= Html.Encode(Model.Form.Nombre) %>&nbsp;</span>
                </p>
                
                <p>
                    <label>
                        L&iacute;nea tem&aacute;tica institucional</label>
                    <span class="valor">
                        <%= Html.Encode(Model.Form.AreaTematica.LineaTematicaNombre) %>&nbsp; </span>
                </p>
                <p>
                    <label>
                        &Aacute;rea tem&aacute;tica institucional</label>
                    <span class="valor">
                        <%= Html.Encode(Model.Form.AreaTematica.Nombre) %>&nbsp; </span>
                </p>
                
                <p>
                    <label>Tipo de evento</label>
                    <span class="valor"><%= Html.Encode(Model.Form.TipoEventoNombre)%>&nbsp;</span>
                </p>
                <p>
                    <label>Tipo de participaci&oacute;n</label>
                    <span class="valor"><%= Html.Encode(Model.Form.TipoParticipacionNombre)%>&nbsp;</span>
                </p>
                
                <% Html.RenderPartial("_ShowInstitucion", new InstitucionForm { Instituciones = Model.Form.InstitucionEventos, ModelId = Model.Form.Id }); %>
                
                <% if (Model.Form.TipoEventoNombre.Contains("Evento Estratégico (El Colef)") && Model.Form.TipoParticipacionNombre.Contains("Organizador")){ %>
                    <h4>Tem&aacute;tica y financiamiento del evento</h4>
                    <p>
                        <label>Objetivo del evento</label>
                        <span class="valor"><%= Html.Encode(Model.Form.ObjetivoEvento)%>&nbsp;</span>
                    </p>
                    <p>
                        <label>Financiamiento interno</label>
                        <span class="valor"><%= Html.Encode(Model.Form.FinanciamientoInterno)%>&nbsp;</span>
                    </p>
                    <p>
                        <label>Financiamiento externo</label>
                        <span class="valor"><%= Html.Encode(Model.Form.FinanciamientoExterno)%>&nbsp;</span>
                    </p>
                    <p>
                        <label>Sesiones de trabajo programadas</label>
                        <span class="valor"><%= Html.Encode(Model.Form.SesionesTrabajo)%>&nbsp;</span>
                    </p>
                    
                    <h4>Sesion(es) del evento estrat&eacute;gico</h4>
                    <% Html.RenderPartial("_ShowSesion", Model.Form); %>
                    
                <% } else {%>
                    <% Html.RenderPartial("_ShowPalabrasClave", Model.Form.ShowFields); %>
                    
                    <p>
                        <label>Con invitaci&oacute;n</label>
                        <span class="valor"><%= HumanizeHelper.Boolean(Model.Form.Invitacion)%>&nbsp;</span>
                    </p>
                <% } %>
                
                <% if (Model.Form.TipoParticipacionNombre.Contains("Conferencista magistral") || Model.Form.TipoParticipacionNombre.Contains("Ponente")){ %>
                    <p>
                        <label>T&iacute;tulo del trabajo</label>
                        <span class="valor"><%= Html.Encode(Model.Form.TituloTrabajo)%>&nbsp;</span>
                    </p>
                    
                <h4>
                    <a href="#coautores_area" class="collapsable <%=Html.CollapsePanelClass(Model.Form.CoautorExternoEventos.Length + Model.Form.CoautorInternoEventos.Length) %>">
                        <span class="ui-icon ui-icon-circle-arrow-s"></span>Coautores del art&iacute;culo
                        de investigaci&oacute;n <span>
                            <%=Html.Encode(Model.Form.CoautorExternoEventos.Length + Model.Form.CoautorInternoEventos.Length)%>
                            coautor(es) </span><span class="cvu"></span></a>
                </h4>
                <span id="coautores_area">
				    <% Html.RenderPartial("_ShowCoautorInterno", new CoautorForm { CoautoresInternos = Model.Form.CoautorInternoEventos, CoautorSeOrdenaAlfabeticamente = Model.Form.CoautorSeOrdenaAlfabeticamente }); %>
	                <% Html.RenderPartial("_ShowCoautorExterno", new CoautorForm { CoautoresExternos = Model.Form.CoautorExternoEventos, CoautorSeOrdenaAlfabeticamente = Model.Form.CoautorSeOrdenaAlfabeticamente }); %>
	                <% Html.RenderPartial("_CoautorEmptyListMessage", new CoautorForm { CoautoresExternos = Model.Form.CoautorExternoEventos, CoautoresInternos = Model.Form.CoautorInternoEventos }); %>
                    <p>
                        <label>Investigador</label>
                        <span class="valor"><%=Html.Encode(Model.Form.InvestigadorNombre) %></span>
                        <label class="right">Posici&oacute;n</label>
                        <span class="valor"><%=Html.Encode(Model.Form.PosicionCoautor)%>&nbsp;</span>
                    </p>
                    </span>
	            <% } %>
	            <% Html.RenderPartial("_ShowArchivo", Model.Form); %>
                
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