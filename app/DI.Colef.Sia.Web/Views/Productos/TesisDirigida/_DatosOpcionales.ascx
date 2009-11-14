<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<TesisDirigidaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
	<label>2do. Nivel</label>
    <%=Html.DropDownList("Nivel2Id", Model.Niveles2.CreateSelectList<NivelForm>("Id", "Nombre"),
        "Seleccione ...")%>
    <span class="cvu"></span>
</p>
<p>
    <label>Subdisciplina</label>
    <%=Html.DropDownList("SubdisciplinaId", Model.Subdisciplinas.CreateSelectList<SubdisciplinaForm>("Id", "Nombre"),
        "Seleccione ...")%>
    <span class="cvu"></span>
</p>