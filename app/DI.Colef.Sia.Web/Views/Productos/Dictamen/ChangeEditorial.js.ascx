<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<DictamenForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<% if (Model.EditorialId != 0){ %>
    $('#institucioneditorial').html('<%=Html.Encode(Model.EditorialInstitucionNombre)%>&nbsp;');
<% } else { %>
    $('#institucioneditorial').html('&nbsp;');
<% } %>