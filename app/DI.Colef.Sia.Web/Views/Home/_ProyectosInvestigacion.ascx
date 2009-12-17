<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<HomeForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<% if (Model.Proyectos == null || Model.Proyectos.Length == 0){ %>
	<div class="elementolista">
		<div class="elementodescripcion">
			<h5><span>No hay proyectos de investigaci&oacute;n registrados</span></h5>
		</div><!--end elementodescripcion-->

	</div><!--end elementolista-->
<% } else { %>
    <% foreach (var proyecto in Model.Proyectos){ %>
        <div class="elementolista" id="accion_<%=Html.Encode(proyecto.GuidNumber)%><%=Html.Encode(proyecto.Id)%><%=Html.Encode(proyecto.TipoProducto)%>">
            <div class="elementodescripcion">
                <h5><span><%=Html.Encode(proyecto.Nombre)%></span></h5>
                <h6>
                    <%=HumanizeHelper.GetNombreProducto(proyecto.TipoProducto)%>
                    Registrado el: <%=HumanizeHelper.FormatDate(proyecto.CreadoEl)%>
                    <% if (proyecto.EstatusProducto != 0){ %>
                        Estatus: <%=HumanizeHelper.EstadoProyecto(proyecto.EstatusProducto)%>
                    <% } %>
                </h6>
            </div><!--end elementodescripcion-->

			<div class="elementobotones">
				<p>
			        <% if (proyecto.Firma.Aceptacion2 != 1 && proyecto.Firma.Aceptacion1 == 0){ %>
				        <span><%=Html.CustomActionLink("Home", "Edit", "Editar", proyecto.Id, proyecto.TipoProducto)%></span>
				        <span><%=Html.CustomActionLink("Home", "Sign", "Firmar", proyecto.Id, proyecto.TipoProducto, proyecto.GuidNumber, new { @class = "remote put" })%></span>
                        <span><%=Html.CustomActionLink("Home", "Show", "Ver", proyecto.Id, proyecto.TipoProducto)%></span>
                    <% } %>
                    <%if(Page.User.IsInRole("Investigadores")){ %>
                        <% if (proyecto.Firma.Aceptacion1 == 1){ %>
                            <span><%=Html.CustomActionLink("Home", "Show", "Ver", proyecto.Id, proyecto.TipoProducto)%></span>
                        <% } %>
                    <% } %>
                    <% if(Page.User.IsInRole("DGAA")){ %>
                        <% if (proyecto.Firma.Aceptacion1 == 1){ %>
                            <span><%=Html.CustomActionLink("Home", "Edit", "Editar", proyecto.Id, proyecto.TipoProducto)%></span>
                        <% } %>                    
                    <% } %>
               	</p>
			</div><!--end elementobotones-->
        		
        </div><!--end elementolista-->
    <% } %>
<% } %>