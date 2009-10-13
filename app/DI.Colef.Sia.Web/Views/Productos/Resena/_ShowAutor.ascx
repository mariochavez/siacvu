<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ResenaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<div class="minilista" id="autorresenaList">
    <h5>Autor</h5>

    <% if (Model.AutorResenas != null && Model.AutorResenas.Length > 0){ %>
        <% for (int i = 0; i < Model.AutorResenas.Length; i++){ %>
	        <div class="sublista" id="autorresena_<%=Html.Encode(Model.AutorResenas[i].InvestigadorId) %>">
	            <h6>
	                <%=Html.Encode(Model.AutorResenas[i].InvestigadorUsuarioNombre)%>	                
	            </h6>
			</div><!--end sublista-->
        <% } %>
    <% } else { %>
        <div class="sublista" id="autorresenaEmptyListForm">
            <h6><span>No hay autores registrados</span></h6>
		</div><!--end elementodescripcion-->
    <% } %>
</div><!--end minilista-->