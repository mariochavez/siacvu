<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<EventoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>

<div id="NoOrganizadorColef_fields">
    <p>
        <label>Con invitaci&oacute;n</label>
        <%= Html.CheckBox("Invitacion", Model.Invitacion) %>
        <br /><label></label><span>(Marque en caso positivo)</span>
    </p>

    <% Html.RenderPartial("_ShowPalabrasClave", new ShowFieldsForm { PalabraClave1 = Model.PalabraClave1, PalabraClave2 = Model.PalabraClave2, PalabraClave3 = Model.PalabraClave3, IsShowForm = false }); %>
</div>