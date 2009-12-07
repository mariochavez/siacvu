<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<InstitucionForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<div class="minilista" id="institucionList">
    <h5>Instituciones</h5>

    <% if (Model.Instituciones != null && Model.Instituciones.Length > 0){ %>
        <% for (int i = 0; i < Model.Instituciones.Length; i++){ %>
	        <div class="sublista" id="institucion_<%=Html.Encode(Model.Instituciones[i].InstitucionId) %>">
	            <h6>
	            	<a href="<%=Url.Action("DeleteInstitucion", null, new{ id = Model.ModelId, institucionId = Model.Instituciones[i].InstitucionId}) %>" class="remote delete"><img src="<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>" /></a>
	                <%=Html.Encode(Model.Instituciones[i].InstitucionNombre)%>
                    <%=Html.Hidden("Institucion[" + i + "].InstitucionId", Model.Instituciones[i].InstitucionId)%>
	            </h6>
			</div><!--end sublista-->
        <% } %>
    <% } else { %>
        <div class="sublista" id="institucionEmptyListForm">
            <h6><span>No hay instituciones registradas</span></h6>
		</div><!--end elementodescripcion-->
    <% } %>

	<div id="institucionNew" class="minilistaboton">
		<p>
			<span>
		    	<%=Html.ActionLink("+ Nueva institución", "NewInstitucion", new { Id = Model.ModelId }, new { @class = "remote get" })%>
			</span>
		</p>
	</div><!--end minilistaboton-->

</div><!--end minilista-->
	
<div id="institucionForm" class="display:hidden;"></div>