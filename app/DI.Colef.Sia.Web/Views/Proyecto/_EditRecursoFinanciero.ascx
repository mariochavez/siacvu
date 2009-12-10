<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ProyectoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<div class="minilista" id="recursofinancieroList">
    <h5>Recurso financiero</h5>

    <% if (Model.RecursoFinancieroProyectos != null && Model.RecursoFinancieroProyectos.Length > 0){ %>
        <% for (int i = 0; i < Model.RecursoFinancieroProyectos.Length; i++){ %>
	        <div class="sublista" id="recursofinanciero_<%=Html.Encode(Model.RecursoFinancieroProyectos[i].InstitucionId) %>">
	            <h6>
	                <a href="<%=Url.Action("DeleteRecursoFinanciero", null, new{id = Model.Id, institucionId = Model.RecursoFinancieroProyectos[i].InstitucionId, monto = Model.RecursoFinancieroProyectos[i].Monto, tipoMoneda = Model.RecursoFinancieroProyectos[i].MonedaId}) %>" class="remote delete"><img src="<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>" /></a>
	                <%=Html.Encode(Model.RecursoFinancieroProyectos[i].InstitucionNombre)%>
	                <%=Html.Hidden("RecursoFinanciero[" + i + "].InstitucionId", Model.RecursoFinancieroProyectos[i].InstitucionId)%>
	                <span>
	                    Monto <%=Html.Encode(Model.RecursoFinancieroProyectos[i].Monto)%>
	                    <%=Html.Hidden("RecursoFinanciero[" + i + "].Monto", Model.RecursoFinancieroProyectos[i].Monto)%>    
	                    Moneda <%=Html.Encode(Model.RecursoFinancieroProyectos[i].MonedaNombre)%>
	                    <%=Html.Hidden("RecursoFinanciero[" + i + "].Moneda", Model.RecursoFinancieroProyectos[i].MonedaId)%>
	                </span>
	            </h6>
			</div><!--end sublista-->
        <% } %>
    <% } else { %>
        <div class="sublista" id="recursofinancieroEmptyListForm">
            <h6><span>No hay recursos financieros registrados</span></h6>
		</div><!--end elementodescripcion-->
    <% } %>

	<div id="recursofinancieroNew" class="minilistaboton">
		<p>
			<span>
		    	<%=Html.ActionLink("+ Nuevo recurso financiero", "NewRecursoFinanciero", new { Id = Model.Id }, new { @class = "remote get" })%>
			</span>
		</p>
	</div><!--end minilistaboton-->

</div><!--end minilista-->
	
<div id="recursofinancieroForm" class="display:hidden;"></div>