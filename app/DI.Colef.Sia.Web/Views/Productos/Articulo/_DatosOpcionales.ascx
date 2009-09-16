<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ArticuloForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<p>
    <label>L&iacute;nea de investigaci&oacute;n personal</label>
    <%=Html.DropDownList("LineaInvestigacion", Model.LineasInvestigaciones.CreateSelectList<LineaInvestigacionForm>("Id", "Nombre"),
                "Seleccione ...")%>
    <span class="cvu"></span>
</p>
<p>
    <label>Tipo de actividad</label>
    <%=Html.DropDownList("TipoActividad", Model.TiposActividades.CreateSelectList<TipoActividadForm>("Id", "Nombre"),
                "Seleccione ...")%>
    <span class="cvu"></span>
</p>
<p>
    <label>Tipo de participante</label>
    <%=Html.DropDownList("TipoParticipante", Model.TiposParticipantes.CreateSelectList<TipoParticipacionForm>("Id", "Nombre"),
                "Seleccione ...")%>
    <span class="cvu"></span>
</p>
<p>
    <label>Participantes</label>
    <%=Html.TextBox("Participantes", Model.Participantes, new { @class = "input100", maxlength = 4, size = 5 })%>
    <span class="cvu"></span>
</p>
<p>
	<label>Palabra clave 1</label>
	<%=Html.TextBox("PalabraClave1", Model.PalabraClave1, new { @class = "input250", maxlength = 50 })%>
	<span class="cvu"></span>
</p>
<p>
	<label>Palabra clave 2</label>
	<%=Html.TextBox("PalabraClave2", Model.PalabraClave2, new { @class = "input250", maxlength = 50 })%>
	<span class="cvu"></span>
</p>
<p>
	<label>Palabra clave 3</label>
    <%=Html.TextBox("PalabraClave3", Model.PalabraClave3, new { @class = "input250", maxlength = 50 })%>
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
                "Seleccione ...")%>
    <span class="cvu"></span>
</p>
<p>
    <label>Subdisciplina</label>
    <%=Html.DropDownList("Subdisciplina", Model.Subdisciplinas.CreateSelectList<SubdisciplinaForm>("Id", "Nombre"),
                "Seleccione ...")%>
    <span class="cvu"></span>
</p>