<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CurriculumDTO[]>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Core.DataInterfaces" %>

<% foreach (var producto in Model){ %>
    <span class="valor"><%=Html.Encode(producto.FechaPublicacion.Year)%></span>.
    <span class="valor"><%=Html.Encode(producto.Nombre)%></span>.
    <span class="valor"><%=Html.Encode(string.Format("{0}, {1} {2},", producto.RevistaNombre, producto.Volumen, producto.Numero)) %></span>
    <span class="valor"><%=Html.Encode(string.Format("{0}-{1}", producto.PaginaInicial, producto.PaginaFinal)) %></span>.
<% } %>
