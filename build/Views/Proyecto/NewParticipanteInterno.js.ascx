<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ProyectoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var cssclass = 'remote';
var rel = '#participanteinternoform';

<% if(Model.Id == 0) { %>
    cssclass = 'local';
    rel = '#ParticipanteInternoProyecto.InvestigadorId';
<% } %>

var html = '
    <% using (Html.BeginForm("AddParticipanteInterno", "Proyecto", FormMethod.Post, new { id = "participanteinternoform" }))
       { %>
    <%=Html.Hidden("ProyectoId", Model.Id)%>
    <% Html.RenderPartial("_NewParticipanteInterno"); %>
    <div class="minilistaboton">
        <p>
            <span>
                <%=Html.SubmitButton("Guardar", "Agregar participante interno", new { rel = "' + rel + '", @class = "' + cssclass + '", @style = "border: 0px none;" })%>
            </span> &oacute; <a href="#" class="cancel minilistacancelar" rel="participanteinterno">Cancelar</a>
        </p>
    </div>
    <% } %>
';

$('#participanteinterno_form').html(html);
$('#participanteinterno_new').hide();
$('#participanteinterno_form').show();
DateTimePicker.setup();