<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<InvestigadorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<div id="gradoList" class="minilista">
	<h5>Grado</h5>
	<% foreach(var grado in Model.GradosAcademicosInvestigador) { %>
        <div id="estado_<%=Html.Encode(grado.Id) %>" class="sublista">
    	    <h6><%=Html.Encode(grado.GradoAcademicoNombre)%> <span><%=Html.Encode(grado.Fecha)%>, Area: <%=Html.Encode(grado.AreaInvestigacion)%></span></h6>
    	    <span><%=Html.Encode(grado.Descripcion.Substring(0, grado.Descripcion.Length < 40 ? grado.Descripcion.Length : 40))%></span>
        </div><!--end estadolista-->
    <% } %>
    
    <div id="grado_new" class="minilistaboton">
		<p><span><%=Html.ActionLink("+ Nuevo Grado", "NewGrado", new { Id = Model.Id }, new { @class = "remote get" })%></span></p>
	</div><!--end minilistaboton-->	
          
</div><!--end minilista-->

<div id="grado_form" class="display:hidden;"></div>