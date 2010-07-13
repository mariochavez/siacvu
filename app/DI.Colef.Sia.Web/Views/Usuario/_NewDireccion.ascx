<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<UsuarioForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<p>
    <label>Pa&iacute;s</label>
    <%=Html.DropDownList("Direccion.Pais", Model.Paises.CreateSelectList<PaisForm>("Id", "Nombre"),
        "Seleccione ...", new { @class = "requerido cascade", rel = Url.Action("ChangePais") })%>
    <%=Html.ValidationMessage("Direccion.Pais") %>
</p>
<p>
    <label>Estado</label>
    <%=Html.DropDownList("Direccion.EstadoPais", Model.EstadosPaises.CreateSelectList<EstadoPaisForm>("Id", "Nombre"),
        "Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("Direccion.EstadoPais")%>
</p>
<p>
    <label>Ciudad</label>
    <%=Html.TextBox("Direccion.Ciudad", Model.Direccion.Ciudad, new { @class = "input420-requerido", maxlength = 100 })%>
    <%=Html.ValidationMessage("Direccion.Ciudad")%>
</p>
<p>
    <label>Direcci&oacute;n</label>
    <%=Html.TextBox("Direccion.LineaDireccion", Model.Direccion.LineaDireccion, new { @class = "input420-requerido", maxlength = 100 })%>
    <%=Html.ValidationMessage("Direccion.LineaDireccion")%>
</p>