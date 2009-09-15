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
            <div id="campos">
                <p>
                    <label>Tipo de cap&iacute;tulo</label>
                    <strong><%= Html.Encode(Model.Form.TipoCapituloNombre)%>&nbsp;</strong>
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
                    <label>A&ntilde;o de aceptaci&oacute;n</label>
                    <strong><%= Html.Encode(Model.Form.FechaAceptacion)%>&nbsp;</strong><span>Formato (yyyy)</span>
                </p>
                <p>
                    <label>A&ntilde;o de publicaci&oacute;n/edici&oacute;n</label>
                    <strong><%= Html.Encode(Model.Form.FechaEdicion)%>&nbsp;</strong><span>Formato (yyyy)</span>
                </p>
                <p>
                    <label>Proyecto de referencia</label>
                    <strong><%= Html.Encode(Model.Form.ProyectoNombre)%>&nbsp;</strong>
                </p>
                <p>
                    <label>L&iacute;nea tem&aacute;tica</label>
                    <strong><%= Html.Encode(Model.Form.LineaTematicaNombre)%>&nbsp;</strong>
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
                    <strong><%= Html.Encode(Model.Form.NombreCapitulo) %>&nbsp;</strong>
                </p>
                <p>
                    <label>Nombre del libro</label>
                    <strong><%= Html.Encode(Model.Form.NombreLibro)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Editorial</label>
                    <strong><%= Html.Encode(Model.Form.Editorial)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Pa&iacute;s</label>
                    <strong><%= Html.Encode(Model.Form.PaisNombre)%>&nbsp;</strong>
                </p>
                <p>
                    <label>N&uacute;mero de p&aacute;ginas</label>
                    <strong><%= Html.Encode(Model.Form.NoPaginas)%>&nbsp;</strong>
                </p>                
                
                <h4>Responsables</h4>
                <p>
                    <label>Forma de participaci&oacute;n</label>
                    <strong><%= Html.Encode(Model.Form.FormaParticipacionNombre)%>&nbsp;</strong>
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
                    <strong><%= Html.Encode(Model.Form.Volumen)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Tipo de participaci&oacute;n</label>
                    <strong><%= Html.Encode(Model.Form.TipoParticipacionNombre)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Tipo de participante</label>
                    <strong><%= Html.Encode(Model.Form.TipoParticipanteNombre)%>&nbsp;</strong>
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
                <p>
                    <label>Traductor/Co-Traductor</label>
                    <strong><%= Html.Encode(Model.Form.Traductor)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Resumen</label>
                    <strong><%= Html.Encode(Model.Form.Resumen)%>&nbsp;</strong>
                </p>
                
                <p class="submit">
                    <%=Html.ActionLink<CapituloController>(x => x.Index(), "Regresar") %>
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
