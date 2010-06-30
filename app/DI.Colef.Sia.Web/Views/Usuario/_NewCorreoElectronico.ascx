<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<UsuarioForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<p>
    <label>Tipo Correo Electr&oacute;nico</label>
    <%=Html.DropDownList("CorreoElectronico.TipoCorreo", Model.TipoContacto.CreateSelectList<CustomSelectForm>("Id", "Nombre"),
                    "Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("CorreoElectronico.TipoCorreo")%>
</p>
<p>
    <label>Direcci&oacute;n</label>
    <%=Html.TextBox("CorreoElectronico.Direccion", Model.CorreoElectronico.Direccion, new { @class = "input250-requerido", maxlength = 40 })%>
    <%=Html.ValidationMessage("CorreoElectronico.Direccion")%>
</p>