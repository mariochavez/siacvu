<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<HomeForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<% if (Model.Vinculacion == null || Model.Vinculacion.Length == 0){ %>
	<div class="elementolista">
		<div class="elementodescripcion">
			<h5><span>No hay actividades de vinculaci&oacute;n y difusi&oacute;n registradas</span></h5>
		</div><!--end elementodescripcion-->

	</div><!--end elementolista-->
<% } else { %>
    <% foreach (var vinculacion in Model.Vinculacion){ %>
        <div class="elementolista" id="accion_<%=Html.Encode(vinculacion.Id) %>">
            <div class="elementodescripcion">
                <h5><span><%=Html.Encode(vinculacion.Nombre)%></span></h5>
                <h6>
                    <%=HumanizeHelper.GetNombreProducto(vinculacion.TipoProducto)%>
                    Registrado el: <%=HumanizeHelper.FormatDate(vinculacion.CreadoEl)%>
                    <% if (vinculacion.TipoDictamen != null){ %>
                        Producto dictaminado: <%=Html.Encode(vinculacion.TipoDictamen.Nombre)%>
                    <% } %>
                    <% if (vinculacion.TipoOrgano != null){ %>
                        Tipo de &oacute;rgano: <%=Html.Encode(vinculacion.TipoOrgano.Nombre)%>
                    <% } %>
                    <% if (vinculacion.TipoEvento != null){ %>
                        Tipo de evento: <%=Html.Encode(vinculacion.TipoEvento.Nombre)%>
                    <% } %>
                    <% if (vinculacion.TipoParticipacion != null){ %>
                        Tipo de participaci&oacute;n: <%=Html.Encode(vinculacion.TipoParticipacion.Nombre)%>
                    <% } %>
                </h6>
            </div><!--end elementodescripcion-->

			<div class="elementobotones">
				<p>
					<span><%=Html.CustomActionLink("Home", "Edit", "Editar", vinculacion.Id, vinculacion.TipoProducto)%></span>
                    <span><%=Html.CustomActionLink("Home", "Show", "Ver", vinculacion.Id, vinculacion.TipoProducto)%></span>
               	</p>
			</div><!--end elementobotones-->
        		
        </div><!--end elementolista-->
    <% } %>
<% } %>