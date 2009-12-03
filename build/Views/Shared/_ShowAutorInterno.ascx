<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<AutorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<div class="minilista" id="autorinternoList">
    <h5>Investigador Interno</h5>

    <% if (Model.AutoresInternos != null && Model.AutoresInternos.Length > 0) { %>
        <% for(int i = 0; i < Model.AutoresInternos.Length; i++) { %>
	        <div class="sublista" id="autorinterno_<%=Html.Encode(Model.AutoresInternos[i].InvestigadorId) %>">
	            <h6>
	                <%=Html.Encode(Model.AutoresInternos[i].NombreAutor)%>
	            </h6>
			</div><!--end sublista-->
        <% } %>
    <% } else { %>
        <div class="sublista" id="autorinternoEmptyList_form">
            <h6><span>No hay autores internos registrados</span></h6>
		</div><!--end elementodescripcion-->
    <% } %>

</div><!--end minilista-->