<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ArticuloForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<p>
    <label>Nombre del art&iacute;culo</label>
    <%=Html.TextBox("Titulo", Model.Titulo, new { @class = "input420-bold-requerido", maxlength = 100 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("Titulo")%>
</p>
<p>
    <label>Tipo de producto</label>
    <%=Html.DropDownList("TipoArticulo", Model.TiposArticulos.CreateSelectList<CustomSelectForm>("Id", "Nombre"),
                        "Seleccione ...", new { @class = "tipo requerido" })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("TipoArticulo") %>
</p>