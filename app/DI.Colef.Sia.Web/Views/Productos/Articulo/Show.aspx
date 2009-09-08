<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true"
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<ArticuloForm>>" %>
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
            Aqu&iacute; se muestra la informaci&oacute;n detallada del art&iacute;culo como est&aacute; en el sistema.
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
                    <label>Tipo de art&iacute;culo</label>
                    <%= Html.Encode(Model.Form.TipoArticuloNombre) == "" ? "<span>No hay tipo de artículo registrado</span>" : Html.Encode(Model.Form.TipoArticuloNombre) %>
                </p>
                <p>
                    <label>Idioma</label>
                    <%= Html.Encode(Model.Form.IdiomaNombre) == "" ? "<span>No hay idioma registrado</span>" : Html.Encode(Model.Form.IdiomaNombre) %>
                </p>
                <p>
                    <label>Estado actual</label>
                    <%= Html.Encode(Model.Form.EstadoProductoNombre) == "" ? "<span>No hay estatus registrado</span>" : Html.Encode(Model.Form.EstadoProductoNombre) %>
                </p>
                <p>
                    <label>Periodo de referencia</label>
                    <%= Html.Encode(Model.Form.PeriodoReferenciaPeriodo) %>
                </p>
                <p>
                    <label>A&ntilde;o de aceptaci&oacute;n</label>
                    <%= Html.Encode(Model.Form.FechaAceptacion) == "" ? "<span>No tiene año de aceptación registrado</span>" : Html.Encode(Model.Form.FechaAceptacion) %>
                </p>
                <p>
                    <label>Proyecto de referencia</label>
                    <%= Html.Encode(Model.Form.ProyectoNombre) == "" ? "<span>No hay proyecto registrado</span>" : Html.Encode(Model.Form.ProyectoNombre) %>
                </p>
                <p>
                    <label>L&iacute;nea tem&aacute;tica</label>
                    <%= Html.Encode(Model.Form.LineaTematicaNombre) == "" ? "<span>No hay línea temática registrada</span>" : Html.Encode(Model.Form.LineaTematicaNombre) %>
                </p>
                
                <h4>Referencia bibliogr&aacute;fica</h4>
                <p>
                    <label>T&iacute;tulo del art&iacute;culo</label>
                    <%= Html.Encode(Model.Form.Titulo) %>
                </p>
                <p>
                    <label>Revista de publicaci&oacute;n</label>
                    <%= Html.Encode(Model.Form.RevistaPublicacionTitulo) == "" ? "<span>No hay revista de publicación registrada</span>" : Html.Encode(Model.Form.RevistaPublicacionTitulo) %>
                </p>
                <p>
                    <label>&Iacute;ndice 1</label>
                    <%= Html.Encode(Model.Form.Indice1Nombre) == "" ? "<span>No hay índice 1 registrado</span>" : Html.Encode(Model.Form.Indice1Nombre) %>
                </p>
                <p>
                    <label>&Iacute;ndice 2</label>
                    <%= Html.Encode(Model.Form.Indice2Nombre) == "" ? "<span>No hay índice 2 registrado</span>" : Html.Encode(Model.Form.Indice2Nombre)%>
                </p>
                <p>
                    <label>&Iacute;ndice 3</label>
                    <%= Html.Encode(Model.Form.Indice3Nombre) == "" ? "<span>No hay índice 3 registrado</span>" : Html.Encode(Model.Form.Indice3Nombre)%>
                </p>
                <p>
                    <label>Pa&iacute;s</label>
                    <%= Html.Encode(Model.Form.PaisNombre) == "" ? "<span>No hay país registrado</span>" : Html.Encode(Model.Form.PaisNombre)%>
                </p>
                <p>
                    <label>Volumen</label>
                    <%= Html.Encode(Model.Form.Volumen) == "" ? "<span>No hay volumen registrado</span>" : Html.Encode(Model.Form.Volumen)%>
                </p>
                <p>
                    <label>N&uacute;mero</label>
                    <%= Html.Encode(Model.Form.Numero) == "" ? "<span>No hay número registrado</span>" : Html.Encode(Model.Form.Numero)%>
                </p>
                <p>
                    <label>A&ntilde;o de publicaci&oacute;n</label>
                    <%= Html.Encode(Model.Form.FechaPublicacion) == "" ? "<span>No hay año de plublicación registrado</span>" : Html.Encode(Model.Form.FechaPublicacion)%>
                </p>
                <p>
                    <label>Fecha de edici&oacute;n</label>    
                    <%= Html.Encode(Model.Form.FechaEdicion) == "" ? "<span>No hay fecha de edición registrada</span>" : Html.Encode(Model.Form.FechaEdicion)%>
                </p>
                <p>
                    <label>P&aacute;gina inicial</label> 
                    <%= Html.Encode(Model.Form.PaginaInicial) == "" ? "<span>No hay página inicial registrada</span>" : Html.Encode(Model.Form.PaginaInicial)%>    
                </p>
                <p>    
                    <label>P&aacute;gina final</label>
                    <%= Html.Encode(Model.Form.PaginaFinal) == "" ? "<span>No hay página inicial registrada</span>" : Html.Encode(Model.Form.PaginaFinal)%>    
                </p>
                
                <h4>Coautores</h4>
                <div class="minilista" id="coautorinternoList">
                    <h5>Investigador Interno</h5>
                    
                    <% if (Model.Form.CoautorInternoArticulos != null && Model.Form.CoautorInternoArticulos.Length > 0) { %>
                        <% foreach(var coautorInterno in Model.Form.CoautorInternoArticulos) { %>
	                        <div class="sublista" id="coautorinterno_<%=Html.Encode(coautorInterno.InvestigadorId) %>">
	                            <h6>
	                                <%=Html.Encode(coautorInterno.NombreCoautor)%>
	                            </h6>
			                </div><!--end sublista-->
                        <% } %>
                    <% } else { %>
                        <div class="sublista" id="coautorinternoEmptyList_form">
                            <h6><span>No hay coautores internos registrados</span></h6>
		                </div><!--end elementodescripcion-->
                    <% } %>
                </div>
                
                <div class="minilista" id="coautorexternoList">
                    <h5>Investigador Externo</h5>

                    <% if (Model.Form.CoautorExternoArticulos != null && Model.Form.CoautorExternoArticulos.Length > 0) { %>
                        <% foreach(var coautorExterno in Model.Form.CoautorExternoArticulos) { %>
	                        <div class="sublista" id="coautorexterno_<%=Html.Encode(coautorExterno.InvestigadorExternoId) %>">
	                            <h6>
	                                <%=Html.Encode(coautorExterno.InvestigadorExternoNombre)%>
	                            </h6>
			                </div><!--end sublista-->
                        <% } %>
                    <% } else { %>
                        <div class="sublista" id="coautorexternoEmptyList_form">
                            <h6><span>No hay coautores externos registrados</span></h6>
		                </div><!--end elementodescripcion-->
                    <% } %>
                </div>
                
                <h4>Opcionales</h4>
                <p>
                    <label>L&iacute;nea de investigaci&oacute;n personal</label>
                    <%= Html.Encode(Model.Form.LineaInvestigacionNombre) == "" ? "<span>No línea de investigación registrada</span>" : Html.Encode(Model.Form.LineaInvestigacionNombre)%>    
                </p>
                <p>
                    <label>Tipo de actividad</label>
                    <%= Html.Encode(Model.Form.TipoActividadNombre) == "" ? "<span>No hay tipo de actividad registrada</span>" : Html.Encode(Model.Form.TipoActividadNombre)%>    
                </p>
                <p>
                    <label>Tipo de participante</label>
                    <%= Html.Encode(Model.Form.TipoParticipanteNombre) == "" ? "<span>No hay tipo de participante registrado</span>" : Html.Encode(Model.Form.TipoParticipanteNombre)%>    
                </p>
                <p>
                    <label>Participantes</label>
                    <%= Html.Encode(Model.Form.Participantes) == "" ? "<span>No hay participantes registrados</span>" : Html.Encode(Model.Form.Participantes)%>    
                </p>
                <p>
	                <label>Palabra clave 1</label>
	                <%= Html.Encode(Model.Form.PalabraClave1) == "" ? "<span>No hay palabra clave 1 registrada</span>" : Html.Encode(Model.Form.PalabraClave1)%>    
                </p>
                <p>
	                <label>Palabra clave 2</label>
	                <%= Html.Encode(Model.Form.PalabraClave2) == "" ? "<span>No hay palabra clave 2 registrada</span>" : Html.Encode(Model.Form.PalabraClave2)%>    
                </p>
                <p>
	                <label>Palabra clave 3</label>
                    <%= Html.Encode(Model.Form.PalabraClave3) == "" ? "<span>No hay palabra clave 3 registrada</span>" : Html.Encode(Model.Form.PalabraClave3)%>    
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
                    <%=Html.ActionLink<ArticuloController>(x => x.Index(), "Regresar") %>
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
