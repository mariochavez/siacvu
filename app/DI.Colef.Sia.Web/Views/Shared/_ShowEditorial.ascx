<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<EditorialForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<div class="minilista" id="editorialList">
    <h5>Editorial(es)</h5>

    <% if (Model.Editoriales != null && Model.Editoriales.Length > 0){ %>
        <% for (int i = 0; i < Model.Editoriales.Length; i++){ %>
	        <div class="sublista" id="editorial_<%=Html.Encode(Model.Editoriales[i].EditorialId) %>">
	            <h6>
	                <%=Html.Encode(Model.Editoriales[i].EditorialNombre)%>
	            </h6>
			</div><!--end sublista-->
        <% } %>
    <% } else { %>
        <div class="sublista" id="editorialEmptyListForm">
            <h6><span>No hay editoriales registradas</span></h6>
		</div><!--end elementodescripcion-->
    <% } %>
</div><!--end minilista-->
	