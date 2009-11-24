<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true"
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<ReporteForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
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
            <div id="campos">
                <h4>Datos del investigador</h4>
	            <p>
                    <label>Departamento</label>
                    <span class="valor"><%= Html.Encode(Model.Form.DepartamentoNombre)%>&nbsp;</span>
                </p>
                <p>
                    <label>Sede</label>
                    <span class="valor"><%= Html.Encode(Model.Form.SedeNombre)%>&nbsp;</span>
                </p>
                
    <!-- DATOS DEL REPORTE TECNICO-->
                <h4>Datos del reporte t&eacute;cnico</h4>
                <p>
                    <label>Nombre del reporte</label>
                    <span class="valor"><%= Html.Encode(Model.Form.Titulo) %>&nbsp;</span>
                </p>
                
                <p>
                    <label>Tipo de reporte</label>
                    <span class="valor"><%= Html.Encode(Model.Form.TipoReporteNombre)%>&nbsp;</span>
                </p>    
                
                <h4>Coautores</h4>
				<% Html.RenderPartial("_ShowCoautorInterno", new CoautorForm { CoautoresInternos = Model.Form.CoautorInternoReportes, ModelId = Model.Form.Id } ); %>
	            <% Html.RenderPartial("_ShowCoautorExterno", new CoautorForm { CoautoresExternos = Model.Form.CoautorExternoReportes, ModelId = Model.Form.Id } ); %>
	            <p>
	                <label>Total de autores</label>
	                <span id="totalcoautores" class="valor"><%=Html.Encode(Model.Form.TotalAutores) %></span>	          
	            </p>
	            
	            <p>
	                <label>Posici&oacute;n del autor</label>
                    <span class="valor"><%= Html.Encode(Model.Form.PosicionAutor) %>&nbsp;</span>
                </p>
                            
                <p>
                    <label>Estatus de la publicaci&oacute;n</label>
                    <span class="valor"><%= HumanizeHelper.EstadoProducto(Model.Form.EstadoProducto)%>&nbsp;</span>
                </p>
                <% if (Model.Form.EstadoProducto == 1){ %>
                    <p>
                        <label>Fecha de aceptaci&oacute;n</label>
                        <span class="valor"><%= Html.Encode(Model.Form.FechaAceptacion)%>&nbsp;</span>
                        <span>Formato (dd/mm/yyyy)</span>
                    </p>
                <% } if (Model.Form.EstadoProducto == 2){ %>
                    <p>
                        <label>Fecha de publicaci&oacute;n</label>
                        <span class="valor"><%= Html.Encode(Model.Form.FechaPublicacion)%>&nbsp;</span>
                        <span>Formato (dd/mm/yyyy)</span>
                    </p>
                <% } %>
                
                <% if (Model.Form.TipoReporteNombre.Contains("Cuaderno")){ %>
                    <h4>Referencia bibliogr&aacute;fica</h4>
                    <% Html.RenderPartial("_ShowCuadernoTrabajo", Model.Form); %>
                <% } if (Model.Form.TipoReporteNombre.Contains("Reporte")){%>
                    <h4>Tem&aacute;tica del reporte t&eacute;cnico</h4>
                    <p>
                        <label></label>
                        Tiene proyecto de investigaci&oacute;n de referencia?
                        <span class="valor"><%= HumanizeHelper.Boolean(Model.Form.TieneProyecto) %>&nbsp;</span>
                    </p>
                    
                    <% if (Model.Form.TieneProyecto) { %>
                        <p>
                            <label>Nombre del proyecto de investigaci&oacute;n</label>
                            <span class="valor"><%= Html.Encode(Model.Form.ProyectoNombre)%>&nbsp;</span>
                        </p>
                        
                        <% Html.RenderPartial("_ShowProyecto", Model.Form.ShowFields); %>
                        
                        <p>
	                        <label>Palabra clave 1</label>
	                        <span class="valor"><%=Html.Encode(Model.Form.ProyectoPalabraClave1)%>&nbsp;</span>
                        </p>
                        <p>
	                        <label>Palabra clave 2</label>
	                        <span class="valor"><%=Html.Encode(Model.Form.ProyectoPalabraClave2)%>&nbsp;</span>
                        </p>
                        <p>
	                        <label>Palabra clave 3</label>
                            <span class="valor"><%=Html.Encode(Model.Form.ProyectoPalabraClave3)%>&nbsp;</span>
                        </p>
                    <% } else { %>
                        <% Html.RenderPartial("_ShowInstitucion", Model.Form.ShowFields); %>
                        
                        <% Html.RenderPartial("_ShowAreaTematica", Model.Form.ShowFields); %>
                        
                        <p>
	                        <label>Palabra clave 1</label>
	                        <span class="valor"><%= Html.Encode(Model.Form.PalabraClave1)%>&nbsp;</span>
                        </p>
                        <p>
	                        <label>Palabra clave 2</label>
	                        <span class="valor"><%= Html.Encode(Model.Form.PalabraClave2)%>&nbsp;</span>
                        </p>
                        <p>
	                        <label>Palabra clave 3</label>
                            <span class="valor"><%= Html.Encode(Model.Form.PalabraClave3)%>&nbsp;</span>
                        </p>
                    <% } %>
                    <% Html.RenderPartial("_ShowReporteTecnico", Model.Form); %>
                <% } %>  
                
                <p class="submit">
                    <%=Html.ActionLink<ReporteController>(x => x.Index(), "Regresar") %>
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