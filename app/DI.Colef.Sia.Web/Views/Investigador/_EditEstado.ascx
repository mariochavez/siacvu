<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<InvestigadorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<div id="estadoList" class="minilista">
	<h5>Estatus</h5>
	<% foreach(var estado in Model.EstadosInvestigador) { %>
        <div id="estado_<%=Html.Encode(estado.Id) %>" class="sublista">
            <h6><a href="<%=Url.Action("DeleteEstado", null, new{id = estado.Id, investigadorId = Model.Id}) %>" class="remote delete"><img src="<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>" /></a>
    	    <%=Html.Encode(estado.EstadoNombre) %> <span><%=Html.Encode(estado.FechaInicial) %></span>
    	    <%if(!String.IsNullOrEmpty(estado.ComprobanteNombre)) { %> 
    	    Comprobante: <%=Html.ActionLink<ArchivoController>(x => x.Show(estado.ComprobanteId), estado.ComprobanteNombre, new {target="_blank"})%> <% } %></h6>
        </div><!--end estadolista-->
    <% } %>
    
    <div id="estadoNew" class="minilistaboton">
		<p><span><%=Html.ActionLink("+ Nuevo estado", "NewEstado", new { Id = Model.Id }, new { @class = "remote get" })%></span></p>
	</div><!--end minilistaboton-->	
          
</div><!--end minilista-->
<div id="estadoForm" class="display:hidden;"></div>
