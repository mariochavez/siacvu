<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<UsuarioForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<div id="rolList" class="minilista">
	<h5>Rol</h5>
	<% if (Model.Roles != null && Model.Roles.Length > 0) { %>
	    <% foreach(var rol in Model.Roles) { %>
            <div id="rol_<%=Html.Encode(rol.Id) %>" class="sublista">
    	        <h6>
    	            <a href="<%=Url.Action("deleterol", null, new{id = rol.Id, usuarioId = Model.Id}) %>" class="remote delete"><img src="<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>" /></a>
    	            <%=Html.Encode(rol.Nombre)%></h6>
            </div><!--end estadolista-->
        <% } %>
    <% } else { %>
        <div class="sublista" id="rolEmptyListForm">
            <h6><span>Este usuario no tiene roles asignados</span></h6>
		</div><!--end elementodescripcion-->
    <% } %>
    
    <div id="rolNew" class="minilistaboton">
		<p><span><%=Html.ActionLink("+ Agregar rol", "NewRol", new { Id = Model.Id }, new { @class = "remote get" })%></span></p>
	</div><!--end minilistaboton-->	
          
</div><!--end minilista-->

<div id="rolForm" class="display:hidden;"></div>