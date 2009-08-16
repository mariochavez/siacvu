<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<InvestigadorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<div id="sniList" class="minilista">
	<h5>SNI</h5>
	<% foreach(var sni in Model.SNIsInvestigador) { %>
        <div id="estado_<%=Html.Encode(sni.Id) %>" class="sublista">
    	    <h6><%=Html.Encode(sni.SNINombre)%> <span>De <%=Html.Encode(sni.FechaInicial) %> a <%=Html.Encode(sni.FechaFinal) %></span></h6>
        </div><!--end estadolista-->
    <% } %>
    
    <div id="sni_new" class="minilistaboton">
		<p><span><%=Html.ActionLink("+ Nuevo SNI", "NewSNI", new { Id = Model.Id }, new { @class = "remote get" })%></span></p>
	</div><!--end minilistaboton-->	
          
</div><!--end minilista-->

<div id="sni_form" class="display:hidden;"></div>