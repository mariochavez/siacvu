<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<BaseForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<div class="minilista" id="editorialList">
    <h5>Editorial(es)</h5>

    <% if (Model.Editoriales != null && Model.Editoriales.Length > 0){ %>
        <% for (int i = 0; i < Model.Editoriales.Length; i++){ %>
	        <div class="sublista" id="editorial_<%=Html.Encode(Model.Editoriales[i].Id) %>">
	            <h6>
	            	<a href="<%=Url.Action("DeleteEditorial", null, new{ id = Model.Id , editorialId = Model.Editoriales[i].Id}) %>" class="remote delete"><img src="<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>" /></a>
	                <%=Html.Encode(Model.Editoriales[i].EditorialNombre)%>, <%=Html.Encode(Model.Editoriales[i].PaisNombre ) %>
                    <%if (!Model.Editoriales[i].EditorialExists && !String.IsNullOrEmpty(Model.Editoriales[i].EditorialNombre)) { %>
                        <span class="field-alert-inline">Esta editorial no esta registrada en el cat&aacute;logo</span>
                    <% } %>
	                <%=Html.Hidden("Editorial[" + i + "].Id", Model.Editoriales[i].Id)%>
	            </h6>
			</div><!--end sublista-->
        <% } %>
    <% } else { %>
        <div class="sublista" id="editorialEmptyListForm">
            <h6><span>No hay editoriales registradas</span></h6>
		</div><!--end elementodescripcion-->
    <% } %>

	<div id="editorialNew" class="minilistaboton">
		<p>
			<span>
		    	<%=Html.ActionLink("+ Agregar editorial", "NewEditorial", new { Id = Model.Id }, new { @class = "remote get" })%>
			</span>
		</p>
	</div><!--end minilistaboton-->

</div><!--end minilista-->
	
<div id="editorialForm" class="display:hidden;"></div>