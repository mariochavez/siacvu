<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<UsuarioForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<div id="direccionList" class="minilista">
	<h5>Direcci&oacute;n</h5>
	<% if (Model.Direcciones != null && Model.Direcciones.Length > 0) { %>
	    <% foreach(var direccion in Model.Direcciones) { %>
            <div id="correoElectronico_<%=Html.Encode(direccion.Id) %>" class="sublista">
    	        <h6>
    	            <a href="<%=Url.Action("deletecorreoelectronico", null, new{id = direccion.Id, usuarioId = Model.Id}) %>" class="remote delete"><img src="<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>" /></a>
    	            <%=Html.Encode(direccion.LineaDireccion)%></h6>
            </div><!--end estadolista-->
        <% } %>
    <% } else { %>
        <div class="sublista" id="direccionEmptyListForm">
            <h6><span>Este usuario no tiene Direcci&oacute;n registrada</span></h6>
		</div><!--end elementodescripcion-->
    <% } %>
    
    <div id="direccionNew" class="minilistaboton">
		<p><span><%=Html.ActionLink("+ Agregar Dirección", "NewDireccion", new { Id = Model.Id }, new { @class = "remote get" })%></span></p>
	</div><!--end minilistaboton-->	
          
</div><!--end minilista-->

<div id="direccionForm" class="display:hidden;"></div>