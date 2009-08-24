<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ReporteForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var cssclass = 'remote';
var rel = '#coautorinternoform';

<% if(Model.Id == 0) { %>
    cssclass = 'local';
    rel = '#CoautorInternoReporte.InvestigadorId';
<% } %>

var html = '
    <% using (Html.BeginForm("AddCoautorInterno", "Reporte", FormMethod.Post, new { id = "coautorinternoform" })){ %>
    <%=Html.Hidden("ReporteId", Model.Id)%>
    <% Html.RenderPartial("_NewCoautorInterno"); %>
    <div class="minilistaboton">
        <p>
            <span>
                <%=Html.SubmitButton("Guardar", "Agregar coautor interno", new { rel = "' + rel + '", @class = "' + cssclass + '", @style = "border: 0px none;" })%>
            </span> &oacute; <a href="#" class="cancel minilistacancelar" rel="coautorinterno">Cancelar</a>
        </p>
    </div>
    <% } %>
';

$('#coautorinterno_form').html(html);
$('#coautorinterno_new').hide();
$('#coautorinterno_form').show();
DateTimePicker.setup();
