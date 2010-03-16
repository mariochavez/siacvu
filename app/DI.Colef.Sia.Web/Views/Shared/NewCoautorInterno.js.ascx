<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CoautorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var coutoresTotal = $('#coautorinternoList div[id^=coautorinterno_]').length;
coutoresTotal += $('#coautorexternoList div[id^=coautorexterno_]').length;
coutoresTotal+= 2;

var cssclass = 'remote';
var rel = '#coautorinternoform';

var html = '
    <% using (Html.BeginForm("AddCoautorInterno", Model.Controller, FormMethod.Post, new { id = "coautorinternoform" })){ %>
    <%=Html.Hidden(Model.IdName, Model.Id)%>
    <% Html.RenderPartial("_NewCoautorInterno"); %>
    <div class="minilistaboton" id="submit">
        <p>
            <span>
                <%=Html.SubmitButton("Guardar", "Agregar investigador interno", new { rel = "' + rel + '", @class = "' + cssclass + '", @style = "border: 0px none;" })%>
            </span> &oacute; <a href="#" class="cancel minilistacancelar" rel="coautor">Cancelar</a>
        </p>
    </div>
    <% } %>
';

$('#coautorForm').html(html);
$('#coautorNew').hide();
$('#CoautorInterno_Posicion').val(coutoresTotal);
$('#coautorForm').show();

DateTimePicker.setup();

AutoComplete.config($('#CoautorInterno_Nombre'));
$('#CoautorInterno_Nombre')[0].autocompleter.setExtraParams({ extraParam: <%=Model.CreadoPorId%> });
$('#CoautorInterno_CoautorSeOrdenaAlfabeticamente').attr('value', $('#CoautorSeOrdenaAlfabeticamente').is(':checked'));