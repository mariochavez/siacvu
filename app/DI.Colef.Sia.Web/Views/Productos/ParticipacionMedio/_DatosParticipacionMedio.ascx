<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ParticipacionMedioForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
	<label>T&iacute;tulo</label>
	<%=Html.TextBox("Titulo", Model.Titulo, new { @class = "input250-requerido", maxlength = 100 })%>
	<%=Html.ValidationMessage("Titulo")%>
</p>
<p>
	<label>Nombre</label>
	<%=Html.TextBox("Nombre", Model.Nombre, new { @class = "input250-requerido", maxlength = 100 })%>
	<%=Html.ValidationMessage("Nombre")%>
</p>
<p>
	<label>Medio Impreso</label>
	<%=Html.DropDownList("MedioImpreso", Model.MediosImpresos.CreateSelectList<MedioImpresoForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "requerido" })%>
	<%=Html.ValidationMessage("MedioImpreso") %>
</p>
<p>
	<label>Medio Electr&oacute;nico</label>
	<%=Html.DropDownList("MedioElectronico", Model.MediosElectronicos.CreateSelectList<MedioElectronicoForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "requerido" })%>
	<%=Html.ValidationMessage("MedioElectronico") %>
</p>
<p>
	<label>Especificaci&oacute;n</label>
	<%=Html.TextBox("Especificacion", Model.Especificacion, new { @class = "input250-requerido", maxlength = 100 })%>
	<%=Html.ValidationMessage("Especificacion")%>
</p>
<p>
	<label>G&eacute;nero</label>
	<%=Html.DropDownList("Genero", Model.Generos.CreateSelectList<GeneroForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "requerido" })%>
	<%=Html.ValidationMessage("Genero") %>
</p>
<p>
	<label>Tema</label>
	<%=Html.TextBox("Tema", Model.Tema, new { @class = "input250-requerido", maxlength = 100 })%>
	<%=Html.ValidationMessage("Tema")%>
</p>
<p>
	<label>Periodo Referencia</label>
	<%=Html.Encode(Model.PeriodoReferencia.Periodo)%>
</p>
<p>
	<label>Proyecto</label>
	<%=Html.DropDownList("Proyecto", Model.Proyectos.CreateSelectList<ProyectoForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "requerido" })%>
	<%=Html.ValidationMessage("Proyecto") %>
</p>
<p>
	<label>L&iacute;nea Tem&aacute;tica</label>
	<%=Html.DropDownList("LineaTematica", Model.LineasTematicas.CreateSelectList<LineaTematicaForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "requerido" })%>
	<%=Html.ValidationMessage("LineaTematica") %>
</p>
<p>
	<label>&Aacute;mbito</label>
	<%=Html.DropDownList("Ambito", Model.Ambitos.CreateSelectList<AmbitoForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "requerido" })%>
	<%=Html.ValidationMessage("Ambito") %>
</p>
<p>
	<label>Fecha Difusi&oacute;n</label>
	<%=Html.TextBox("FechaDifusion", Model.FechaDifusion, new { @class = "datetime input100-requerido", maxlength = 10 })%>
    <span>(Formato dd/mm/yyyy)</span>
    <%=Html.ValidationMessage("FechaDifusion")%>
</p>
<p>
	<label>Pa&iacute;s</label>
	<%=Html.DropDownList("Pais", Model.Paises.CreateSelectList<PaisForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "requerido" })%>
	<%=Html.ValidationMessage("Pais") %>
</p>
<p>
	<label>Estado</label>
	<%=Html.DropDownList("EstadoPais", Model.EstadosPaises.CreateSelectList<EstadoPaisForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "requerido" })%>
	<%=Html.ValidationMessage("EstadoPais") %>
</p>
<p>
	<label>Ciudad</label>
    <%=Html.TextBox("Ciudad", Model.Ciudad, new { @class = "input250-requerido", maxlength = 100 })%>
	<%=Html.ValidationMessage("Ciudad")%>
</p>