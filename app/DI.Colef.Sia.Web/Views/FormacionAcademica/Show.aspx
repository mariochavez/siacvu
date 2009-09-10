<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true"
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<FormacionAcademicaForm>>" %>
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
            Aqu&iacute; se muestra la informaci&oacute;n detallada de la formaci&oacute;n acad&eacute;mica como est&aacute; en el sistema.
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
                    <label>Nivel de estudio</label>
                    <%= Html.Encode(Model.Form.NivelEstudioNombre) == "" ? "<span>No hay nivel de estudio registrado</span>" : Html.Encode(Model.Form.NivelEstudioNombre)%>
                </p>
                <p>
                    <label>N&uacute;mero de c&eacute;dula</label>
                    <%= Html.Encode(Model.Form.NumeroCedula) == "" ? "<span>No hay número de cédula registrada</span>" : Html.Encode(Model.Form.NumeroCedula)%>
                </p>
                <p>
                    <label>T&iacute;tulo de grado</label>
                    <%= Html.Encode(Model.Form.TituloGrado) == "" ? "<span>No hay título de grado registrado</span>" : Html.Encode(Model.Form.TituloGrado)%>
                </p>
                <p>
                    <label>Fecha de obtenci&oacute;n</label>
                    <%= Html.Encode(Model.Form.FechaObtencion) == "" ? "<span>No hay fecha de obtención registrada</span>" : Html.Encode(Model.Form.FechaObtencion)%>
                </p>
                <p>
                    <label>Instituci&oacute;n</label>
                    <%= Html.Encode(Model.Form.InstitucionNombre) == "" ? "<span>No hay institución registrada</span>" : Html.Encode(Model.Form.InstitucionNombre)%>
                </p>
                <p>
                    <label>T&iacute;tulo de tesis</label>
                    <%= Html.Encode(Model.Form.TituloTesis) == "" ? "<span>No hay título de tesis registrado</span>" : Html.Encode(Model.Form.TituloTesis)%>
                </p>
                <p>
                    <label>L&iacute;nea tem&aacute;tica</label>
                    <%= Html.Encode(Model.Form.LineaTematicaNombre) == "" ? "<span>No hay línea temática registrada</span>" : Html.Encode(Model.Form.LineaTematicaNombre) %>
                </p>
                <p>
                    <label>Pa&iacute;s</label>
                    <%= Html.Encode(Model.Form.PaisNombre) == "" ? "<span>No hay país registrado</span>" : Html.Encode(Model.Form.PaisNombre)%>
                </p>
                <p>
                    <label>Estado</label>
                    <%= Html.Encode(Model.Form.EstadoPaisNombre) == "" ? "<span>No hay estado registrado</span>" : Html.Encode(Model.Form.EstadoPaisNombre)%>
                </p>
                <p>
                    <label>Ciudad</label>
                    <%= Html.Encode(Model.Form.Ciudad) == "" ? "<span>No hay ciudad registrada</span>" : Html.Encode(Model.Form.Ciudad)%>
                </p>
                <p>
                    <label>Estatus</label>
                    <%= Html.Encode(Model.Form.EstatusNombre) == "" ? "<span>No hay estatus registrado</span>" : Html.Encode(Model.Form.EstatusNombre)%>
                </p>
                <h4>Opcionales</h4>
                <p>
	                <label>Sector</label>
	                <%= Html.Encode(Model.Form.SectorNombre) == "" ? "<span>No hay sector registrado</span>" : Html.Encode(Model.Form.SectorNombre)%>    
                </p>
                <p>
	                <label>Organizaci&oacute;n</label>
	                <%= Html.Encode(Model.Form.OrganizacionNombre) == "" ? "<span>No hay organización registrada</span>" : Html.Encode(Model.Form.OrganizacionNombre)%>    
                </p>
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
                
                <p class="submit">
                    <%=Html.ActionLink<FormacionAcademicaController>(x => x.Index(), "Regresar") %>
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
