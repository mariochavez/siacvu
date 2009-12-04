<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<EventoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<div class="minilista" id="institucioneventoList">
    <h5>Instituciones participantes</h5>

    <% if (Model.InstitucionEventos != null && Model.InstitucionEventos.Length > 0){ %>
        <% for (int i = 0; i < Model.InstitucionEventos.Length; i++){ %>
	        <div class="sublista" id="institucionevento_<%=Html.Encode(Model.InstitucionEventos[i].InstitucionId) %>">
	            <h6>
	            	<a href="<%=Url.Action("DeleteInstitucion", null, new{ id = Model.Id, autorId = Model.InstitucionEventos[i].InstitucionId}) %>" class="remote delete"><img src="<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>" /></a>
	                <%=Html.Encode(Model.InstitucionEventos[i].InstitucionNombre)%>
                    <%=Html.Hidden("InstitucionEvento[" + i + "].InstitucionId", Model.InstitucionEventos[i].InstitucionId)%>
	            </h6>
			</div><!--end sublista-->
        <% } %>
    <% } else { %>
        <div class="sublista" id="institucioneventoEmptyListForm">
            <h6><span>No hay instituciones registradas</span></h6>
		</div><!--end elementodescripcion-->
    <% } %>

	<div id="institucioneventoNew" class="minilistaboton">
		<p>
			<span>
		    	<%=Html.ActionLink("+ Nueva institución", "NewInstitucion", new { Id = Model.Id }, new { @class = "remote get" })%>
			</span>
		</p>
	</div><!--end minilistaboton-->

</div><!--end minilista-->
	
<div id="institucioneventoForm" class="display:hidden;"></div>