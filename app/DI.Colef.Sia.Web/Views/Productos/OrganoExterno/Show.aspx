<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true"
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<OrganoExternoForm>>" %>
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
            Aqu&iacute; se muestra la informaci&oacute;n detallada del &oacute;rgano externo como est&aacute; en el sistema.
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
                <h4>Datos del &Oacute;rgano Externo</h4>
                <p>
                    <label>Nombre</label>
                    <strong><%= Html.Encode(Model.Form.Nombre)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Describa su participaci&oacute;n</label>
                    <strong><%= Html.Encode(Model.Form.Participacion)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Fecha de inicio</label>
                    <strong><%= Html.Encode(Model.Form.FechaInicial)%>&nbsp;</strong><span>Formato (dd/mm/yyyy)</span>
                </p>                
                <p>
                    <label>Fecha de conclusi&oacute;n</label>
                    <strong><%= Html.Encode(Model.Form.FechaFinal)%>&nbsp;</strong><span>Formato (dd/mm/yyyy)</span>
                </p>
                <p>
                    <label>Siglas</label>
                    <strong><%= Html.Encode(Model.Form.Siglas)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Tipo de &oacute;rgano</label>
                    <strong><%= Html.Encode(Model.Form.TipoOrganoNombre)%>&nbsp;</strong>
                </p>                
                <p>
                    <label>Sector</label>
                    <strong><%= Html.Encode(Model.Form.SectorNombre)%>&nbsp;</strong>
                </p>
                <p>
                    <label>&Aacute;mbito</label>
                    <strong><%= Html.Encode(Model.Form.AmbitoNombre)%>&nbsp;</strong>
                </p>                
                
                <p class="submit">
                    <%=Html.ActionLink<OrganoExternoController>(x => x.Index(), "Regresar") %>
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