<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<UsuarioForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<div id="rolList" class="minilista">
	<h5>Rol</h5>
	<% foreach(var rol in Model.Roles) { %>
        <div id="rol_<%=Html.Encode(rol.Id) %>" class="sublista">
    	    <h6><%=Html.Encode(rol.Nombre)%></h6>
        </div><!--end estadolista-->
    <% } %>
    
    <div id="rol_new" class="minilistaboton">
		<p><span><%=Html.ActionLink("+ Nuevo rol", "NewRol", new { Id = Model.Id }, new { @class = "remote get" })%></span></p>
	</div><!--end minilistaboton-->	
          
</div><!--end minilista-->

<div id="rol_form" class="display:hidden;"></div>