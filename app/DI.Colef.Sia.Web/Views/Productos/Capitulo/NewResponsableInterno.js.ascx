<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CapituloForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var cssclass = 'remote';
var rel = '#responsableinternoform';

<% if(Model.Id == 0) { %>
    cssclass = 'local';
    rel = '#ResponsableInternoCapitulo.InvestigadorId';
<% } %>

var html = '
    <% using (Html.BeginForm("AddResponsableInterno", "Capitulo", FormMethod.Post, new { id = "responsableinternoform" }))
       { %>
    <%=Html.Hidden("CapituloId", Model.Id)%>
    <% Html.RenderPartial("_NewResponsableInterno"); %>
    <div class="minilistaboton">
        <p>
            <span>
                <%=Html.SubmitButton("Guardar", "Agregar Responsable Interno", new { rel = "' + rel + '", @class = "' + cssclass + '", @style = "border: 0px none;" })%>
            </span> &oacute; <a href="#" class="cancel minilistacancelar" rel="responsableinterno">Cancelar</a>
        </p>
    </div>
    <% } %>
';

$('#responsableinterno_form').html(html);
$('#responsableinterno_new').hide();
$('#responsableinterno_form').show();
DateTimePicker.setup();
