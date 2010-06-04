<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<BaseForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<div class="minilista" id="institucionList">
    <h5>Instituciones</h5>

    <% if (Model.Instituciones != null && Model.Instituciones.Length > 0){ %>
        <% for (int i = 0; i < Model.Instituciones.Length; i++){ %>
	        <div class="sublista" id="institucion_<%=Html.Encode(Model.Instituciones[i].Id) %>">
	            <h6>
	            	<a href="<%=Url.Action("DeleteInstitucion", null, new{ id = Model.Id, institucionId = Model.Instituciones[i].Id}) %>" class="remote delete"><img src="<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>" /></a>
	                <%=Html.Encode(Model.Instituciones[i].InstitucionNombre)%>
                    <% if(!Model.Instituciones[i].InstitucionExists && !string.IsNullOrEmpty(Model.Instituciones[i].InstitucionNombre)){ %>
                        <span class="field-alert-inline">Esta instituci&oacute;n no esta registrada en el cat&aacute;logo</span>
                    <% } %>
                    <%=Html.Hidden("Institucion[" + i + "].Id", Model.Instituciones[i].Id)%>
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
		    	<%=Html.ActionLink("+ Agregar institución", "NewInstitucion", new { Id = Model.Id }, new { @class = "remote get" })%>
			</span>
		</p>
	</div><!--end minilistaboton-->

</div><!--end minilista-->
	
<div id="institucionForm" class="display:hidden;"></div>