<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<LibroForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<p>
    <label>Edici&oacute;n</label>
    <%=Html.DropDownList("Edicion", Model.Ediciones.CreateSelectList<EdicionForm>("Id", "Nombre"),
                "Seleccione ...")%>
    <%=Html.ValidationMessage("Edicion")%>
</p>
<p>
    <label>Reimpresi&oacute;n</label>
    <%=Html.DropDownList("Reimpresion", Model.Reimpresiones.CreateSelectList<ReimpresionForm>("Id", "Nombre"),
                "Seleccione ...")%>
    <%=Html.ValidationMessage("Reimpresion")%>
</p>
<p>
    <label>Editorial</label>
    <%=Html.TextBox("Editorial", Model.Editorial, new { @class = "input250", maxlength = 100 })%>
    <%=Html.ValidationMessage("Editorial")%>
</p>
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
    <%=Html.TextBox("Volumen", Model.Volumen, new { @class = "input100-requerido", maxlength = 100 })%>
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