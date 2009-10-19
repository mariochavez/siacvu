<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ParticipacionMedioForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
	<label>T&iacute;tulo</label>
	<%=Html.TextBox("Titulo", Model.Titulo, new { @class = "input420-bold-requerido", maxlength = 100 })%>
	<span class="cvu"></span>
	<%=Html.ValidationMessage("Titulo")%>
</p>
<p>
	<label>Nombre</label>
	<%=Html.TextBox("Nombre", Model.Nombre, new { @class = "input250-requerido", maxlength = 100 })%>
	<%=Html.ValidationMessage("Nombre")%>
</p>
<p>
	<label>Medio impreso</label>
	<%=Html.DropDownList("MedioImpreso", Model.MediosImpresos.CreateSelectList<MedioImpresoForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "requerido" })%>
	<span class="cvu"></span>
	<%=Html.ValidationMessage("MedioImpreso") %>
</p>
<p id="OtroMedioImpreso">
	<label>Especificaci&oacute;n de medio impreso</label>
	<%=Html.TextBox("EspecificacionMedioImpreso", Model.EspecificacionMedioImpreso, new { @class = "input250-requerido", maxlength = 100 })%>
	<span class="cvu"></span>
	<%=Html.ValidationMessage("EspecificacionMedioImpreso")%>
</p>
<p>
	<label>Medio electr&oacute;nico</label>
	<%=Html.DropDownList("MedioElectronico", Model.MediosElectronicos.CreateSelectList<MedioElectronicoForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "requerido" })%>
	<span class="cvu"></span>
	<%=Html.ValidationMessage("MedioElectronico") %>
</p>
<p id="OtroMedioElectronico">
	<label>Especificaci&oacute;n de medio electr&oacute;nico</label>
	<%=Html.TextBox("EspecificacionMedioElectronico", Model.EspecificacionMedioElectronico, new { @class = "input250-requerido", maxlength = 100 })%>
	<span class="cvu"></span>
	<%=Html.ValidationMessage("EspecificacionMedioElectronico")%>
</p>
<p>
	<label>G&eacute;nero</label>
	<%=Html.DropDownList("Genero", Model.Generos.CreateSelectList<GeneroForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "requerido" })%>
	<span class="cvu"></span>
	<%=Html.ValidationMessage("Genero") %>
</p>
<p>
	<label>Tema</label>
	<%=Html.TextBox("Tema", Model.Tema, new { @class = "input250-requerido", maxlength = 100 })%>
	<%=Html.ValidationMessage("Tema")%>
</p>
<p>
    <label>Dirigido a</label>
	<%=Html.DropDownList("DirigidoA", Model.DirigidosA.CreateSelectList<DirigidoAForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "requerido" })%>    
	<%=Html.ValidationMessage("DirigidoA")%>
</p>
<p>
	<label>Proyecto</label>
	<%=Html.DropDownList("Proyecto", Model.Proyectos.CreateSelectList<ProyectoForm>("Id", "Nombre"),
                "Seleccione ...")%>
	<%=Html.ValidationMessage("Proyecto") %>
</p>
<p>
	<label>L&iacute;nea tem&aacute;tica</label>
    <%=Html.TextBox("LineaTematicaNombre", Model.LineaTematicaNombre,
            new { @class = "autocomplete buscar-requerido", rel = Url.Action("Search", "LineaTematica"), maxlength = 100 })%>
    <%=Html.Hidden("LineaTematicaId", Model.LineaTematicaId, new { rel = "#LineaTematicaNombre" })%>
    <%=Html.ValidationMessage("LineaTematicaNombre")%>
</p>
<p>
	<label>&Aacute;mbito</label>
	<%=Html.DropDownList("Ambito", Model.Ambitos.CreateSelectList<AmbitoForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "requerido" })%>
	<span class="cvu"></span>
	<%=Html.ValidationMessage("Ambito") %>
</p>
<p>
	<label>Fecha de difusi&oacute;n</label>
	<%=Html.TextBox("FechaDifusion", Model.FechaDifusion, new { @class = "datetime input100-requerido", maxlength = 10 })%>
    <span>(Formato dd/mm/yyyy)</span>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("FechaDifusion")%>
</p>
<p>
	<label>Pa&iacute;s</label>
	<%=Html.DropDownList("Pais", Model.Paises.CreateSelectList<PaisForm>("Id", "Nombre"),
        "Seleccione ...", new { @class = "requerido cascade", rel = Url.Action("ChangePais") })%>
	<span class="cvu"></span>
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