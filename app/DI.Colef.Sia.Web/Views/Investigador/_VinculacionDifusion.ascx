<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CurriculumDTO[]>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Core.DataInterfaces" %>

<% foreach (var producto in Model){ %>
<span class="valor">
    <%=Html.Encode(producto.FechaPublicacion.Year)%></span>. <span class="valor">
        <%=Html.Encode(producto.Nombre)%></span>
<% } %>