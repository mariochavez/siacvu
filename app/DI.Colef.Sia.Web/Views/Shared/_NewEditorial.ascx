<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<EditorialForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Editorial</label>
    <%=Html.TextBox("Editorial.EditorialNombre", "",
            new { @class = "autocomplete buscar-requerido", url = Url.Action("Search", "Editorial"), maxlength = 100 })%>
    <span style="margin-left:165px;">(No use abreviaturas para la editorial)</span>
    <%=Html.Hidden("Editorial.EditorialId", 0, new { rel = "#Editorial_EditorialNombre" })%>
    <%=Html.ValidationMessage("Editorial.EditorialNombre")%>
</p>
<p>
    <label>Pa&iacute;s</label>
    <%=Html.DropDownList("Editorial.PaisId", Model.Paises.CreateSelectList<CatalogoForm>("Id", "Nombre"))%>
</p>