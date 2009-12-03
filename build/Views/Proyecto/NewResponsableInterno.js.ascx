<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ProyectoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var cssclass = 'remote';
var rel = '#responsableinternoform';

<% if(Model.Id == 0) { %>
    cssclass = 'local';
    rel = '#ResponsableInternoProyecto.InvestigadorId';
<% } %>

var html = '
    <% using (Html.BeginForm("AddResponsableInterno", "Proyecto", FormMethod.Post, new { id = "responsableinternoform" }))
       { %>
    <%=Html.Hidden("ProyectoId", Model.Id)%>
    <% Html.RenderPartial("_NewResponsableInterno"); %>
    <div class="minilistaboton">
        <p>
            <span>
                <%=Html.SubmitButton("Guardar", "Agregar responsable interno", new { rel = "' + rel + '", @class = "' + cssclass + '", @style = "border: 0px none;" })%>
            </span> &oacute; <a href="#" class="cancel minilistacancelar" rel="responsableinterno">Cancelar</a>
        </p>
    </div>
    <% } %>
';

$('#responsableinterno_form').html(html);
$('#responsableinterno_new').hide();
$('#responsableinterno_form').show();
DateTimePicker.setup();