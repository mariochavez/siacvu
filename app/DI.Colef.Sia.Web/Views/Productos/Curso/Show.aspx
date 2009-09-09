<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true"
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<CursoForm>>" %>
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
            Aqu&iacute; se muestra la informaci&oacute;n detallada del curso como est&aacute; en el sistema.
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
	                <label>Nombre del curso</label>
                    <%= Html.Encode(Model.Form.Nombre) %>
                </p>
                <p>
	                <label>Programa de estudio</label>
	                <%= Html.Encode(Model.Form.ProgramaEstudioNombre) == "" ? "<span>No hay programa de estudio registrado</span>" : Html.Encode(Model.Form.ProgramaEstudioNombre)%>
                </p>
                <p>
	                <label>Instituci&oacute;n</label>
	                <%= Html.Encode(Model.Form.InstitucionNombre) == "" ? "<span>No hay institución registrada</span>" : Html.Encode(Model.Form.InstitucionNombre)%>
                </p>
                <p>
	                <label>Nivel de Estudio</label>
	                <%= Html.Encode(Model.Form.NivelEstudioNombre) == "" ? "<span>No hay nivel de estudio registrado</span>" : Html.Encode(Model.Form.NivelEstudioNombre)%>
                </p>
                <p>
	                <label>N&uacute;mero de horas</label>
                    <%= Html.Encode(Model.Form.NumeroHoras) == "" ? "<span>No hay número de horas registrado</span>" : Html.Encode(Model.Form.NumeroHoras)%>
                </p>
                <p>
	                <label>Pa&iacute;s</label>
	                <%= Html.Encode(Model.Form.PaisNombre) == "" ? "<span>No hay país registrado</span>" : Html.Encode(Model.Form.PaisNombre)%>
                </p>
                <p>
	                <label>Periodo de referencia</label>
	                <%=Html.Encode(Model.Form.PeriodoReferenciaPeriodo)%>
                </p>
                <p>
                    <label>Fecha inicial</label>
                    <%= Html.Encode(Model.Form.FechaInicial) == "" ? "<span>No hay fecha inicial registrada</span>" : Html.Encode(Model.Form.FechaInicial)%>
                </p>
                <p>
                    <label>Fecha final</label>
                    <%= Html.Encode(Model.Form.FechaFinal) == "" ? "<span>No hay fecha final registrada</span>" : Html.Encode(Model.Form.FechaFinal)%>
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
                    <%=Html.ActionLink<CursoController>(x => x.Index(), "Regresar") %>
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
