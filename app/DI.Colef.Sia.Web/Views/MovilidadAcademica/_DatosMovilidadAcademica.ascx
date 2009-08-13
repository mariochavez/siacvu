<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<MovilidadAcademicaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Tipo Estancia:</label>
    <%=Html.DropDownList("TipoEstancia", Model.TiposEstancias.CreateSelectList<TipoEstanciaForm>("Id", "Nombre"),
				"Seleccione ...")%>
    <%=Html.ValidationMessage("TipoEstancia") %>
</p>
<p>
    <label>Tipo Institucion:</label>
    <%=Html.DropDownList("TipoInstitucion", Model.TiposInstituciones.CreateSelectList<TipoInstitucionForm>("Id", "Nombre"),
				"Seleccione ...")%>
    <%=Html.ValidationMessage("TipoInstitucion") %>
</p>
<p>
    <label>Fecha Inicial:</label>
    <%=Html.TextBox("FechaInicial", Model.FechaInicial, new { @class="datetime input100", maxlength = 10 })%>
    <span class="helper_message">(Formato dd/mm/yyyy)</span>
    <%=Html.ValidationMessage("FechaInicial")%>
</p>
<p>
    <label>Fecha Final:</label>
    <%=Html.TextBox("FechaFinal", Model.FechaFinal, new { @class = "datetime input100", maxlength = 10 })%>
    <span class="helper_message">(Formato dd/mm/yyyy)</span>
    <%=Html.ValidationMessage("FechaFinal")%>
</p>
<p>
    <label>Institucion:</label>
    <%=Html.DropDownList("Institucion", Model.Instituciones.CreateSelectList<InstitucionForm>("Id", "Nombre"),
				"Seleccione ...")%>
    <%=Html.ValidationMessage("Institucion") %>
</p>
<p>
    <label>Linea Tematica:</label>
    <%=Html.DropDownList("LineaTematica", Model.LineasTematicas.CreateSelectList<LineaTematicaForm>("Id", "Nombre"),
				"Seleccione ...")%>
    <%=Html.ValidationMessage("LineaTematica") %>
</p>
<p>
    <label>Convenio:</label>
    <%=Html.DropDownList("Convenio", Model.Convenios.CreateSelectList<ConvenioForm>("Id", "Nombre"),
				"Seleccione ...")%>
    <%=Html.ValidationMessage("Convenio") %>
</p>
