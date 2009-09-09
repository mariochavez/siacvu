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
            <div class="elementodescripcion">
                <p>
                    <label>Nombre</label>
                    <%= Html.Encode(Model.Form.Nombre)%>
                </p>
                <p>
                    <label>Siglas</label>
                    <%= Html.Encode(Model.Form.Siglas) == "" ? "<span>No hay siglas registradas</span>" : Html.Encode(Model.Form.Siglas)%>
                </p>
                <p>
                    <label>Tipo de &oacute;rgano</label>
                    <%= Html.Encode(Model.Form.TipoOrganoNombre) == "" ? "<span>No hay tipo de órgano registrado</span>" : Html.Encode(Model.Form.TipoOrganoNombre)%>
                </p>
                <p>
                    <label>Tipo de participaci&oacute;n</label>
                    <%= Html.Encode(Model.Form.TipoParticipacionNombre) == "" ? "<span>No hay tipo de participación registrada</span>" : Html.Encode(Model.Form.TipoParticipacionNombre)%>
                </p>
                <p>
                    <label>Sector</label>
                    <%= Html.Encode(Model.Form.SectorNombre) == "" ? "<span>No tiene sector registrado</span>" : Html.Encode(Model.Form.SectorNombre)%>
                </p>
                <p>
                    <label>Nivel gubernamental</label>
                    <%= Html.Encode(Model.Form.NivelNombre) == "" ? "<span>No hay nivel gubernamental registrado</span>" : Html.Encode(Model.Form.NivelNombre)%>
                </p>
                <p>
                    <label>Fecha inicial</label>
                    <%= Html.Encode(Model.Form.FechaInicial) == "" ? "<span>No hay fecha inicial registrada</span>" : Html.Encode(Model.Form.FechaInicial)%>
                </p>                
                <p>
                    <label>Fecha final</label>
                    <%= Html.Encode(Model.Form.FechaFinal) == "" ? "<span>No hay fecha final registrada</span>" : Html.Encode(Model.Form.FechaFinal)%>
                </p>
                <p>
                    <label>&Aacute;mbito</label>
                    <%= Html.Encode(Model.Form.Ambito) == "" ? "<span>No hay ámbito registrado</span>" : Html.Encode(Model.Form.Ambito)%>
                </p>                
                
                <p class="submit">
                    <%=Html.ActionLink<OrganoExternoController>(x => x.Index(), "Regresar") %>
                </p>
            </div><!--end elementodescripcion-->
        </div><!--end lista-->

    </div><!--end textos-->
    
<script type="text/javascript">
    $(document).ready(function() {
        setupDocument();
    });
</script>
</asp:Content>
