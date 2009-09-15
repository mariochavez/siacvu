<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true"
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<GrupoInvestigacionForm>>" %>
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
            Aqu&iacute; se muestra la informaci&oacute;n detallada del grupo de investigaci&oacute;n como est&aacute; en el sistema.
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
                    <label>Nombre del grupo de investigaci&oacute;n</label>
                    <strong><%= Html.Encode(Model.Form.NombreGrupoInvestigacion)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Fecha de creaci&oacute;n</label>
                    <strong><%= Html.Encode(Model.Form.FechaCreacion)%>&nbsp;</strong><span>Formato (dd/mm/yyyy)</span>
                </p>
                <h4>Estructura funcional</h4>
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
                    <label>L&iacute;der</label>
                    <strong><%= Html.Encode(Model.Form.Lider)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Nombre</label>
                    <strong><%= Html.Encode(Model.Form.Nombre)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Miembros</label>
                    <strong><%= Html.Encode(Model.Form.Miembros)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Impacto</label>
                    <strong><%= Html.Encode(Model.Form.Impacto)%>&nbsp;</strong>
                </p>
                <p>
	                <label>Vinculaci&oacute;n del sector productivo</label>
	                <strong><%= Html.Encode(Model.Form.VinculacionSectorProductivo)%>&nbsp;</strong>
                </p>
                <p>
	                <label>Vinculaci&oacute;n del sector social</label>
	                <strong><%= Html.Encode(Model.Form.VinculacionSectorSocial)%>&nbsp;</strong>
                </p>
                <p>
	                <label>Colaboraci&oacute;n</label>
                    <strong><%= Html.Encode(Model.Form.Colaboracion)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Administraci&oacute;n</label>
                    <strong><%= Html.Encode(Model.Form.Administracion)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Programa registrado</label>
                    <strong><%= Html.Encode(Model.Form.ProgramaRegistrado)%>&nbsp;</strong>
                </p>
                
                <p class="submit">
                    <%=Html.ActionLink<GrupoInvestigacionController>(x => x.Index(), "Regresar") %>
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
