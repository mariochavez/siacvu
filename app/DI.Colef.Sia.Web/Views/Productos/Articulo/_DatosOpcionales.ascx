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