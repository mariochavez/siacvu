<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ProyectoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var cssclass = 'remote';
var rel = '#recursofinancieroform';

var html = '
    <% using (Html.BeginForm("AddRecursoFinanciero", "Proyecto", FormMethod.Post, new { id = "recursofinancieroform" })){ %>
    <%=Html.Hidden("ProyectoId", Model.Id)%>
    <% Html.RenderPartial("_NewRecursoFinanciero"); %>
    <div class="minilistaboton">
        <p>
            <span>
                <%=Html.SubmitButton("Guardar", "Agregar recurso financiero", new { rel = "' + rel + '", @class = "' + cssclass + '", @style = "border: 0px none;" })%>
            </span> &oacute; <a href="#" class="cancel minilistacancelar" rel="recursofinanciero">Cancelar</a>
        </p>
    </div>
    <% } %>
';

$('#recursofinancieroForm').html(html);
$('#recursofinancieroNew').hide();
$('#recursofinancieroForm').show();
DateTimePicker.setup();
AutoComplete.config($('#RecursoFinanciero_Institucion'));
