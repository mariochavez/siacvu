<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<EventoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var cssclass = 'remote';
var rel = '#sesionform';

var html = '
    <% using (Html.BeginForm("AddSesion", "Evento", FormMethod.Post, new { id = "sesionform" })){ %>
    <%=Html.Hidden("EventoId", Model.Id)%>
    <% Html.RenderPartial("_NewSesion"); %>
    <div class="minilistaboton" id="submit">
        <p>
            <span>
                <%=Html.SubmitButton("Guardar", "Agregar sesión", new { rel = "' + rel + '", @class = "' + cssclass + '", @style = "border: 0px none;" })%>
            </span> &oacute; <a href="#" class="cancel minilistacancelar" rel="sesion">Cancelar</a>
        </p>
    </div>
    <% } %>
';

$('#sesionForm').html(html);
$('#sesionNew').hide();
$('#sesionForm').show();
DateTimePicker.setup();