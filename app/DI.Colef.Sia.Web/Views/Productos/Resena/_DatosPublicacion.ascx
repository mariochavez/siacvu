<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ResenaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Nombre de la publicaci&oacute;n</label>
    <%=Html.TextBox("NombreProducto", Model.NombreProducto, new { @class = "input420-bold-requerido", maxlength = 200 })%>
    <%=Html.ValidationMessage("NombreProducto")%>
</p>                
<p>
    <label>Tipo de publicaci&oacute;n</label>
    <%=Html.DropDownList("TipoResena", Model.TiposResenas.CreateSelectList<CustomSelectForm>("Id", "Nombre"),
        "Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("TipoResena")%>
</p>