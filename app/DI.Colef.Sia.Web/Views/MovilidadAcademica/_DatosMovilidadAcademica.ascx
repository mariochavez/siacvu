<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<MovilidadAcademicaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Tipo Estancia</label>
    <%=Html.DropDownList("TipoEstancia", Model.TiposEstancias.CreateSelectList<TipoEstanciaForm>("Id", "Nombre"),
				"Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("TipoEstancia") %>
</p>
<p>
    <label>Tipo instituci&oacute;n</label>
    <%=Html.DropDownList("TipoInstitucion", Model.TiposInstituciones.CreateSelectList<TipoInstitucionForm>("Id", "Nombre"),
				"Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("TipoInstitucion") %>
</p>
<p>
    <label>Fecha inicial</label>
    <%=Html.TextBox("FechaInicial", Model.FechaInicial, new { @class="datetime input100-requerido", maxlength = 10 })%>
    <span>(Formato dd/mm/yyyy)</span>
    <%=Html.ValidationMessage("FechaInicial")%>
</p>
<p>
    <label>Fecha final</label>
    <%=Html.TextBox("FechaFinal", Model.FechaFinal, new { @class = "datetime input100-requerido", maxlength = 10 })%>
    <span>(Formato dd/mm/yyyy)</span>
    <%=Html.ValidationMessage("FechaFinal")%>
</p>
<p>
    <label>Instituci&oacute;n</label>
    <%=Html.TextBox("InstitucionNombre", Model.InstitucionNombre,
        new { @class = "autocomplete input250-requerido", rel = Url.Action("Search", "Institucion"), maxlength = 100 })%>
    <%=Html.Hidden("InstitucionId", Model.InstitucionId, new { rel = "#InstitucionNombre" })%>
</p>
<p>
    <label>L&iacute;nea Tem&aacute;tica</label>
    <%=Html.TextBox("LineaTematicaNombre", Model.LineaTematicaNombre,
        new { @class = "autocomplete input250-requerido", rel = Url.Action("Search", "LineaTematica"), maxlength = 100 })%>
    <%=Html.Hidden("LineaTematicaId", Model.LineaTematicaId, new { rel = "#LineaTematicaNombre" })%>
</p>
<p>
    <label>Convenio</label>
    <%=Html.DropDownList("Convenio", Model.Convenios.CreateSelectList<ConvenioForm>("Id", "Nombre"),
				"Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("Convenio") %>
</p>
