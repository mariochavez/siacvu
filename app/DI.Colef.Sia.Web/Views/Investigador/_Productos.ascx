<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CurriculumDTO[]>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Core.DataInterfaces" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers" %>

<% if (Model.Length > 0){ %>

<% } %>
<% foreach (var producto in Model){ %>
    <span class="valor"><%=Html.Encode(producto.FechaPublicacion.Year)%></span>.
    <span class="valor"><%=Html.Encode(producto.Nombre)%></span>
<% } %>
