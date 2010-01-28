<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<HomeForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Core" %>

<% if (Model.Vinculacion == null || Model.Vinculacion.Length == 0){ %>
	<div class="elementolista">
		<div class="elementodescripcion">
			<h5><span>No hay actividades de vinculaci&oacute;n y difusi&oacute;n registradas</span></h5>
		</div><!--end elementodescripcion-->

	</div><!--end elementolista-->
<% } else { %>
    <% foreach (var vinculacion in Model.Vinculacion){ %>
        <div class="elementolista" id="accion_<%=Html.Encode(vinculacion.Id)%>_<%=Html.Encode(vinculacion.TipoProducto)%>">
            <div class="elementodescripcion">
                <h5><span><%=Html.Encode(vinculacion.Nombre)%></span></h5>
                <h6>
                    <%=HumanizeHelper.GetNombreProducto(vinculacion.TipoProducto)%>
                    Registrado el: <%=HumanizeHelper.FormatDate(vinculacion.CreadoEl)%>
                    <% if (vinculacion.TipoProducto == (int)TipoProductoEnum.Dictamen ){ %>
                        Producto dictaminado: <%=Html.Encode(vinculacion.TipoNombre)%>
                    <% } else if (vinculacion.TipoProducto == (int)TipoProductoEnum.OrganoExterno){ %>
                        Tipo de &oacute;rgano: <%=Html.Encode(vinculacion.TipoNombre)%>
                    <% } else if (vinculacion.TipoProducto == (int)TipoProductoEnum.Evento ){ %>
                        Tipo de evento: <%=Html.Encode(vinculacion.TipoNombre)%>
                    <% } else if (vinculacion.TipoProducto == (int)TipoProductoEnum.ParticipacionMedio ){ %>
                        Tipo de participaci&oacute;n: <%=Html.Encode(vinculacion.TipoNombre)%>
                    <% } else if(Page.User.IsInRole("DGAA")){ %>
                        Investigador: <%=Html.Encode(vinculacion.InvestigadorNombre)%>
                    <% } %>
                </h6>
            </div><!--end elementodescripcion-->

			<div class="elementobotones">
				<p>
			        <% if (vinculacion.FirmaAceptacion2 != 1 && vinculacion.FirmaAceptacion1 == 0){ %>
				        <span><%=Html.CustomActionLink("Home", "Edit", "Editar", vinculacion.Id, vinculacion.TipoProducto)%></span>
				        <span><%=Html.CustomActionLink("Home", "Sign", "Firmar", vinculacion.Id, vinculacion.TipoProducto, 1, new { @class = "remote put" })%></span>
                        <span><%=Html.CustomActionLink("Home", "Show", "Ver", vinculacion.Id, vinculacion.TipoProducto)%></span>
                    <% } %>
                    <%if(Page.User.IsInRole("Investigadores")){ %>
                        <% if (vinculacion.FirmaAceptacion1 == 1){ %>
                            <span><%=Html.CustomActionLink("Home", "Show", "Ver", vinculacion.Id, vinculacion.TipoProducto)%></span>
                        <% } %>
                    <% } %>
                    <% if(Page.User.IsInRole("DGAA")){ %>
                        <% if (vinculacion.FirmaAceptacion1 == 1){ %>
                            <span><%=Html.CustomActionLink("Home", "Edit", "Editar", vinculacion.Id, vinculacion.TipoProducto)%></span>
                        <% } %>                    
                    <% } %>
               	</p>
			</div><!--end elementobotones-->
        		
        </div><!--end elementolista-->
    <% } %>
<% } %>