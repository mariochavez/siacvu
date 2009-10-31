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
                    <strong><%= Html.Encode(Model.Form.DepartamentoNombre)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Sede</label>
                    <strong><%= Html.Encode(Model.Form.SedeNombre)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Nombre del evento</label>
                    <strong><%= Html.Encode(Model.Form.Nombre) %>&nbsp;</strong>
                </p>
                <p>
                    <label>Tipo de evento</label>
                    <strong><%= Html.Encode(Model.Form.TipoEventoNombre)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Tipo de participaci&oacute;n</label>
                    <strong><%= Html.Encode(Model.Form.TipoParticipacionNombre)%>&nbsp;</strong>
                </p>
                
                <% Html.RenderPartial("_ShowInstitucion", Model.Form); %>
                
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
                    <label>&Aacute;mbito</label>
                    <strong><%= Html.Encode(Model.Form.AmbitoNombre)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Con invitaci&oacute;n</label>
                    <strong><%= HumanizeHelper.Boolean(Model.Form.Invitacion)%>&nbsp;</strong>
                </p>
                <p>
                    <label>T&iacute;tulo del trabajo</label>
                    <strong><%= Html.Encode(Model.Form.TituloTrabajo)%>&nbsp;</strong>
                </p>
                
                <h4>Coautores</h4>
				<% Html.RenderPartial("_ShowCoautorInterno",
                                       new CoautorForm { CoautoresInternos = Model.Form.CoautorInternoEventos, ModelId = Model.Form.Id });%>
	            <% Html.RenderPartial("_ShowCoautorExterno",
                                       new CoautorForm { CoautoresExternos = Model.Form.CoautorExternoEventos, ModelId = Model.Form.Id });%>
                

                <p>
                    <label>Fecha del evento</label>
                    <strong><%= Html.Encode(Model.Form.FechaEvento)%>&nbsp;</strong><span>Formato (dd/mm/yyyy)</span>
                </p>
                <p>
                    <label>Lugar(Ciudad/Estado)</label>
                    <strong><%= Html.Encode(Model.Form.Lugar)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Pa&iacute;s</label>
                    <strong><%= Html.Encode(Model.Form.PaisNombre)%>&nbsp;</strong>
                </p>
                
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
