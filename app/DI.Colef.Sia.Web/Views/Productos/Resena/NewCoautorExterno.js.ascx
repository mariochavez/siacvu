<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ResenaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var class = 'remote';
var rel = '#coautorexternoform';

<% if(Model.Id == 0) { %>
    class = 'local';
    rel = '#CoautorExternoResena.InvestigadorExternoId';
<% } %>

var html = '
    <% using (Html.BeginForm("AddCoautorExterno", "Resena", FormMethod.Post, new { id = "coautorexternoform" })){ %>
    <%=Html.Hidden("ResenaId", Model.Id)%>
    <% Html.RenderPartial("_NewCoautorExterno"); %>
    <div class="btn_container_footer">
        <span class="btn btn_small_brown">
            <%=Html.SubmitButton("Guardar", "Agregar Coautor Externo", new { rel = "' + rel + '", @class = "' + class + '", @style = "border: 0px none;" })%>
        </span>
        
	        <a href="#" class="cancel" rel="coautorexterno">Cancelar</a>
        </span>
    </div>
    <% } %>
';

$('#coautorexterno_form').html(html);
$('#coautorexterno_new').hide();
$('#coautorexterno_form').show();
DateTimePicker.setup();
