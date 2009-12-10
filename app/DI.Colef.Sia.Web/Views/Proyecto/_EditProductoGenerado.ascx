<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ProyectoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<div class="minilista" id="productogeneradoList">
    <h5>Producto generado</h5>

    <% if (Model.ProductoGeneradoProyectos != null && Model.ProductoGeneradoProyectos.Length > 0){ %>
        <% for (int i = 0; i < Model.ProductoGeneradoProyectos.Length; i++){ %>
	        <div class="sublista" id="productogenerado_<%=Html.Encode(Model.ProductoGeneradoProyectos[i].Id) %>">
	            <h6>
	                <a href="<%=Url.Action("DeleteProducto", null, new{id = Model.Id, productoGeneradoId = Model.ProductoGeneradoProyectos[i].Id}) %>" class="remote delete"><img src="<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>" /></a>
	                <%=HumanizeHelper.ProductoGenerado(Model.ProductoGeneradoProyectos[i].ProductoGenerado)%>
	                <%=Html.Hidden("ProductoGenerado[" + i + "].ProductoGenerado", Model.ProductoGeneradoProyectos[i].ProductoGenerado)%>
	                <span>
	                    Fecha de entrega <%=Html.Encode(Model.ProductoGeneradoProyectos[i].FechaEntrega)%>
	                    <%=Html.Hidden("ProductoGenerado[" + i + "].FechaEntrega", Model.ProductoGeneradoProyectos[i].FechaEntrega.Replace("/","_"))%>
	                </span>
	            </h6>
			</div><!--end sublista-->
        <% } %>
    <% } else { %>
        <div class="sublista" id="productogeneradoEmptyListForm">
            <h6><span>No hay productos generados registrados</span></h6>
		</div><!--end elementodescripcion-->
    <% } %>

	<div id="productogeneradoNew" class="minilistaboton">
		<p>
			<span>
		    	<%=Html.ActionLink("+ Nuevo producto generado", "NewProducto", new { Id = Model.Id }, new { @class = "remote get" })%>
			</span>
		</p>
	</div><!--end minilistaboton-->

</div><!--end minilista-->
	
<div id="productogeneradoForm" class="display:hidden;"></div>