<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<EventoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>

<p>
    <label>Nombre del evento</label>
    <%=Html.TextBox("Nombre", Model.Nombre, new { @class = "input420-bold-requerido", maxlength = 100 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("Nombre")%>
</p>

<% Html.RenderPartial("_DatosFinal", Model); %>

<p>
    <label>Tipo de evento</label>
    <%=Html.DropDownList("TipoEvento", Model.TiposEventos.CreateSelectList<TipoEventoForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("TipoEvento") %>
</p>

<p>
    <label>Tipo de participaci&oacute;n</label>
    <%=Html.DropDownList("TipoParticipacion", Model.TiposParticipaciones.CreateSelectList<TipoParticipacionForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "requerido" })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("TipoParticipacion")%>
</p>

<% Html.RenderPartial("_EditInstitucion", new InstitucionForm { Instituciones = Model.InstitucionEventos, ModelId = Model.Id } ); %>

<div id="NoOrganizadorColef_fields">
    <% Html.RenderPartial("_ShowPalabrasClave", new ShowFieldsForm { PalabraClave1 = Model.PalabraClave1, PalabraClave2 = Model.PalabraClave2, PalabraClave3 = Model.PalabraClave3, IsShowForm = false }); %>

    <p>
        <label>Con invitaci&oacute;n</label>
        <%= Html.CheckBox("Invitacion", Model.Invitacion) %>
        <br /><label></label><span>(Marque en caso positivo)</span>
    </p>
</div>