<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true"
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<LibroForm>>" %>
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
            Aqu&iacute; se muestra la informaci&oacute;n detallada del libro como est&aacute; en el sistema.
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
                    <label>Tipo de publicaci&oacute;n</label>
                    <%= Html.Encode(Model.Form.TipoPublicacionNombre) == "" ? "<span>No hay tipo de publicación registrada</span>" : Html.Encode(Model.Form.TipoPublicacionNombre) %>
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
                    <label>Tiene proyecto</label>
                    <%= Html.Encode(Model.Form.TieneProyecto) == "" ? "<span>No tiene proyecto registrado</span>" : Html.Encode(Model.Form.TieneProyecto) %>
                </p>
                <p>
                    <label>Proyecto de referencia</label>
                    <%= Html.Encode(Model.Form.ProyectoNombre) == "" ? "<span>No hay proyecto registrado</span>" : Html.Encode(Model.Form.ProyectoNombre) %>
                </p>
                <p>
                    <label>L&iacute;nea tem&aacute;tica</label>
                    <%= Html.Encode(Model.Form.LineaTematicaNombre) == "" ? "<span>No hay línea temática registrada</span>" : Html.Encode(Model.Form.LineaTematicaNombre) %>
                </p>
                <p>
                    <label>A&ntilde;o de aceptaci&oacute;n</label>
                    <%= Html.Encode(Model.Form.FechaAceptacion) == "" ? "<span>No tiene año de aceptación registrado</span>" : Html.Encode(Model.Form.FechaAceptacion) %>
                </p>
                
                <h4>Referencia bibliogr&aacute;fica</h4>
                <p>
                    <label>Nombre del libro</label>
                    <%= Html.Encode(Model.Form.Nombre) %>
                </p>
                <p>
                    <label>ISBN</label>
                    <%= Html.Encode(Model.Form.ISBN) == "" ? "<span>No hay ISBN registrado</span>" : Html.Encode(Model.Form.ISBN) %>
                </p>
                <p>
                    <label>Editorial</label>
                    <%= Html.Encode(Model.Form.Editorial) == "" ? "<span>No hay editorial registrada</span>" : Html.Encode(Model.Form.Editorial) %>
                </p>
                <p>
                    <label>Fecha de edici&oacute;n</label>
                    <%= Html.Encode(Model.Form.FechaEdicion) == "" ? "<span>No hay fecha de edición registrada</span>" : Html.Encode(Model.Form.FechaEdicion)%>
                </p>
                <p>
                    <label>Pa&iacute;s</label>
                    <%= Html.Encode(Model.Form.PaisNombre) == "" ? "<span>No hay país registrado</span>" : Html.Encode(Model.Form.PaisNombre)%>
                </p>
                <p>
                    <label>No. de p&aacute;ginas</label>
                    <%= Html.Encode(Model.Form.NoPaginas) == "" ? "<span>No hay número de páginas registrado</span>" : Html.Encode(Model.Form.NoPaginas)%>
                </p>
                <p>
                    <label>Tiraje</label>
                    <%= Html.Encode(Model.Form.Tiraje) == "" ? "<span>No hay tiraje registrado</span>" : Html.Encode(Model.Form.Tiraje)%>
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
                    <label>Fecha del evento</label>
                    <%= Html.Encode(Model.Form.FechaEvento) == "" ? "<span>No hay fecha del evento registrado</span>" : Html.Encode(Model.Form.FechaEvento)%>
                </p>
                <p>
                    <label>Instituci&oacute;n</label>
                    <%= Html.Encode(Model.Form.InstitucionNombre) == "" ? "<span>No hay institución registrada</span>" : Html.Encode(Model.Form.InstitucionNombre)%>    
                </p>
                <p>    
                    <label>Revista de publicaci&oacute;n</label>
                    <%= Html.Encode(Model.Form.NombreRevistaTitulo) == "" ? "<span>No hay revista de publicación registrada</span>" : Html.Encode(Model.Form.NombreRevistaTitulo) %>
                </p>
                <p>    
                    <label>Nombre del evento</label>
                    <%= Html.Encode(Model.Form.NombreEvento) == "" ? "<span>No hay evento registrado</span>" : Html.Encode(Model.Form.NombreEvento) %>
                </p>

                <h4>Coautores</h4>
                <p>
                    <label>Forma de participaci&oacute;n</label>
                    <%= Html.Encode(Model.Form.FormaParticipacionNombre) == "" ? "<span>No hay forma de participación registrada</span>" : Html.Encode(Model.Form.FormaParticipacionNombre) %>
                </p>
                <div class="minilista" id="coautorinternoList">
                    <h5>Investigador Interno</h5>
                    
                    <% if (Model.Form.CoautorInternoLibros != null && Model.Form.CoautorInternoLibros.Length > 0){ %>
                        <% foreach (var coautorInterno in Model.Form.CoautorInternoLibros){ %>
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

                    <% if (Model.Form.CoautorExternoLibros != null && Model.Form.CoautorExternoLibros.Length > 0){ %>
                        <% foreach (var coautorExterno in Model.Form.CoautorExternoLibros){ %>
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
                    <label>Identificador del libro</label>
                    <%= Html.Encode(Model.Form.IdentificadorLibroNombre) == "" ? "<span>No hay identificador del libro registrado</span>" : Html.Encode(Model.Form.IdentificadorLibroNombre)%>    
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
                    <label>Traductor/Co-Traductor</label>
                    <%= Html.Encode(Model.Form.CoTraductor) == "" ? "<span>No hay cotraductor registrado</span>" : Html.Encode(Model.Form.CoTraductor)%>
                </p>
                <p>
                    <label>Nombre del traductor</label>
                    <%= Html.Encode(Model.Form.NombreTraductor) == "" ? "<span>No hay traductor registrado</span>" : Html.Encode(Model.Form.NombreTraductor)%>
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
