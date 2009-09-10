<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true"
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<ExperienciaProfesionalForm>>" %>
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
            Aqu&iacute; se muestra la informaci&oacute;n detallada de la experiencia profesional como est&aacute; en el sistema.
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
                    <label>Nombramiento</label>
                    <%= Html.Encode(Model.Form.Nombramiento) == "" ? "<span>No hay nombramiento registrado</span>" : Html.Encode(Model.Form.Nombramiento)%>
                </p>
                <p>
                    <label>Entidad</label>
                    <%= Html.Encode(Model.Form.Entidad) == "" ? "<span>No hay entidad registrada</span>" : Html.Encode(Model.Form.Entidad)%>
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
                    <label>Pa&iacute;s</label>
                    <%= Html.Encode(Model.Form.PaisNombre) == "" ? "<span>No hay país registrado</span>" : Html.Encode(Model.Form.PaisNombre)%>
                </p>
                <h4>Estructura funcional</h4>
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
                
                <h4>&Aacute;rea conocimiento</h4>
                <p>
                    <label>&Aacute;rea</label>
                    <%= Html.Encode(Model.Form.AreaNombre) == "" ? "<span>No hay área registrada</span>" : Html.Encode(Model.Form.AreaNombre)%>    
                </p>
                <p>
                    <label>Disciplina</label>
                    <%= Html.Encode(Model.Form.DisciplinaNombre) == "" ? "<span>No hay disciplina registrada</span>" : Html.Encode(Model.Form.DisciplinaNombre)%>
                </p>
                <p>
                    <label>Subdisciplina</label>
                    <%= Html.Encode(Model.Form.SubdisciplinaNombre) == "" ? "<span>No hay subdisciplina registrada</span>" : Html.Encode(Model.Form.SubdisciplinaNombre)%> 
                </p>                
                <h4>Actividad econ&oacute;mica</h4>
                <p>
                    <label>Sector</label>
                    <%= Html.Encode(Model.Form.SectorNombre) == "" ? "<span>No hay sector registrado</span>" : Html.Encode(Model.Form.SectorNombre)%>
                </p>
                <p>
                    <label>Rama</label>
                    <%= Html.Encode(Model.Form.RamaNombre) == "" ? "<span>No hay rama registrada</span>" : Html.Encode(Model.Form.RamaNombre)%>
                </p>
                <p>
                    <label>Clase</label>
                    <%= Html.Encode(Model.Form.ClaseNombre) == "" ? "<span>No hay clase registrada</span>" : Html.Encode(Model.Form.ClaseNombre)%>
                </p>
                <p>
                    <label>L&iacute;neas de investigaci&oacute;n</label>
                    <%= Html.Encode(Model.Form.LineasInvestigacion) == "" ? "<span>No hay líneas de investigación registradas</span>" : Html.Encode(Model.Form.LineasInvestigacion)%>
                </p>
                <p>
                    <label>Principales logros</label>
                    <%= Html.Encode(Model.Form.PrincipalesLogros) == "" ? "<span>No hay principales logros registrados</span>" : Html.Encode(Model.Form.PrincipalesLogros)%>
                </p>
                
                <p class="submit">
                    <%=Html.ActionLink<ExperienciaProfesionalController>(x => x.Index(), "Regresar") %>
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
