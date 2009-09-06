<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<DictamenForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
	<label>Nombre del producto dictaminado</label>
	<%=Html.TextBox("Nombre", Model.Nombre, new { @class = "input420-bold-requerido", maxlength = 100 })%>
	<%=Html.ValidationMessage("Nombre")%>
</p>
<p>
	<label>Tipo de dictamen</label>
	<%=Html.DropDownList("TipoDictamen", Model.TiposDictamenes.CreateSelectList<TipoDictamenForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "requerido" })%>
	<%=Html.ValidationMessage("TipoDictamen") %>
</p>
<p>
	<label>Tipo de participaci&oacute;n</label>
	<%=Html.DropDownList("TipoParticipacion", Model.TiposParticipaciones.CreateSelectList<TipoParticipacionForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "requerido" })%>
	<%=Html.ValidationMessage("TipoParticipacion") %>
</p>
<p>
	<label>Instituci&oacute;n solicitante</label>
	<%=Html.TextBox("InstitucionNombre", Model.InstitucionNombre,
        new { @class = "autocomplete buscar-requerido", rel = Url.Action("Search", "Institucion"), maxlength = 100 })%>
    <%=Html.Hidden("InstitucionId", Model.InstitucionId, new { rel = "#InstitucionNombre" })%>
    <%=Html.ValidationMessage("InstitucionNombre")%>
</p>
<p>
	<label>Periodo de referencia</label>
	<%=Html.Encode(Model.PeriodoReferenciaPeriodo)%>
</p>