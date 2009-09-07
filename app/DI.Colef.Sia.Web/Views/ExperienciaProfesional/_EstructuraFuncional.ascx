<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ExperienciaProfesionalForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
	<label>Organizaci&oacute;n</label>
	<%=Html.DropDownList("Organizacion", Model.Organizaciones.CreateSelectList<OrganizacionForm>("Id", "Nombre"),
		"Seleccione ...")%>
	<span class="cvu"></span>
	<%=Html.ValidationMessage("Organizacion") %>
</p>
<p>
	<label>Nivel 2</label>
    <%=Html.DropDownList("Nivel2", Model.Niveles2.CreateSelectList<NivelForm>("Id", "Nombre"),
		"Seleccione ...")%>
	<span class="cvu"></span>
	<%=Html.ValidationMessage("Nivel2") %>
</p>
<p>
	<label>Nivel 3</label>
    <%=Html.DropDownList("Nivel3", Model.Niveles3.CreateSelectList<NivelForm>("Id", "Nombre"),
		"Seleccione ...")%>
	<span class="cvu"></span>
	<%=Html.ValidationMessage("Nivel3") %>
</p>
<p>
	<label>Nivel 4</label>
    <%=Html.DropDownList("Nivel4", Model.Niveles4.CreateSelectList<NivelForm>("Id", "Nombre"),
		"Seleccione ...")%>
	<span class="cvu"></span>
	<%=Html.ValidationMessage("Nivel4") %>
</p>
<p>
	<label>Nivel 5</label>
    <%=Html.DropDownList("Nivel5", Model.Niveles5.CreateSelectList<NivelForm>("Id", "Nombre"),
		"Seleccione ...")%>
	<span class="cvu"></span>
	<%=Html.ValidationMessage("Nivel5") %>
</p>
<p>
	<label>Nivel 6</label>
    <%=Html.DropDownList("Nivel6", Model.Niveles6.CreateSelectList<NivelForm>("Id", "Nombre"),
		"Seleccione ...")%>
	<span class="cvu"></span>
	<%=Html.ValidationMessage("Nivel6") %>
</p>