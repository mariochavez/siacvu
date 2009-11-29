<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ExperienciaProfesionalForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Nombramiento</label>
    <%=Html.TextBox("Nombramiento", Model.Nombramiento, new { @class = "input420-bold-requerido", maxlength = 100 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("Nombramiento")%>
</p>
<p>
    <label>Entidad</label>
    <%=Html.TextBox("Entidad", Model.Entidad, new { @class = "input420-requerido", maxlength = 100 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("Entidad")%>
</p>
<p>
    <label>Fecha inicial</label>
    <%=Html.TextBox("FechaInicial", Model.FechaInicial, new { @class = "datetime input100-requerido", maxlength = 10 })%>
    <span class="cvu"></span>
    <span>(Formato dd/mm/yyyy)</span>
    <%=Html.ValidationMessage("FechaInicial")%>
</p>
<p>
    <label>Fecha final</label>
    <%=Html.TextBox("FechaFinal", Model.FechaFinal, new { @class = "datetime input100-requerido", maxlength = 10 })%>
    <span class="cvu"></span>
    <span>(Formato dd/mm/yyyy)</span>
    <%=Html.ValidationMessage("FechaFinal")%>
</p>
<p>
    <label>Pa&iacute;s</label>
    <%=Html.DropDownList("Pais", Model.Paises.CreateSelectList<PaisForm>("Id", "Nombre"),
	            "Seleccione ...", new { @class = "requerido"})%>
	<span class="cvu"></span>
    <%=Html.ValidationMessage("Pais") %>
</p>

<% Html.RenderPartial("_Show2doNivel", new ShowFieldsForm { Nivel2Id = Model.Nivel2Id , Nivel2Nombre = Model.Nivel2Nombre, ModelId = Model.Id, IsShowForm = false}); %>
<% Html.RenderPartial("_ShowSubdisciplina", new ShowFieldsForm { Areas = Model.Areas, Disciplinas = Model.Disciplinas, Subdisciplinas = Model.Subdisciplinas, IsShowForm = false }); %>
<% Html.RenderPartial("_ShowClase", new ShowFieldsForm { ClaseId = Model.ClaseId, ClaseNombre = Model.ClaseNombre, ModelId = Model.Id, IsShowForm = false}); %>

<p>
    <label>L&iacute;nea de investigaci&oacute;n 1</label>
    <%=Html.TextArea("LineaInvestigacion1", Model.LineaInvestigacion1, 3, 35, new { @class = "input420", maxlength = 100 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("LineaInvestigacion1")%>
</p>
<p>
    <label>L&iacute;nea de investigaci&oacute;n 2</label>
    <%=Html.TextArea("LineaInvestigacion2", Model.LineaInvestigacion2, 3, 35, new { @class = "input420", maxlength = 100 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("LineaInvestigacion2")%>
</p>
<p>
    <label>L&iacute;nea de investigaci&oacute;n 3</label>
    <%=Html.TextArea("LineaInvestigacion3", Model.LineaInvestigacion3, 3, 35, new { @class = "input420", maxlength = 100 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("LineaInvestigacion3")%>
</p>
<p>
    <label>Principales logros</label>
    <%=Html.TextArea("PrincipalesLogros", Model.PrincipalesLogros, 3, 35, new { @class = "input420", maxlength = 100 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("PrincipalesLogros")%>
</p>