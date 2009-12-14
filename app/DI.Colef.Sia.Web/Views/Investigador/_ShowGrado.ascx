<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<InvestigadorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<div id="gradoList" class="minilista">
	<h5>Grado Académico</h5>
	<% foreach(var grado in Model.GradosAcademicosInvestigador) { %>
        <div id="estado_<%=Html.Encode(grado.Id) %>" class="sublista">
    	    <h6><%=Html.Encode(grado.GradoAcademicoNombre)%> <span><%=Html.Encode(grado.Fecha)%></span> <%if(!String.IsNullOrEmpty(grado.ComprobanteNombre)) { %> 
    	    Comprobante: <%=Html.ActionLink<ArchivoController>(x => x.Show(grado.ComprobanteId), grado.ComprobanteNombre, new {target="_blank"})%> <% } %></h6>
    	    <span><%=Html.Encode(grado.InstitucionNombre)%>: <%=Html.Encode(grado.Programa.Substring(0, grado.Programa.Length < 40 ? grado.Programa.Length : 40))%></span>
        </div><!--end estadolista-->
    <% } %>
             
</div><!--end minilista-->