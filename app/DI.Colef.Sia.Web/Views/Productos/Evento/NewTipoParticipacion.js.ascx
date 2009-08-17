<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<EventoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <% using (Html.BeginForm("AddTipoParticipacion", "Evento", FormMethod.Post, new { id = "tipoparticipacionform" })){ %>
    <%=Html.Hidden("EventoId", Model.Id) %>
    <% Html.RenderPartial("_NewTipoParticipacion"); %>
    <div class="btn_container_footer">
        <span class="btn btn_small_brown">
            <%=Html.SubmitButton("Guardar", "Agregar Participación", new { rel = "#tipoparticipacionform", @class = "remote", @style = "border: 0px none;" })%>
        </span>
        
	        <a href="#" class="cancel" rel="tipoparticipacion">Cancelar</a>
        </span>
    </div>
    <% } %>
';

$('#tipoparticipacion_form').html(html);
$('#tipoparticipacion_new').hide();
$('#tipoparticipacion_form').show();
DateTimePicker.setup();
