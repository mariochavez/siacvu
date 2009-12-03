<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<EventoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var cssclass = 'remote';
var rel = '#institucioneventoform';

var html = '
    <% using (Html.BeginForm("AddInstitucion", "Evento", FormMethod.Post, new { id = "institucioneventoform" })){ %>
    <%=Html.Hidden("EventoId", Model.Id)%>
    <% Html.RenderPartial("_NewInstitucion"); %>
    <div class="minilistaboton">
        <p>
            <span>
                <%=Html.SubmitButton("Guardar", "Agregar institución", new { rel = "' + rel + '", @class = "' + cssclass + '", @style = "border: 0px none;" })%>
            </span> &oacute; <a href="#" class="cancel minilistacancelar" rel="institucionevento">Cancelar</a>
        </p>
    </div>
    <% } %>
';

$('#institucioneventoForm').html(html);
$('#institucioneventoNew').hide();
$('#institucioneventoForm').show();
AutoComplete.config($('#InstitucionEvento_Nombre'));