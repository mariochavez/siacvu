<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true"
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<MovilidadAcademicaForm>>" %>
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
            Aqu&iacute; se muestra la informaci&oacute;n detallada de la movilidad acad&eacute;mica como est&aacute; en el sistema.
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
                    <label>Tipo de estancia</label>
                    <strong><%= Html.Encode(Model.Form.TipoEstanciaNombre)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Tipo de instituci&oacute;n</label>
                    <strong><%= Html.Encode(Model.Form.TipoInstitucionNombre)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Fecha inicial</label>
                    <strong><%= Html.Encode(Model.Form.FechaInicial)%>&nbsp;</strong><span>Formato (dd/mm/yyyy)</span>
                </p>
                <p>
                    <label>Fecha final</label>
                    <strong><%= Html.Encode(Model.Form.FechaFinal)%>&nbsp;</strong><span>Formato (dd/mm/yyyy)</span>
                </p>
                <p>
                    <label>Instituci&oacute;n</label>
                    <strong><%= Html.Encode(Model.Form.InstitucionNombre)%>&nbsp;</strong>
                </p>
                <p>
                    <label>L&iacute;nea tem&aacute;tica</label>
                    <strong><%= Html.Encode(Model.Form.LineaTematicaNombre)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Convenio</label>
                    <strong><%= Html.Encode(Model.Form.ConvenioNombre)%>&nbsp;</strong>
                </p>
                
                <div class="minilista" id="productoderivadoList">
                    <h5>Productos derivados</h5>
                    
                    <% if (Model.Form.ProductoDerivadoMovilidadAcademicas != null && Model.Form.ProductoDerivadoMovilidadAcademicas.Length > 0)
                       { %>
                        <% foreach (var productoDerivado in Model.Form.ProductoDerivadoMovilidadAcademicas)
                           { %>
	                        <div class="sublista" id="productoderivado_<%=Html.Encode(productoDerivado.ProductoDerivadoId) %>">
	                            <h6>
	                                <%=Html.Encode(productoDerivado.ProductoDerivadoNombre)%>
	                            </h6>
			                </div><!--end sublista-->
                        <% } %>
                    <% } else { %>
                        <div class="sublista" id="productoderivadoEmptyList_form">
                            <h6><span>No hay productos derivados registrados</span></h6>
		                </div><!--end elementodescripcion-->
                    <% } %>
                </div>
                
                <div class="minilista" id="productoacademicoList">
                    <h5>Productos acad&eacute;micos</h5>

                    <% if (Model.Form.ProductoAcademicoMovilidadAcademicas != null && Model.Form.ProductoAcademicoMovilidadAcademicas.Length > 0)
                       { %>
                        <% foreach (var productoAcademico in Model.Form.ProductoAcademicoMovilidadAcademicas)
                           { %>
	                        <div class="sublista" id="productoacademico_<%=Html.Encode(productoAcademico.ProductoAcademicoId) %>">
	                            <h6>
	                                <%=Html.Encode(productoAcademico.ProductoAcademicoNombre)%>
	                            </h6>
			                </div><!--end sublista-->
                        <% } %>
                    <% } else { %>
                        <div class="sublista" id="productoacademicoEmptyList_form">
                            <h6><span>No hay productos acad&eacute;micos registrados</span></h6>
		                </div><!--end elementodescripcion-->
                    <% } %>
                </div>
                
                <div class="minilista" id="proyectoList">
                    <h5>Proyectos</h5>
                    
                    <% if (Model.Form.ProyectoMovilidadAcademicas != null && Model.Form.ProyectoMovilidadAcademicas.Length > 0)
                       { %>
                        <% foreach (var proyecto in Model.Form.ProyectoMovilidadAcademicas)
                           { %>
	                        <div class="sublista" id="proyecto_<%=Html.Encode(proyecto.ProyectoId) %>">
	                            <h6>
	                                <%=Html.Encode(proyecto.ProyectoNombre)%>
	                            </h6>
			                </div><!--end sublista-->
                        <% } %>
                    <% } else { %>
                        <div class="sublista" id="proyectoEmptyList_form">
                            <h6><span>No hay proyectos registrados</span></h6>
		                </div><!--end elementodescripcion-->
                    <% } %>
                </div>
                
                <div class="minilista" id="tipoactividadList">
                    <h5>Tipos de actividad</h5>

                    <% if (Model.Form.TipoActividadMovilidadAcademicas != null && Model.Form.TipoActividadMovilidadAcademicas.Length > 0)
                       { %>
                        <% foreach (var tipoActividad in Model.Form.TipoActividadMovilidadAcademicas)
                           { %>
	                        <div class="sublista" id="tipoactividad_<%=Html.Encode(tipoActividad.TipoActividadId) %>">
	                            <h6>
	                                <%=Html.Encode(tipoActividad.TipoActividadNombre)%>
	                            </h6>
			                </div><!--end sublista-->
                        <% } %>
                    <% } else { %>
                        <div class="sublista" id="tipoactividadEmptyList_form">
                            <h6><span>No hay tipos de actividad registradas</span></h6>
		                </div><!--end elementodescripcion-->
                    <% } %>
                </div>
                
                <p class="submit">
                    <%=Html.ActionLink<MovilidadAcademicaController>(x => x.Index(), "Regresar") %>
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
