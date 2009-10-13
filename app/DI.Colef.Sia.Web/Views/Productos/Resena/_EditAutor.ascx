<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ResenaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<div class="minilista" id="autorresenaList">
    <h5>Autores</h5>

    <% if (Model.AutorResenas != null && Model.AutorResenas.Length > 0){ %>
        <% for (int i = 0; i < Model.AutorResenas.Length; i++){ %>
	        <div class="sublista" id="autorresena_<%=Html.Encode(Model.AutorResenas[i].InvestigadorId) %>">
	            <h6>
	            	<a href="<%=Url.Action("DeleteAutor", null, new{ id = Model.Id, autorId = Model.AutorResenas[i].InvestigadorId}) %>" class="remote delete"><img src="<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>" /></a>
	                <%=Html.Encode(Model.AutorResenas[i].InvestigadorUsuarioNombre)%>
                    <%=Html.Hidden("AutorResena[" + i + "].InvestigadorId", Model.AutorResenas[i].InvestigadorId)%>
	            </h6>
			</div><!--end sublista-->
        <% } %>
    <% } else { %>
        <div class="sublista" id="autorresenaEmptyListForm">
            <h6><span>No hay autores registrados</span></h6>
		</div><!--end elementodescripcion-->
    <% } %>

	<div id="autorresenaNew" class="minilistaboton">
		<p>
			<span>
		    	<%=Html.ActionLink("+ Nuevo autor", "NewAutor", new { Id = Model.Id }, new { @class = "remote get" })%>
			</span>
		</p>
	</div><!--end minilistaboton-->

</div><!--end minilista-->
	
<div id="autorresenaForm" class="display:hidden;"></div>