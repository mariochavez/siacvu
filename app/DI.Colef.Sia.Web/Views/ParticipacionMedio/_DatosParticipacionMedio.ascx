<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ParticipacionMedioForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
	<label>Titulo:</label>

	<%=Html.TextBox("Titulo", Model.Titulo, new { @class = "input250-requerido", maxlength = 100 })%>
	<%=Html.ValidationMessage("Titulo")%>
</p>
<p>
	<label>Nombre:</label>

	<%=Html.TextBox("Nombre", Model.Nombre, new { @class = "input250", maxlength = 100 })%>
	<%=Html.ValidationMessage("Nombre")%>
</p>
<p>
	<label>Medio Impreso:</label>

	<%=Html.DropDownList("MedioImpreso", Model.MediosImpresos.CreateSelectList<MedioImpresoForm>("Id", "Nombre"),
		"Seleccione ...")%>
	<%=Html.ValidationMessage("MedioImpreso") %>
</p>
<p>
	<label>Medio Electronico:</label>

	<%=Html.DropDownList("MedioElectronico", Model.MediosElectronicos.CreateSelectList<MedioElectronicoForm>("Id", "Nombre"),
		"Seleccione ...")%>
	<%=Html.ValidationMessage("MedioElectronico") %>
</p>
<p>
	<label>Especificacion:</label>

	<%=Html.TextBox("Especificacion", Model.Especificacion, new { @class = "input250", maxlength = 100 })%>
	<%=Html.ValidationMessage("Especificacion")%>
</p>
<p>
	<label>Genero:</label>

	<%=Html.DropDownList("Genero", Model.Generos.CreateSelectList<GeneroForm>("Id", "Nombre"),
		"Seleccione ...")%>
	<%=Html.ValidationMessage("Genero") %>
</p>
<p>
	<label>Tema:</label>

	<%=Html.TextBox("Tema", Model.Tema, new { @class = "input250", maxlength = 100 })%>
	<%=Html.ValidationMessage("Tema")%>
</p>
<p>
	<label>Periodo Referencia:</label>

	<%=Html.DropDownList("PeriodoReferencia", Model.PeriodosReferencias.CreateSelectList<PeriodoReferenciaForm>("Id", "Periodo"),
		"Seleccione ...")%>
	<%=Html.ValidationMessage("PeriodoReferencia") %>
</p>
<p>
	<label>Proyecto:</label>

	<%=Html.DropDownList("Proyecto", Model.Proyectos.CreateSelectList<ProyectoForm>("Id", "Nombre"),
		"Seleccione ...")%>
	<%=Html.ValidationMessage("Proyecto") %>
</p>
<p>
	<label>Linea Tematica:</label>

	<%=Html.DropDownList("LineaTematica", Model.LineasTematicas.CreateSelectList<LineaTematicaForm>("Id", "Nombre"),
		"Seleccione ...")%>
	<%=Html.ValidationMessage("LineaTematica") %>
</p>
<p>
	<label>Ambito:</label>

	<%=Html.DropDownList("Ambito", Model.Ambitos.CreateSelectList<AmbitoForm>("Id", "Nombre"),
		"Seleccione ...")%>
	<%=Html.ValidationMessage("Ambito") %>
</p>
<p>
	<label>Fecha Difusion:</label>

	<%=Html.TextBox("FechaDifusion", Model.FechaDifusion, new { @class = "datetime input100", maxlength = 10 })%>
    <span>(Formato dd/mm/yyyy)</span>
    <%=Html.ValidationMessage("FechaDifusion")%>
</p>
<p>
	<label>Pais:</label>

	<%=Html.DropDownList("Pais", Model.Paises.CreateSelectList<PaisForm>("Id", "Nombre"),
		"Seleccione ...")%>
	<%=Html.ValidationMessage("Pais") %>
</p>
<p>
	<label>Estado Pais:</label>

	<%=Html.DropDownList("EstadoPais", Model.EstadosPaises.CreateSelectList<EstadoPaisForm>("Id", "Nombre"),
		"Seleccione ...")%>
	<%=Html.ValidationMessage("EstadoPais") %>
</p>
<p>
	<label>Ciudad:</label>

    <%=Html.TextBox("Ciudad", Model.Ciudad, new { @class = "input250", maxlength = 100 })%>
	<%=Html.ValidationMessage("Ciudad")%>
</p>