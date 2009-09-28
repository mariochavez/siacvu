<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CapituloForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<p>
    <label>Nombre del libro</label>
    <%=Html.TextBox("NombreLibro", Model.NombreLibro, new { @class = "input420-requerido", maxlength = 100 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("NombreLibro")%>
</p>
<p>
    <label>Resumen</label>
    <%=Html.TextArea("Resumen", Model.Resumen, 3, 35, new { @class = "input420", maxlength = 500 })%>
    <span class="cvu"></span>
</p>
<p>
    <label>Editorial</label>
    <%=Html.TextBox("Editorial", Model.Editorial, new { @class = "input420-requerido", maxlength = 100 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("Editorial")%>
</p>
<p>
    <label>Volumen</label>
    <%=Html.TextBox("Volumen", Model.Volumen, new { @class = "input100", maxlength = 100 })%>
    <span class="cvu"></span>
</p>
<p>
    <label>A&ntilde;o de edici&oacute;n</label>
    <%=Html.TextBox("FechaEdicion", Model.FechaEdicion, new { @class = "input100-requerido", maxlength = 4 })%>
    <span>(Formato yyyy)</span>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("FechaEdicion")%>
</p>
<p>
    <label>Pa&iacute;s</label>
    <%=Html.DropDownList("Pais", Model.Paises.CreateSelectList<PaisForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "requerido"})%>
    <%=Html.ValidationMessage("Pais") %>
</p>
<p>
    <label>No. de p&aacute;ginas</label>
    <%=Html.TextBox("NoPaginas", Model.NoPaginas, new { @class = "input100-requerido", maxlength = 4 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("NoPaginas")%>
</p>