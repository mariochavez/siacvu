<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<FirmaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>


<% using(Html.BeginForm("DgaaSign", Model.Controller, FormMethod.Post, new { id = "firmaform" })) { %>
	<h4>Validaci&oacute;n</h4>
	<%=Html.AntiForgeryToken() %>
    <%=Html.Hidden("ProductoId", Model.Id)%>
    <%=Html.Hidden("TipoProducto", Model.TipoProducto)%>
	<div class="minilistaboton">
		<p>
    		<span><%=Html.ActionLink("Validar", "DgaaValidateProduct", null, new { @class = "remoteform", rel = "#firmaform" })%></span>
    		Si el producto es v&aacute;lido presione el bot&oacute;n <strong>Validar</strong>
		</p>	
	</div>    

	<p>
		<label>Motivo de rechazo</label>
		<%=Html.TextArea("Descripcion", "",5, 35, new { @class = "input420-requerido" })%>
	</p>
	
	<div class="minilistaboton">
        <p>
        	<span><%=Html.ActionLink("Rechazar", "DgaaRejectProduct", null, new { @class = "remoteform", rel = "#firmaform" })%></span>
        	Si el producto es rechazado, indique el motivo y presione el bot&oacute;n <strong>Rechazar</strong>
    	</p>
    </div>
<% } %>