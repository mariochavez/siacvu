<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<LibroForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<div class="minilista" id="editoriallibroList">
    <h5>Editorial<span class="cvu"></span></h5>

    <% if (Model.EditorialLibros != null && Model.EditorialLibros.Length > 0){ %>
        <% for (int i = 0; i < Model.EditorialLibros.Length; i++){ %>
	        <div class="sublista" id="editoriallibro_<%=Html.Encode(Model.EditorialLibros[i].EditorialId) %>">
	            <h6>
	            	<a href="<%=Url.Action("DeleteEditorial", null, new{ id = Model.Id, editorialId = Model.EditorialLibros[i].EditorialId}) %>" class="remote delete"><img src="<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>" /></a>
	                <%=Html.Encode(Model.EditorialLibros[i].EditorialNombre)%>
	                <span>
	                    Instituci&oacute;n <%=Html.Encode(Model.EditorialLibros[i].EditorialInstitucionNombre)%>
	                    Pa&iacute;s <%=Html.Encode(Model.EditorialLibros[i].EditorialPaisNombre)%>
	                </span>
	                    <%=Html.Hidden("EditorialLibro[" + i + "].Editorial", Model.EditorialLibros[i].EditorialId)%>
	            </h6>
			</div><!--end sublista-->
        <% } %>
    <% } else { %>
        <div class="sublista" id="editoriallibroEmptyListForm">
            <h6><span>No hay editoriales registradas</span></h6>
		</div><!--end elementodescripcion-->
    <% } %>

	<div id="editoriallibroNew" class="minilistaboton">
		<p>
			<span>
		    	<%=Html.ActionLink("+ Nueva editorial", "NewEditorial", new { Id = Model.Id }, new { @class = "remote get" })%>
			</span>
		</p>
	</div><!--end minilistaboton-->

</div><!--end minilista-->
	
<div id="editoriallibroForm" class="display:hidden;"></div>