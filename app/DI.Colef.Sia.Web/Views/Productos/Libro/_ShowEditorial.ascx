<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<LibroForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<div class="minilista" id="editoriallibroList">
    <h5>Editorial</h5>

    <% if (Model.EditorialLibros != null && Model.EditorialLibros.Length > 0){ %>
        <% for (int i = 0; i < Model.EditorialLibros.Length; i++){ %>
	        <div class="sublista" id="editoriallibro_<%=Html.Encode(Model.EditorialLibros[i].EditorialId) %>">
	            <h6>
	                <%=Html.Encode(Model.EditorialLibros[i].EditorialNombre)%>
	                <span>
	                    Instituci&oacute;n <%=Html.Encode(Model.EditorialLibros[i].EditorialInstitucionNombre)%>
	                    Pa&iacute;s <%=Html.Encode(Model.EditorialLibros[i].EditorialPaisNombre)%>
	                </span>
	            </h6>
			</div><!--end sublista-->
        <% } %>
    <% } else { %>
        <div class="sublista" id="editoriallibroEmptyListForm">
            <h6><span>No hay editoriales registradas</span></h6>
		</div><!--end elementodescripcion-->
    <% } %>
</div><!--end minilista-->
	