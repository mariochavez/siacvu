<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ProyectoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var cssclass = 'remote';
var rel = '#responsableexternoform';

<% if(Model.Id == 0) { %>
    cssclass = 'local';
    rel = '#ResponsableExternoProyecto.InvestigadorExternoId';
<% } %>

var html = '
    <% using (Html.BeginForm("AddResponsableExterno", "Proyecto", FormMethod.Post, new { id = "responsableexternoform" }))
       { %>
    <%=Html.Hidden("ProyectoId", Model.Id)%>
    <% Html.RenderPartial("_NewResponsableExterno"); %>
    <div class="minilistaboton">
        <p>
            <span>
                <%=Html.SubmitButton("Guardar", "Agregar responsable externo", new { rel = "' + rel + '", @class = "' + cssclass + '", @style = "border: 0px none;" })%>
            </span> &oacute; <a href="#" class="cancel minilistacancelar" rel="responsableexterno">Cancelar</a>
        </p>
    </div>
    <% } %>
';

$('#responsableexterno_form').html(html);
$('#responsableexterno_new').hide();
$('#responsableexterno_form').show();
DateTimePicker.setup();