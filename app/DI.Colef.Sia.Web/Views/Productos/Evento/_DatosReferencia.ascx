<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<EventoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Institucion organizadora</label>
    <%=Html.TextBox("InstitucionNombre", Model.InstitucionNombre,
    new { @class = "autocomplete input250-requerido", rel = Url.Action("Search", "Institucion"), maxlength = 100 })%>
    <%=Html.Hidden("InstitucionId", Model.InstitucionId, new { rel = "#InstitucionNombre" })%>
</p>
<p>
    <label>Lugar</label>
	<%=Html.TextBox("Lugar", Model.Lugar, new { @class = "input250", maxlength = 100 })%>
	<%=Html.ValidationMessage("Lugar")%>
</p>
<p>
    <label>Fecha inicial</label>
	<%=Html.TextBox("FechaInicial", Model.FechaInicial, new { @class = "datetime input100", maxlength = 10 })%>
    <span>(Formato dd/mm/yyyy)</span>
    <%=Html.ValidationMessage("FechaInicial")%>
</p>
<p>
    <label>Fecha final</label>
	<%=Html.TextBox("FechaFinal", Model.FechaFinal, new { @class = "datetime input100", maxlength = 10 })%>
    <span>(Formato dd/mm/yyyy)</span>
    <%=Html.ValidationMessage("FechaFinal")%>
 </p>
 <p>
    <label>Tipo de financiamiento</label>
	<%=Html.DropDownList("TipoFinanciamiento", Model.TiposFinanciamientos.CreateSelectList<TipoFinanciamientoForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "requerido" })%>
	<%=Html.ValidationMessage("TipoFinanciamiento") %>
</p>
<p>
    <label>L&iacute;nea tem&aacute;tica</label>
    <%=Html.TextBox("LineaTematicaNombre", Model.LineaTematicaNombre,
            new { @class = "autocomplete input250-requerido", rel = Url.Action("Search", "LineaTematica"), maxlength = 100 })%>
    <%=Html.Hidden("LineaTematicaId", Model.LineaTematicaId, new { rel = "#LineaTematicaNombre" })%>
</p>
<p>
    <label>Periodo de referencia</label>
    <%=Html.Encode(Model.PeriodoReferenciaPeriodo)%>
</p>