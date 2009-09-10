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
            <div class="elementodescripcion">
                <p>
                    <label>Nombre del grupo de investigaci&oacute;n</label>
                    <%= Html.Encode(Model.Form.NombreGrupoInvestigacion)%>
                </p>
                <p>
                    <label>Fecha de creaci&oacute;n</label>
                    <%= Html.Encode(Model.Form.FechaCreacion) == "" ? "<span>No hay fecha de creación registrada</span>" : Html.Encode(Model.Form.FechaCreacion)%>
                </p>
                <h4>Estructura funcional</h4>
                <p>
	                <label>Sector</label>
	                <%= Html.Encode(Model.Form.SectorNombre) == "" ? "<span>No hay sector registrado</span>" : Html.Encode(Model.Form.SectorNombre)%>    
                </p>
                <p>
	                <label>Organizaci&oacute;n</label>
	                <%= Html.Encode(Model.Form.OrganizacionNombre) == "" ? "<span>No hay organización registrada</span>" : Html.Encode(Model.Form.OrganizacionNombre)%>    
                </p>
                <p>
	                <label>Nivel 2</label>
                    <%= Html.Encode(Model.Form.Nivel2Nombre) == "" ? "<span>No hay nivel 2 registrado</span>" : Html.Encode(Model.Form.Nivel2Nombre)%>
                </p>
                <p>
	                <label>Nivel 3</label>
                    <%= Html.Encode(Model.Form.Nivel3Nombre) == "" ? "<span>No hay nivel 3 registrado</span>" : Html.Encode(Model.Form.Nivel3Nombre)%>
                </p>
                <p>
	                <label>Nivel 4</label>
                    <%= Html.Encode(Model.Form.Nivel4Nombre) == "" ? "<span>No hay nivel 4 registrado</span>" : Html.Encode(Model.Form.Nivel4Nombre)%>
                </p>
                <p>
	                <label>Nivel 5</label>
                    <%= Html.Encode(Model.Form.Nivel5Nombre) == "" ? "<span>No hay nivel 5 registrado</span>" : Html.Encode(Model.Form.Nivel5Nombre)%>
                </p>
                <p>
	                <label>Nivel 6</label>
                    <%= Html.Encode(Model.Form.Nivel6Nombre) == "" ? "<span>No hay nivel 6 registrado</span>" : Html.Encode(Model.Form.Nivel6Nombre)%>
                </p>
                <p>
                    <label>L&iacute;der</label>
                    <%= Html.Encode(Model.Form.Lider) == "" ? "<span>No hay líder registrado</span>" : Html.Encode(Model.Form.Lider)%>    
                </p>
                <p>
                    <label>Nombre</label>
                    <%= Html.Encode(Model.Form.Nombre) == "" ? "<span>No hay nombre registrado</span>" : Html.Encode(Model.Form.Nombre)%>    
                </p>
                <p>
                    <label>Miembros</label>
                    <%= Html.Encode(Model.Form.Miembros) == "" ? "<span>No hay miembros registrados</span>" : Html.Encode(Model.Form.Miembros)%>    
                </p>
                <p>
                    <label>Impacto</label>
                    <%= Html.Encode(Model.Form.Impacto) == "" ? "<span>No hay impacto registrado</span>" : Html.Encode(Model.Form.Impacto)%>    
                </p>
                <p>
	                <label>Vinculaci&oacute;n del sector productivo</label>
	                <%= Html.Encode(Model.Form.VinculacionSectorProductivo) == "" ? "<span>No hay vinculación del sector productivo registrado</span>" : Html.Encode(Model.Form.VinculacionSectorProductivo)%>    
                </p>
                <p>
	                <label>Vinculaci&oacute;n del sector social</label>
	                <%= Html.Encode(Model.Form.VinculacionSectorSocial) == "" ? "<span>No hay vinculación del sector social registrado</span>" : Html.Encode(Model.Form.VinculacionSectorSocial)%>    
                </p>
                <p>
	                <label>Colaboraci&oacute;n</label>
                    <%= Html.Encode(Model.Form.Colaboracion) == "" ? "<span>No hay colaboración registrada</span>" : Html.Encode(Model.Form.Colaboracion)%>    
                </p>
                <p>
                    <label>Administraci&oacute;n</label>
                    <%= Html.Encode(Model.Form.Administracion) == "" ? "<span>No hay administración registrada</span>" : Html.Encode(Model.Form.Administracion)%>    
                </p>
                <p>
                    <label>Programa registrado</label>
                    <%= Html.Encode(Model.Form.ProgramaRegistrado) == "" ? "<span>No hay programa registrado</span>" : Html.Encode(Model.Form.ProgramaRegistrado)%>
                </p>
                
                <p class="submit">
                    <%=Html.ActionLink<GrupoInvestigacionController>(x => x.Index(), "Regresar") %>
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
