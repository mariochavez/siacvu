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
    <label>Tipo Instituci&oacute;n</label>
    <%=Html.DropDownList("TipoInstitucion", Model.TiposInstituciones.CreateSelectList<TipoInstitucionForm>("Id", "Nombre"),
				"Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("TipoInstitucion") %>
</p>
<p>
    <label>Fecha Inicial</label>
    <%=Html.TextBox("FechaInicial", Model.FechaInicial, new { @class="datetime input100-requerido", maxlength = 10 })%>
    <span>(Formato dd/mm/yyyy)</span>
    <%=Html.ValidationMessage("FechaInicial")%>
</p>
<p>
    <label>Fecha Final</label>
    <%=Html.TextBox("FechaFinal", Model.FechaFinal, new { @class = "datetime input100-requerido", maxlength = 10 })%>
    <span>(Formato dd/mm/yyyy)</span>
    <%=Html.ValidationMessage("FechaFinal")%>
</p>
<p>
    <label>Instituci&oacute;n</label>
    <%=Html.DropDownList("Institucion", Model.Instituciones.CreateSelectList<InstitucionForm>("Id", "Nombre"),
				"Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("Institucion") %>
</p>
<p>
    <label>L&iacute;nea Tem&aacute;tica</label>
    <%=Html.DropDownList("LineaTematica", Model.LineasTematicas.CreateSelectList<LineaTematicaForm>("Id", "Nombre"),
				"Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("LineaTematica") %>
</p>
<p>
    <label>Convenio</label>
    <%=Html.DropDownList("Convenio", Model.Convenios.CreateSelectList<ConvenioForm>("Id", "Nombre"),
				"Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("Convenio") %>
</p>
