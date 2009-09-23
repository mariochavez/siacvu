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
            <div id="campos">
                <p>
                    <label>Tipo de publicaci&oacute;n</label>
                    <strong><%= Html.Encode(Model.Form.TipoPublicacionNombre)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Idioma</label>
                    <strong><%= Html.Encode(Model.Form.IdiomaNombre)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Estado actual</label>
                    <strong><%= Html.Encode(Model.Form.EstadoProductoNombre)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Periodo de referencia</label>
                    <strong><%= Html.Encode(Model.Form.PeriodoReferenciaPeriodo) %>&nbsp;</strong>
                </p>
                <p>
                    <label>Tiene proyecto</label>
                    <strong><%= Html.Encode(Model.Form.TieneProyecto)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Proyecto de referencia</label>
                    <strong><%= Html.Encode(Model.Form.ProyectoNombre)%>&nbsp;</strong>
                </p>
                <p>
                    <label>L&iacute;nea tem&aacute;tica</label>
                    <strong><%= Html.Encode(Model.Form.LineaTematicaNombre)%>&nbsp;</strong>
                </p>
                <p>
                    <label>A&ntilde;o de aceptaci&oacute;n</label>
                    <strong><%= Html.Encode(Model.Form.FechaAceptacion)%>&nbsp;</strong><span>Formato (yyyy)</span>
                </p>
                
                <h4>Referencia bibliogr&aacute;fica</h4>
                <p>
                    <label>Nombre del libro</label>
                    <strong><%= Html.Encode(Model.Form.Nombre) %>&nbsp;</strong>
                </p>
                <p>
                    <label>ISBN</label>
                    <strong><%= Html.Encode(Model.Form.ISBN)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Editorial</label>
                    <strong><%= Html.Encode(Model.Form.Editorial)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Edici&oacute;n</label>
                    <strong><%= Html.Encode(Model.Form.EdicionNombre)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Fecha de edici&oacute;n</label>
                    <strong><%= Html.Encode(Model.Form.FechaEdicion)%>&nbsp;</strong><span>Formato (dd/mm/yyyy)</span>
                </p>
                <p>
                    <label>Pa&iacute;s</label>
                    <strong><%= Html.Encode(Model.Form.PaisNombre)%>&nbsp;</strong>
                </p>
                <p>
                    <label>No. de p&aacute;ginas</label>
                    <strong><%= Html.Encode(Model.Form.NoPaginas)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Tiraje</label>
                    <strong><%= Html.Encode(Model.Form.Tiraje)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Volumen</label>
                    <strong><%= Html.Encode(Model.Form.Volumen)%>&nbsp;</strong>
                </p>
                <p>
                    <label>N&uacute;mero</label>
                    <strong><%= Html.Encode(Model.Form.Numero)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Fecha del evento</label>
                    <strong><%= Html.Encode(Model.Form.FechaEvento)%>&nbsp;</strong><span>Formato (dd/mm/yyyy)</span>
                </p>
                <p>
                    <label>Instituci&oacute;n</label>
                    <strong><%= Html.Encode(Model.Form.InstitucionNombre)%>&nbsp;</strong>
                </p>
                <p>    
                    <label>Revista de publicaci&oacute;n</label>
                    <strong><%= Html.Encode(Model.Form.NombreRevistaTitulo)%>&nbsp;</strong>
                </p>
                <p>    
                    <label>Nombre del evento</label>
                    <strong><%= Html.Encode(Model.Form.NombreEvento)%>&nbsp;</strong>
                </p>

                <h4>Coautores</h4>
                <p>
                    <label>Forma de participaci&oacute;n</label>
                    <strong><%= Html.Encode(Model.Form.FormaParticipacionNombre)%>&nbsp;</strong>
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
                    <strong><%= Html.Encode(Model.Form.IdentificadorLibroNombre)%>&nbsp;</strong>
                </p>
                <p>
	                <label>Palabra clave 1</label>
	                <strong><%= Html.Encode(Model.Form.PalabraClave1)%>&nbsp;</strong>
                </p>
                <p>
	                <label>Palabra clave 2</label>
	                <strong><%= Html.Encode(Model.Form.PalabraClave2)%>&nbsp;</strong>
                </p>
                <p>
	                <label>Palabra clave 3</label>
                    <strong><%= Html.Encode(Model.Form.PalabraClave3)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Traductor/Co-Traductor</label>
                    <strong><%= Html.Encode(Model.Form.CoTraductor)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Nombre del traductor</label>
                    <strong><%= Html.Encode(Model.Form.NombreTraductor)%>&nbsp;</strong>
                </p>
                <p>
                    <label>&Aacute;rea</label>
                    <strong><%= Html.Encode(Model.Form.AreaNombre)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Disciplina</label>
                    <strong><%= Html.Encode(Model.Form.DisciplinaNombre)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Subdisciplina</label>
                    <strong><%= Html.Encode(Model.Form.SubdisciplinaNombre)%>&nbsp;</strong>
                </p>
                
                
                <p class="submit">
                    <%=Html.ActionLink<LibroController>(x => x.Index(), "Regresar") %>
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
