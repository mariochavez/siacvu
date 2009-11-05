<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<InvestigadorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<div id="sniList" class="minilista">
	<h5>SNI</h5>
	<% foreach(var sni in Model.SNIsInvestigador) { %>
        <div id="estado_<%=Html.Encode(sni.Id) %>" class="sublista">
            <h6><a href="<%=Url.Action("DeleteSni", null, new{id = sni.Id, investigadorId = Model.Id}) %>" class="remote delete"><img src="<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>" /></a>
    	    <%=Html.Encode(sni.SNINombre)%> <span>De <%=Html.Encode(sni.Fecha) %> </span></h6>
    	    <span>Expediente <%=Html.Encode(sni.ExpedienteSNI) %></span>
        </div><!--end estadolista-->
    <% } %>
    
    <div id="sniNew" class="minilistaboton">
		<p><span><%=Html.ActionLink("+ Nuevo SNI", "NewSNI", new { Id = Model.Id }, new { @class = "remote get" })%></span></p>
	</div><!--end minilistaboton-->	
          
</div><!--end minilista-->

<div id="sniForm" class="display:hidden;"></div>