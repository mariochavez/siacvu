<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ProyectoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<p>
    <label>Cuenta con convenio</label>
    <%=Html.CheckBox("ConConvenio", Model.ConConvenio)%>
    <%=Html.ValidationMessage("ConConvenio")%>
</p>
<p class="NombreConvenio">
    <label>Nombre del convenio</label>
    <%=Html.DropDownList("Convenio", Model.Convenios.CreateSelectList<ConvenioForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("Convenio")%>
</p>
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
<p>
    <label>Fecha de pr&oacute;rroga</label>
    <%=Html.TextBox("FechaProrroga", Model.FechaProrroga, new { @class = "datetime input100-requerido", maxlength = 10 })%>
    <span>(Formato dd/mm/yyyy)</span>
    <%=Html.ValidationMessage("FechaProrroga")%>
</p>
<p>
    <label>Estatus del proyecto</label>
    <%=Html.DropDownList("EstatusProyecto", Model.EstatusProyectos.CreateSelectList<EstatusProyectoForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("EstatusProyecto")%>
</p>
<p>
    <label>Fecha de conclusi&oacute;n</label>
    <%=Html.TextBox("FechaConclusion", Model.FechaConclusion, new { @class = "datetime input100-requerido", maxlength = 10 })%>
    <span>(Formato dd/mm/yyyy)</span>
    <%=Html.ValidationMessage("FechaConclusion")%>
</p>
<p>
    <label>Proyecto con recursos complementarios</label>
    <%=Html.CheckBox("ConRecursos", Model.ConRecursos)%>
    <%=Html.ValidationMessage("ConRecursos")%>
</p>