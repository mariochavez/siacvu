<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<LibroForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<% if (Model.NombreRevistaId != 0){ %>
    $('#institucion').html('<%=Html.Encode(Model.NombreRevistaInstitucionNombre)%>&nbsp;');
<% } else { %>
    $('#institucion').html('&nbsp;');
<% } %>