<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<DictamenForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
	<label>Nombre</label>
	<%=Html.TextBox("Nombre", Model.Nombre, new { @class = "input250-requerido", maxlength = 100 })%>
	<%=Html.ValidationMessage("Nombre")%>
</p>
<p>
	<label>Tipo Dictamen</label>
	<%=Html.DropDownList("TipoDictamen", Model.TiposDictamenes.CreateSelectList<TipoDictamenForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "requerido" })%>
	<%=Html.ValidationMessage("TipoDictamen") %>
</p>
<p>
	<label>Tipo Participaci&oacute;n</label>
	<%=Html.DropDownList("TipoParticipacion", Model.TiposParticipaciones.CreateSelectList<TipoParticipacionForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "requerido" })%>
	<%=Html.ValidationMessage("TipoParticipacion") %>
</p>
<p>
	<label>Instituci&oacute;n</label>
	<%=Html.DropDownList("Institucion", Model.Instituciones.CreateSelectList<InstitucionForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "requerido" })%>
	<%=Html.ValidationMessage("Institucion") %>
</p>
<p>
	<label>Periodo Referencia</label>
	<%=Html.Encode(Model.PeriodoReferencia.Periodo)%>
    <%=Html.Hidden("PeriodoReferenciaId", Model.PeriodoReferencia.Id) %>
</p>