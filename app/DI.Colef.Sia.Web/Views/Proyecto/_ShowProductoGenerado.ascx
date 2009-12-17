<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ProyectoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<div class="minilista" id="productogeneradoList">
    <h5>Productos generados</h5>

    <% if (Model.ProductoGeneradoProyectos != null && Model.ProductoGeneradoProyectos.Length > 0){ %>
        <% for (int i = 0; i < Model.ProductoGeneradoProyectos.Length; i++){ %>
	        <div class="sublista" id="productogenerado_<%=Html.Encode(Model.ProductoGeneradoProyectos[i].Id) %>">
	            <p>
                    <label>Producto generado</label>
                    <span class="valor"><%=HumanizeHelper.ProductoGenerado(Model.ProductoGeneradoProyectos[i].ProductoGenerado)%>&nbsp;</span>
                </p>
                <p>
                    <label>Fecha de entrega</label>
                    <span class="valor"><%=Html.Encode(Model.ProductoGeneradoProyectos[i].FechaEntrega)%>&nbsp;</span>
                </p>
			</div><!--end sublista-->
        <% } %>
    <% } else { %>
        <div class="sublista" id="productogeneradoEmptyListForm">
            <h6><span>No hay productos generados registrados</span></h6>
		</div><!--end elementodescripcion-->
    <% } %>
</div><!--end minilista-->