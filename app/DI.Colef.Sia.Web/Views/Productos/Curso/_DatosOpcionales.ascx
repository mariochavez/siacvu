<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CursoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
	<label>Sector</label>
	<%=Html.DropDownList("Sector", Model.Sectores.CreateSelectList<SectorForm>("Id", "Nombre"),
		"Seleccione ...")%>
	<%=Html.ValidationMessage("Sector") %>
</p>
<p>
	<label>Organizaci&oacute;n</label>
	<%=Html.DropDownList("Organizacion", Model.Organizaciones.CreateSelectList<OrganizacionForm>("Id", "Nombre"),
		"Seleccione ...")%>
	<%=Html.ValidationMessage("Organizacion") %>
</p>
<p>
	<label>Nivel 2</label>
    <%=Html.DropDownList("Nivel2", Model.Niveles2.CreateSelectList<NivelForm>("Id", "Nombre"),
		"Seleccione ...")%>
	<%=Html.ValidationMessage("Nivel2") %>
</p>
<p>
	<label>Nivel 3</label>
    <%=Html.DropDownList("Nivel3", Model.Niveles3.CreateSelectList<NivelForm>("Id", "Nombre"),
		"Seleccione ...")%>
	<%=Html.ValidationMessage("Nivel3") %>
</p>
<p>
	<label>Nivel 4</label>
    <%=Html.DropDownList("Nivel4", Model.Niveles4.CreateSelectList<NivelForm>("Id", "Nombre"),
		"Seleccione ...")%>
	<%=Html.ValidationMessage("Nivel4") %>
</p>
<p>
	<label>Nivel 5</label>
    <%=Html.DropDownList("Nivel5", Model.Niveles5.CreateSelectList<NivelForm>("Id", "Nombre"),
		"Seleccione ...")%>
	<%=Html.ValidationMessage("Nivel5") %>
</p>
<p>
	<label>Pa&iacute;s</label>
	<%=Html.DropDownList("Pais", Model.Paises.CreateSelectList<PaisForm>("Id", "Nombre"),
		"Seleccione ...")%>
	<%=Html.ValidationMessage("Pais") %>
</p>
<p>
	<label>&Aacute;rea</label>
	<%=Html.DropDownList("Area", Model.Areas.CreateSelectList<AreaForm>("Id", "Nombre"),
		"Seleccione ...")%>
	<%=Html.ValidationMessage("Area") %>
</p>
<p>
	<label>Disciplina</label>
	<%=Html.DropDownList("Disciplina", Model.Disciplinas.CreateSelectList<DisciplinaForm>("Id", "Nombre"),
		"Seleccione ...")%>
	<%=Html.ValidationMessage("Disciplina") %>
</p>
<p>
	<label>Subdisciplina</label>
	<%=Html.DropDownList("Subdisciplina", Model.Subdisciplinas.CreateSelectList<SubdisciplinaForm>("Id", "Nombre"),
		"Seleccione ...")%>
	<%=Html.ValidationMessage("Subdisciplina") %>
</p>