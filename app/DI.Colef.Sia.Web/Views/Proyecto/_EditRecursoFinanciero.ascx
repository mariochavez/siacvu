<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ProyectoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<div class="minilista" id="recursofinancieroList">
    <h5>Recurso Financiero</h5>

    <% if (Model.RecursoFinancieroProyectos != null && Model.RecursoFinancieroProyectos.Length > 0){ %>
        <% foreach (var recursoFinanciero in Model.RecursoFinancieroProyectos){ %>
	        <div class="sublista" id="recursofinanciero_<%=Html.Encode(recursoFinanciero.InstitucionId) %>">
	            <h6>
	                <%=Html.Encode(recursoFinanciero.InstitucionNombre)%>
	                <span><%=Html.Encode(recursoFinanciero.MonedaNombre)%></span>
	                <span><%=Html.Encode(recursoFinanciero.Monto)%></span>
	                <span><%=Html.Encode(recursoFinanciero.Recurso)%></span>
	                <% if(Model.Id == 0) { %>
	                    <%=Html.Hidden("RecursoFinancieroProyecto.InstitucionId_New", recursoFinanciero.InstitucionId)%>
	                    <%=Html.Hidden("RecursoFinancieroProyecto.MonedaId_New", recursoFinanciero.MonedaId)%>
	                    <%=Html.Hidden("RecursoFinancieroProyecto.Monto_New", recursoFinanciero.Monto)%>
	                    <%=Html.Hidden("RecursoFinancieroProyecto.Recurso_New", recursoFinanciero.Recurso)%>
	                <% } %>
	            </h6>
			</div><!--end sublista-->
        <% } %>
    <% } else { %>
        <div class="sublista" id="recursofinancieroEmptyList_form">
            <h6><span>No hay recursos financieros registrados</span></h6>
		</div><!--end elementodescripcion-->
    <% } %>

	<div id="recursofinanciero_new" class="minilistaboton">
		<p>
			<span>
		    	<%=Html.ActionLink("+ Nuevo recurso financiero", "NewRecursoFinanciero", new { Id = Model.Id }, new { @class = "remote get" })%>
			</span>
		</p>
	</div><!--end minilistaboton-->

</div><!--end minilista-->
	
<div id="recursofinanciero_form" class="display:hidden;"></div>