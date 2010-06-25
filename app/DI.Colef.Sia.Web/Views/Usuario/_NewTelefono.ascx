<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<UsuarioForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<p>
    <label>Tipo tel&eacute;fono</label>
    <%=Html.DropDownList("Telefono.TipoTelefono", Model.TipoTelefonos.CreateSelectList<CustomSelectForm>("Id", "Nombre"),
                    "Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("Telefono.TipoTelefono")%>
</p>
<p>
    <label>N&uacute;mero de tel&eacute;fono</label>
    <%=Html.TextBox("Telefono.Numero", Model.Telefono.Numero, new { @class = "input250-requerido", maxlength = 40 })%>
    <%=Html.ValidationMessage("Telefono.Numero")%>
</p>