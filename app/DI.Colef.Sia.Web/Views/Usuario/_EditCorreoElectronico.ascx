<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<UsuarioForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<div id="CorreoElectronicoList" class="minilista">
	<h5>Correo Electr&oacute;nico</h5>
	<% if (Model.CorreosElectronicos != null && Model.CorreosElectronicos.Length > 0) { %>
	    <% foreach(var correoElectronico in Model.CorreosElectronicos) { %>
            <div id="correoElectronico_<%=Html.Encode(correoElectronico.Id) %>" class="sublista">
    	        <h6>
    	            <a href="<%=Url.Action("deletetelefono", null, new{id = correoElectronico.Id, usuarioId = Model.Id}) %>" class="remote delete"><img src="<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>" /></a>
    	            <%=Html.Encode(correoElectronico.Direccion)%></h6>
            </div><!--end estadolista-->
        <% } %>
    <% } else { %>
        <div class="sublista" id="correoElectronicoEmptyListForm">
            <h6><span>Este usuario no tiene coreos electr&oacute;nicos asignados</span></h6>
		</div><!--end elementodescripcion-->
    <% } %>
    
    <div id="correoElectronicoNew" class="minilistaboton">
		<p><span><%=Html.ActionLink("+ Agregar Correo electrónico", "NewCorreoElectronico", new { Id = Model.Id }, new { @class = "remote get" })%></span></p>
	</div><!--end minilistaboton-->	
          
</div><!--end minilista-->

<div id="correoElectronicoForm" class="display:hidden;"></div>