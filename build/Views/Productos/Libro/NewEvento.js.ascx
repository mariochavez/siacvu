<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<LibroForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var cssclass = 'remote';
var rel = '#eventoform';

var html = '
    <% using (Html.BeginForm("AddEvento", "Libro", FormMethod.Post, new { id = "eventoform" })){ %>
    <%=Html.Hidden("LibroId", Model.Id)%>
    <% Html.RenderPartial("_NewEvento"); %>
    <div class="minilistaboton">
        <p>
            <span>
                <%=Html.SubmitButton("Guardar", "Agregar evento", new { rel = "' + rel + '", @class = "' + cssclass + '", @style = "border: 0px none;" })%>
            </span> &oacute; <a href="#" class="cancel minilistacancelar" rel="evento">Cancelar</a>
        </p>
    </div>
    <% } %>
';

$('#eventoForm').html(html);
$('#eventoNew').hide();
$('#eventoForm').show();
DateTimePicker.setup();
