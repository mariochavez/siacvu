<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CapituloForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<p>
    <label>
        T&iacute;tulo del cap&iacute;tulo</label>
    <%=Html.TextBox("NombreCapitulo", Model.NombreCapitulo, new { @class = "input420-bold-requerido", maxlength = 100 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("NombreCapitulo")%>
</p>
<p>
    <label>Nombre del libro</label>
    <%=Html.TextBox("NombreLibro", Model.NombreLibro, new { @class = "input420", maxlength = 100 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("NombreLibro")%>
</p>
<p>
    <label>Tipo de libro</label>
    <%=Html.DropDownList("TipoLibro", Model.TiposLibro.CreateSelectList<CustomSelectForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "coautores" })%>
    <%=Html.ValidationMessage("TipoLibro")%>
</p>
<p>
    <label>Tipo de producto</label>
    <%=Html.DropDownList("TipoCapitulo", Model.TiposCapitulos.CreateSelectList<CustomSelectForm>("Id", "Nombre"),
                        "Seleccione ...", new { @class = "tipo requerido" })%>
    <%=Html.ValidationMessage("TipoCapitulo") %>
</p>