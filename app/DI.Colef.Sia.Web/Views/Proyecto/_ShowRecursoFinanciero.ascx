<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ProyectoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<div class="minilista" id="recursofinancieroList">
    <h5>Recursos financieros</h5>
    <% if (Model.RecursoFinancieroProyectos != null && Model.RecursoFinancieroProyectos.Length > 0){ %>
        <% for (int i = 0; i < Model.RecursoFinancieroProyectos.Length; i++){ %>
	        <div class="sublista" id="recursofinanciero_<%=Html.Encode(Model.RecursoFinancieroProyectos[i].Id) %>">
	            <p>
                    <label>Instituci&oacute;n financiadora</label>
                    <span class="valor"><%=Html.Encode(Model.RecursoFinancieroProyectos[i].InstitucionNombre)%>&nbsp;</span>
                </p>
                <p>
                    <label>Monto</label>
                    <span class="valor"><%=Html.Encode(Math.Round(Model.RecursoFinancieroProyectos[i].Monto, 2))%>&nbsp;</span>
                </p>
                <p>
                    <label>Moneda</label>
                    <span class="valor"><%=Html.Encode(Model.RecursoFinancieroProyectos[i].MonedaNombre)%>&nbsp;</span>
                </p>
			</div><!--end sublista-->
        <% } %>
    <% } else { %>
        <div class="sublista" id="recursofinancieroEmptyListForm">
            <h6><span>No hay recursos financieros registrados</span></h6>
		</div><!--end elementodescripcion-->
    <% } %>
</div>