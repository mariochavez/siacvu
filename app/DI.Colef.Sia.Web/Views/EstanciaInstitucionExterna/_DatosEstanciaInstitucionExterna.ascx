<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<EstanciaInstitucionExternaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Tipo de estancia</label>
    <%=Html.DropDownList("TipoEstancia", Model.TiposEstancias.CreateSelectList<TipoEstanciaForm>("Id", "Nombre"),
		"Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("TipoEstancia") %>
</p>
<p>
    <label>Instituci&oacute;n de destino</label>
    <%=Html.TextBox("InstitucionNombre", Model.InstitucionNombre,
        new { @class = "autocomplete buscar-requerido", rel = Url.Action("Search", "Institucion"), maxlength = 100 })%>
    <%=Html.Hidden("InstitucionId", Model.InstitucionId, new { rel = "#InstitucionNombre" })%>
    <%=Html.ValidationMessage("InstitucionNombre")%>
</p>
<p>
    <label>Departamento de destino</label>
    <%=Html.TextBox("DepartamentoDestino", Model.DepartamentoDestino, new { @class = "input420-requerido", maxlength = 100 })%>
</p>
<p>
    <label>2do. Nivel</label>
    <%=Html.DropDownList("Nivel2Id", Model.Niveles2.CreateSelectList<NivelForm>("Id", "Nombre"),
		"Seleccione ...", new { @class = "requerido" })%>
	<span class="cvu"></span>
    <%=Html.ValidationMessage("Nivel2Id") %>
</p>
<p>
    <label>Fecha inicial</label>
    <%=Html.TextBox("FechaInicial", Model.FechaInicial, new { @class="datetime input100-requerido", maxlength = 10 })%>
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
    <label>Actividades acad&eacute;micas previstas</label>
    <%=Html.TextArea("Actividades", Model.Actividades, 5, 35, new { @class = "input420-requerido", maxlength = 100 })%>
    <%=Html.ValidationMessage("Actividades")%>
</p>
<p>
    <label>Principales logros</label>
    <%=Html.TextArea("Logros", Model.Logros, 5, 35, new { @class = "input420-requerido", maxlength = 100 })%>
    <%=Html.ValidationMessage("Logros")%>
</p>