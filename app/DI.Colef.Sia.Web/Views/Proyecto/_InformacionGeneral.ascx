<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ProyectoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<p>
    <label>Nombre del proyecto</label>
    <%=Html.TextBox("Nombre", Model.Nombre, new { @class="input420-bold-requerido", maxlength = 100 })%>
    <%=Html.ValidationMessage("Nombre")%>
</p>
<p>
    <label>Tipo de proyecto</label>
    <%=Html.DropDownList("TipoProyecto", Model.TiposProyectos.CreateSelectList<TipoProyectoForm>("Id", "Nombre"),
                "Seleccione ...", new {@class="requerido"})%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("TipoProyecto") %>
</p>