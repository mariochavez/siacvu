<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true"
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<CapituloForm>>" %>
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
            Aqu&iacute; se muestra la informaci&oacute;n detallada del cap&iacute;tulo como est&aacute; en el sistema.
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
                    <label>Tipo de cap&iacute;tulo</label>
                    <%= Html.Encode(Model.Form.TipoCapituloNombre) == "" ? "<span>No hay tipo de capítulo registrado</span>" : Html.Encode(Model.Form.TipoCapituloNombre)%>
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
                    <label>A&ntilde;o de publicaci&oacute;n/edici&oacute;n</label>
                    <%= Html.Encode(Model.Form.FechaEdicion) == "" ? "<span>No hay año de plublicación/edición registrado</span>" : Html.Encode(Model.Form.FechaEdicion)%>
                </p>
                <p>
                    <label>Proyecto de referencia</label>
                    <%= Html.Encode(Model.Form.ProyectoNombre) == "" ? "<span>No hay proyecto registrado</span>" : Html.Encode(Model.Form.ProyectoNombre) %>
                </p>
                <p>
                    <label>L&iacute;nea tem&aacute;tica</label>
                    <%= Html.Encode(Model.Form.LineaTematicaNombre) == "" ? "<span>No hay línea temática registrada</span>" : Html.Encode(Model.Form.LineaTematicaNombre) %>
                </p>
                
                <h4>Coautores</h4>
                <div class="minilista" id="coautorinternoList">
                    <h5>Investigador Interno</h5>
                    
                    <% if (Model.Form.CoautorInternoCapitulos != null && Model.Form.CoautorInternoCapitulos.Length > 0){ %>
                        <% foreach (var coautorInterno in Model.Form.CoautorInternoCapitulos){ %>
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

                    <% if (Model.Form.CoautorExternoCapitulos != null && Model.Form.CoautorExternoCapitulos.Length > 0){ %>
                        <% foreach (var coautorExterno in Model.Form.CoautorExternoCapitulos){ %>
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
                
                <h4>Referencia bibliogr&aacute;fica</h4>
                <p>
                    <label>Nombre del cap&iacute;tulo</label>
                    <%= Html.Encode(Model.Form.NombreCapitulo) %>
                </p>
                <p>
                    <label>Nombre del libro</label>
                    <%= Html.Encode(Model.Form.NombreLibro) == "" ? "<span>No hay nombre del libro registrado</span>" : Html.Encode(Model.Form.NombreLibro) %>
                </p>
                <p>
                    <label>Editorial</label>
                    <%= Html.Encode(Model.Form.Editorial) == "" ? "<span>No hay editorial registrada</span>" : Html.Encode(Model.Form.Editorial) %>
                </p>
                <p>
                    <label>Pa&iacute;s</label>
                    <%= Html.Encode(Model.Form.PaisNombre) == "" ? "<span>No hay país registrado</span>" : Html.Encode(Model.Form.PaisNombre)%>
                </p>
                <p>
                    <label>N&uacute;mero de p&aacute;ginas</label>
                    <%= Html.Encode(Model.Form.NoPaginas) == "" ? "<span>No hay número de páginas registrado</span>" : Html.Encode(Model.Form.NoPaginas)%>
                </p>                
                
                <h4>Responsables</h4>
                <p>
                    <label>Forma de participaci&oacute;n</label>
                    <%= Html.Encode(Model.Form.FormaParticipacionNombre) == "" ? "<span>No hay forma de participación registrada</span>" : Html.Encode(Model.Form.FormaParticipacionNombre)%>
                </p>                                
                <div class="minilista" id="responsableinternoList">
                    <h5>Investigador Interno</h5>

                    <% if (Model.Form.ResponsableInternoCapitulos != null && Model.Form.ResponsableInternoCapitulos.Length > 0) { %>
                        <% foreach (var responsableInterno in Model.Form.ResponsableInternoCapitulos){ %>
                            <div class="sublista" id="responsableinterno_<%=Html.Encode(responsableInterno.InvestigadorId) %>">
                                <h6>
                                    <%=Html.Encode(responsableInterno.NombreCoautor)%>
                                </h6>
		                    </div><!--end sublista-->
                        <% } %>
                    <% } else { %>
                        <div class="sublista" id="responsableinternoEmptyList_form">
                            <h6><span>No hay responsables internos registrados</span></h6>
	                    </div><!--end elementodescripcion-->
                    <% } %>
                </div>
                
                <div class="minilista" id="responsableexternoList">
                    <h5>Investigador Externo</h5>

                    <% if (Model.Form.ResponsableExternoCapitulos != null && Model.Form.ResponsableExternoCapitulos.Length > 0) { %>
                        <% foreach(var responsableExterno in Model.Form.ResponsableExternoCapitulos) { %>
	                        <div class="sublista" id="responsableexterno_<%=Html.Encode(responsableExterno.InvestigadorExternoId) %>">
	                            <h6>
	                                <%=Html.Encode(responsableExterno.InvestigadorExternoNombre)%>
	                            </h6>
			                </div><!--end sublista-->
                        <% } %>
                    <% } else { %>
                        <div class="sublista" id="responsableexternoEmptyList_form">
                            <h6><span>No hay responsables externos registrados</span></h6>
		                </div><!--end elementodescripcion-->
                    <% } %>
                </div>
                
                <h4>Opcionales</h4>
                <p>
                    <label>Volumen</label>
                    <%= Html.Encode(Model.Form.Volumen) == "" ? "<span>No hay volumen registrado</span>" : Html.Encode(Model.Form.Volumen)%>
                </p>
                <p>
                    <label>Tipo de participaci&oacute;n</label>
                    <%= Html.Encode(Model.Form.TipoParticipacionNombre) == "" ? "<span>No hay tipo de participación registrada</span>" : Html.Encode(Model.Form.TipoParticipacionNombre)%>    
                </p>
                <p>
                    <label>Tipo de participante</label>
                    <%= Html.Encode(Model.Form.TipoParticipanteNombre) == "" ? "<span>No hay tipo de participante registrado</span>" : Html.Encode(Model.Form.TipoParticipanteNombre)%>    
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
                <p>
                    <label>Traductor/Co-Traductor</label>
                    <%= Html.Encode(Model.Form.Traductor) == "" ? "<span>No hay traductor registrado</span>" : Html.Encode(Model.Form.Traductor)%> 
                </p>
                <p>
                    <label>Resumen</label>
                    <%= Html.Encode(Model.Form.Resumen) == "" ? "<span>No hay resumen registrado</span>" : Html.Encode(Model.Form.Traductor)%> 
                </p>
                
                <p class="submit">
                    <%=Html.ActionLink<CapituloController>(x => x.Index(), "Regresar") %>
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
