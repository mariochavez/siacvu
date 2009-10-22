<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CursoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
	<label>2do. nivel</label>
    <%=Html.DropDownList("Nivel2", Model.Niveles2.CreateSelectList<NivelForm>("Id", "Nombre"),
        "Seleccione ...")%>
    <span class="cvu"></span>
</p>
<p>
	<label>Pa&iacute;s</label>
	<%=Html.DropDownList("Pais", Model.Paises.CreateSelectList<PaisForm>("Id", "Nombre"),
		"Seleccione ...")%>
	<span class="cvu"></span>
</p>
<p>
	<label>Subdisciplina</label>
	<%=Html.DropDownList("Subdisciplina", Model.Subdisciplinas.CreateSelectList<SubdisciplinaForm>("Id", "Nombre"),
		"Seleccione ...")%>
	<span class="cvu"></span>
</p>