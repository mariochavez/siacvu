<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<UsuarioForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<div id="telefonoList" class="minilista">
	<h5>Telefono</h5>
	<% if (Model.Telefonos != null && Model.Telefonos.Length > 0) { %>
	    <% foreach(var telefono in Model.Telefonos) { %>
            <div id="telefono_<%=Html.Encode(telefono.Id) %>" class="sublista">
    	        <h6>
    	            <a href="<%=Url.Action("deletetelefono", null, new{id = telefono.Id, usuarioId = Model.Id}) %>" class="remote delete"><img src="<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>" /></a>
    	            <%=Html.Encode(telefono.Numero)%></h6>
            </div><!--end estadolista-->
        <% } %>
    <% } else { %>
        <div class="sublista" id="telefonoEmptyListForm">
            <h6><span>Este usuario no tiene tel&eacute;fonos asignados</span></h6>
		</div><!--end elementodescripcion-->
    <% } %>
    
    <div id="telefonoNew" class="minilistaboton">
		<p><span><%=Html.ActionLink("+ Agregar teléfono", "NewTelefono", new { Id = Model.Id }, new { @class = "remote get" })%></span></p>
	</div><!--end minilistaboton-->	
          
</div><!--end minilista-->

<div id="telefonoForm" class="display:hidden;"></div>