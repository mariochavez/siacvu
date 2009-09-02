<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<MovilidadAcademicaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<div class="minilista" id="productoacademicoList">
	<h5>Producto academico</h5>
	
	<% if (Model.ProductoAcademicoMovilidadAcademicas != null && Model.ProductoAcademicoMovilidadAcademicas.Length > 0){%>
	    <% foreach (var productoAcademico in Model.ProductoAcademicoMovilidadAcademicas){ %>
            <div class="sublista" id="productoacademico_<%=Html.Encode(productoAcademico.ProductoAcademicoId)%>">
    	        <h6>
    	            <%=Html.Encode(productoAcademico.ProductoAcademicoNombre)%>
    	            <% if(Model.Id == 0) { %>
	                    <%=Html.Hidden("ProductoAcademicoMovilidadAcademica.ProductoAcademicoId_New", productoAcademico.ProductoAcademicoId)%>
	                <% } %>
	            </h6>
            </div><!--end productoDerivadoLista-->
        <% } %>
    <% } else { %>
        <div class="sublista" id="productoacademicoEmptyList_form">
            <h6><span>No hay productos acad&eacute;micos registrados</span></h6>
        </div>
    <% } %>
    
    <div id="productoacademico_new" class="minilistaboton">
		<p>
		    <span>
		        <%=Html.ActionLink("+ Nuevo producto académico", "NewProductoAcademico", new { Id = Model.Id }, new { @class = "remote get" })%>
		    </span>
		</p>
	</div><!--end minilistaboton-->	
          
</div><!--end minilista-->

<div id="productoacademico_form" class="display:hidden;"></div>