<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<EstanciaInstitucionExternaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Tipo de estancia</label>
    <%=Html.DropDownList("TipoEstancia", Model.TiposEstancias.CreateSelectList<TipoEstanciaForm>("Id", "Nombre"),
		"Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("TipoEstancia") %>
</p>

<% Html.RenderPartial("_ShowInstitucion", new ShowFieldsForm { InstitucionId = Model.InstitucionId, InstitucionNombre = Model.InstitucionNombre, InstitucionLabel = "Institución de destino", IsShowForm = false }); %>

<p>
    <label>Departamento de destino</label>
    <%=Html.TextBox("DepartamentoDestino", Model.DepartamentoDestino, new { @class = "input420-requerido", maxlength = 100 })%>
</p>

<% Html.RenderPartial("_Show2doNivel", new ShowFieldsForm { Nivel2Id = Model.Nivel2Id , Nivel2Nombre = Model.Nivel2Nombre, ModelId = Model.Id, IsShowForm = false}); %>

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