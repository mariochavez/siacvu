<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<LibroForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<p>
    <label>ISBN</label>
    <%=Html.TextBox("ISBN", Model.ISBN, new { @class = "input250-requerido", maxlength = 100 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("ISBN")%>
</p>
<p>
    <label>A&ntilde;o de edici&oacute;n</label>
    <%=Html.TextBox("FechaEdicion", Model.FechaEdicion, new { @class = "input100-requerido", maxlength = 4 })%>
    <span>(Formato yyyy)</span>
    <%=Html.ValidationMessage("FechaEdicion")%>
</p>
<p>
    <label>Volumen</label>
    <%=Html.DropDownList("Volumen", Model.Volumenes.CreateSelectList<CustomSelectForm>("Id", "Nombre"),
        "Seleccione ...")%>
    <%=Html.ValidationMessage("Volumen")%>
</p>
<p>
    <label>No. de p&aacute;ginas</label>
    <%=Html.TextBox("NoPaginas", Model.NoPaginas, new { @class = "input100-requerido", maxlength = 4})%>
    <%=Html.ValidationMessage("NoPaginas")%>
</p>
<p>
    <label>Tiraje</label>
    <%=Html.TextBox("Tiraje", Model.Tiraje, new { @class = "input100", maxlength = 5 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("Tiraje")%>
</p>