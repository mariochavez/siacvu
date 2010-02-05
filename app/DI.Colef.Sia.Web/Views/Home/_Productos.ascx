<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ProductoDTO[]>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Core.DataInterfaces"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>

<% if (Model == null || Model.Length == 0){ %>
	<div class="elementolista">
		<div class="elementodescripcion">
			<h5><span>No hay productos registrados en esta secci&oacute;n</span></h5>
		</div><!--end elementodescripcion-->

	</div><!--end elementolista-->
<% } else { %>
    <% foreach (var producto in Model){ %>
        <div class="elementolista" id="accion_<%=Html.Encode(producto.Id)%>_<%=Html.Encode(producto.TipoProducto)%>">
            <div class="elementodescripcion">
                <h5><span><%=Html.Encode(producto.Nombre)%></span></h5>
                <h6>
                    <%=Html.ProductoInformation(producto) %>
                    <% if(Page.User.IsInRole("DGAA")){ %>
                        <br />Realizado por <%=Html.Encode(producto.InvestigadorNombre)%>
                    <% } %>
                </h6>
            </div><!--end elementodescripcion-->

			<div class="elementobotones">
				<p>
				    <%=Html.ProductActions(producto, Page.User.IsInRole("DGAA")) %>
               	</p>
			</div><!--end elementobotones-->
        		
        </div><!--end elementolista-->
    <% } %>
<% } %>