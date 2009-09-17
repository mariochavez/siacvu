<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CursoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
	<label>Sector</label>
	<%=Html.DropDownList("Sector", Model.Sectores.CreateSelectList<SectorForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "cascade", rel = Url.Action("ChangeSector") })%>
	<span class="cvu"></span>	
</p>
<p>
	<label>Organizaci&oacute;n</label>
	<%=Html.DropDownList("Organizacion", Model.Organizaciones.CreateSelectList<OrganizacionForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "cascade", rel = Url.Action("ChangeOrganizacion") })%>
	<span class="cvu"></span>	
</p>
<p>
	<label>Nivel 2</label>
    <%=Html.DropDownList("Nivel2", Model.Niveles2.CreateSelectList<NivelForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "cascade", rel = Url.Action("ChangeNivel") })%>
    <span class="cvu"></span>
</p>
<p>
	<label>Nivel 3</label>
    <%=Html.DropDownList("Nivel3", Model.Niveles3.CreateSelectList<NivelForm>("Id", "Nombre"),
		"Seleccione ...")%>
	<span class="cvu"></span>
</p>
<p>
	<label>Nivel 4</label>
    <%=Html.DropDownList("Nivel4", Model.Niveles4.CreateSelectList<NivelForm>("Id", "Nombre"),
		"Seleccione ...")%>
	<span class="cvu"></span>
</p>
<p>
	<label>Nivel 5</label>
    <%=Html.DropDownList("Nivel5", Model.Niveles5.CreateSelectList<NivelForm>("Id", "Nombre"),
		"Seleccione ...")%>
	<span class="cvu"></span>
</p>
<p>
    <label>&Aacute;rea</label>
    <%=Html.DropDownList("Area", Model.Areas.CreateSelectList<AreaForm>("Id", "Nombre"),
                        "Seleccione ...", new { @class = "cascade", rel = Url.Action("ChangeArea") })%>
    <span class="cvu"></span>
</p>
<p>
    <label>Disciplina</label>
    <%=Html.DropDownList("Disciplina", Model.Disciplinas.CreateSelectList<DisciplinaForm>("Id", "Nombre"),
                        "Seleccione ...", new { @class = "cascade", rel = Url.Action("ChangeDisciplina") })%>
    <span class="cvu"></span>
</p>
<p>
	<label>Subdisciplina</label>
	<%=Html.DropDownList("Subdisciplina", Model.Subdisciplinas.CreateSelectList<SubdisciplinaForm>("Id", "Nombre"),
		"Seleccione ...")%>
	<span class="cvu"></span>
</p>