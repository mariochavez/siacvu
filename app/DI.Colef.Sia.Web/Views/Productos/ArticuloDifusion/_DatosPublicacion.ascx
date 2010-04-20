<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ArticuloDifusionForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<p>
    <label>
        T&iacute;tulo del art&iacute;culo</label>
    <%=Html.TextBox("Titulo", Model.Titulo, new { @class = "input420-bold-requerido", maxlength = 100 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("Titulo")%>
</p>