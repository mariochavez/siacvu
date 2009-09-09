<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true"
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<ReporteForm>>" %>
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
            Aqu&iacute; se muestra la informaci&oacute;n detallada del reporte t&eacute;cnico como est&aacute; en el sistema.
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
                    <label>Tipo de producto</label>
                    <%= Html.Encode(Model.Form.TipoReporteNombre) == "" ? "<span>No hay tipo de producto registrado</span>" : Html.Encode(Model.Form.TipoReporteNombre)%>
                </p>                
                <p>
                    <label>Estado del producto</label>
                    <%= Html.Encode(Model.Form.EstadoProductoNombre) == "" ? "<span>No hay estado del producto registrado</span>" : Html.Encode(Model.Form.EstadoProductoNombre) %>
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
                    <label>Proyecto</label>
                    <%= Html.Encode(Model.Form.ProyectoNombre) == "" ? "<span>No hay proyecto registrado</span>" : Html.Encode(Model.Form.ProyectoNombre) %>
                </p>
                <p>
                    <label>L&iacute;nea tem&aacute;tica</label>
                    <%= Html.Encode(Model.Form.LineaTematicaNombre) == "" ? "<span>No hay línea temática registrada</span>" : Html.Encode(Model.Form.LineaTematicaNombre) %>
                </p>
                <p>
                    <label>Fecha de edici&oacute;n</label>
                    <%= Html.Encode(Model.Form.FechaEdicion) == "" ? "<span>No hay fecha de edición registrada</span>" : Html.Encode(Model.Form.FechaEdicion)%>
                </p>
                <p>
                    <label>Fecha de termino</label>
                    <%= Html.Encode(Model.Form.Fecha) == "" ? "<span>No hay fecha de termino registrada</span>" : Html.Encode(Model.Form.Fecha)%>
                </p>
                
                <h4>Referencia bibliogr&aacute;fica</h4>
                <p>
                    <label>T&iacute;tulo</label>
                    <%= Html.Encode(Model.Form.Titulo) %>
                </p>
                <p>
                    <label>Instituci&oacute;n financiadora<label>
                    <%= Html.Encode(Model.Form.InstitucionNombre) == "" ? "<span>No hay institución financiadora registrada</span>" : Html.Encode(Model.Form.InstitucionNombre)%>
                </p>
                <p>
                    <label>Editorial<label>
                    <%= Html.Encode(Model.Form.Editorial) == "" ? "<span>No hay editorial registrada</span>" : Html.Encode(Model.Form.Editorial)%>
                </p>                
                <p>
                    <label>Pa&iacute;s</label>
                    <%= Html.Encode(Model.Form.PaisNombre) == "" ? "<span>No hay país registrado</span>" : Html.Encode(Model.Form.PaisNombre)%>
                </p>
                <p>
                    <label>No. de p&aacute;ginas<label>
                    <%= Html.Encode(Model.Form.NoPaginas) == "" ? "<span>No hay número de páginas registradas</span>" : Html.Encode(Model.Form.NoPaginas)%>
                </p>
                <p>
                    <label>Descripci&oacute;n del reporte<label>
                    <%= Html.Encode(Model.Form.Descripcion) == "" ? "<span>No hay descripción del reporte registrada</span>" : Html.Encode(Model.Form.Descripcion)%>
                </p>
                                
                <h4>Coautores</h4>
                <div class="minilista" id="coautorinternoList">
                    <h5>Investigador Interno</h5>
                    
                    <% if (Model.Form.CoautorInternoReportes != null && Model.Form.CoautorInternoReportes.Length > 0){ %>
                        <% foreach (var coautorInterno in Model.Form.CoautorInternoReportes){ %>
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

                    <% if (Model.Form.CoautorExternoReportes != null && Model.Form.CoautorExternoReportes.Length > 0){ %>
                        <% foreach (var coautorExterno in Model.Form.CoautorExternoReportes){ %>
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
                    <label>Objetivo<label>
                    <%= Html.Encode(Model.Form.Objetivo) == "" ? "<span>No hay objetivo registrado</span>" : Html.Encode(Model.Form.Objetivo)%>
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
                
                <p class="submit">
                    <%=Html.ActionLink<ReporteController>(x => x.Index(), "Regresar") %>
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
