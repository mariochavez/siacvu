<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<InstitucionForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<div class="minilista" id="institucionList">
    <h5>Instituciones</h5>

    <% if (Model.Instituciones != null && Model.Instituciones.Length > 0){ %>
        <% for (int i = 0; i < Model.Instituciones.Length; i++){ %>
	        <div class="sublista" id="institucion_<%=Html.Encode(Model.Instituciones[i].InstitucionId) %>">
	            <h6>
	                <%=Html.Encode(Model.Instituciones[i].InstitucionNombre)%>
	            </h6>
			</div><!--end sublista-->
        <% } %>
    <% } else { %>
        <div class="sublista" id="institucionEmptyListForm">
            <h6><span>No hay instituciones registradas</span></h6>
		</div><!--end elementodescripcion-->
    <% } %>

</div><!--end minilista-->