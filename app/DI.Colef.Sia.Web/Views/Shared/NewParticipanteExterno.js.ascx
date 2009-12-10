<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ParticipanteForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var cssclass = 'remote';
var rel = '#participanteexternoform';

var html = '
    <% using (Html.BeginForm("AddParticipanteExterno", Model.Controller, FormMethod.Post, new { id = "participanteexternoform" })){ %>
    <%=Html.Hidden(Model.IdName, Model.Id)%>
    <% Html.RenderPartial("_NewParticipanteExterno"); %>
    <div class="minilistaboton">
        <p>
            <span>
                <%=Html.SubmitButton("Guardar", "Agregar participante externo", new { rel = "' + rel + '", @class = "' + cssclass + '", @style = "border: 0px none;" })%>
            </span> &oacute; <a href="#" class="cancel minilistacancelar" rel="participanteexterno">Cancelar</a>
        </p>
    </div>
    <% } %>
';

$('#participanteexternoForm').html(html);
$('#participanteexternoNew').hide();
$('#participanteexternoForm').show();
DateTimePicker.setup();
AutoComplete.config($('#ParticipanteExterno_Institucion'));
