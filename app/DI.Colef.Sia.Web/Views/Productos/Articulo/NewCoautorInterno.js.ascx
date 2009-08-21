<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ArticuloForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var cssclass = 'remote';
var rel = '#coautorinternoform';

<% if(Model.Id == 0) { %>
    cssclass = 'local';
    rel = '#CoautorInternoArticulo.InvestigadorId';
<% } %>

var html = '
    <% using (Html.BeginForm("AddCoautorInterno", "Articulo", FormMethod.Post, new { id = "coautorinternoform" })){ %>
    <%=Html.Hidden("ArticuloId", Model.Id)%>
    <% Html.RenderPartial("_NewCoautorInterno"); %>
    <div class="minilistaboton">
        <p>
            <span>
                <%=Html.SubmitButton("Guardar", "Agregar Coautor Interno", new { rel = "' + rel + '", @class = "' + cssclass + '", @style = "border: 0px none;" })%>
            </span> &oacute; <a href="#" class="cancel minilistacancelar" rel="coautorinterno">Cancelar</a>
        </p>
    </div>
    <% } %>
';

$('#coautorinterno_form').html(html);
$('#coautorinterno_new').hide();
$('#coautorinterno_form').show();
DateTimePicker.setup();
