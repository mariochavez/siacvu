<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ProyectoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var cssclass = 'remote';
var rel = '#responsableform';

var html = '
    <% using (Html.BeginForm("AddResponsable", "Proyecto", FormMethod.Post, new { id = "responsableform" })){ %>
    <%=Html.Hidden("ProyectoId", Model.Id)%>
    <% Html.RenderPartial("_NewResponsable"); %>
    <div class="minilistaboton" id="submit">
        <p>
            <span>
                <%=Html.SubmitButton("Guardar", "Agregar responsable", new { rel = "' + rel + '", @class = "' + cssclass + '", @style = "border: 0px none;" })%>
            </span> &oacute; <a href="#" class="cancel minilistacancelar" rel="responsable">Cancelar</a>
        </p>
    </div>
    <% } %>
';

$('#responsableForm').html(html);
$('#responsableNew').hide();
$('#responsableForm').show();
DateTimePicker.setup();
AutoComplete.config($('#Responsable_Nombre'));