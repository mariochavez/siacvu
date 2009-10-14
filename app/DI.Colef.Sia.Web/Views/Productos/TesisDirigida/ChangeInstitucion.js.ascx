<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<TesisDirigidaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<% if (Model.InstitucionId != 0){ %>
    $('#institucionpais').html('<%=Html.Encode(Model.InstitucionPaisNombre)%>&nbsp;');
<% } else { %>
    $('#institucionpais').html('&nbsp;');
<% } %>