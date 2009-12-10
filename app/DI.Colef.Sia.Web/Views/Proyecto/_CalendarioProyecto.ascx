<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ProyectoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<p>
    <label>Fecha inicial</label>
    <%=Html.TextBox("FechaInicial", Model.FechaInicial, new { @class = "datetime input100-requerido", maxlength = 10 })%>
    <span>(Formato dd/mm/yyyy)</span>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("FechaInicial")%>
</p>
<p>
    <label>Fecha final</label>
    <%=Html.TextBox("FechaFinal", Model.FechaFinal, new { @class = "datetime input100-requerido", maxlength = 10 })%>
    <span>(Formato dd/mm/yyyy)</span>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("FechaFinal")%>
</p>
<% if(Page.User.IsInRole("DGAA")){ %>
    <p>
        <label>Fecha de pr&oacute;rroga</label>
        <%=Html.TextBox("FechaProrroga", Model.FechaProrroga, new { @class = "datetime input100-requerido", maxlength = 10 })%>
        <span>(Formato dd/mm/yyyy)</span>
        <%=Html.ValidationMessage("FechaProrroga")%>
    </p>    
    <p>
        <label>Estatus del proyecto</label>
        <%=Html.DropDownList("EstadoProyecto", Model.EstatusProyectos.CreateSelectList<CustomSelectForm>("Id", "Nombre"),
                    "Seleccione ...", new { @class = "requerido" })%>
        <%=Html.ValidationMessage("EstadoProyecto")%>
    </p>
    <p id="EstadoTerminado">
        <label>Fecha de conclusi&oacute;n</label>
        <%=Html.TextBox("FechaConclusion", Model.FechaConclusion, new { @class = "datetime input100-requerido", maxlength = 10 })%>
        <span>(Formato dd/mm/yyyy)</span>
        <%=Html.ValidationMessage("FechaConclusion")%>
    </p>
<% } %>