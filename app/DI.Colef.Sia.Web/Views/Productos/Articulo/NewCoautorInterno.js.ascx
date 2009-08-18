<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ArticuloForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var class = 'remote';
var rel = '#coautorinternoform';

<% if(Model.Id == 0) { %>
    class = 'local';
    rel = '#CoautorInternoArticulo.InvestigadorId';
<% } %>

var html = '
    <% using (Html.BeginForm("AddCoautorInterno", "Articulo", FormMethod.Post, new { id = "coautorinternoform" })){ %>
    <%=Html.Hidden("ArticuloId", Model.Id)%>
    <% Html.RenderPartial("_NewCoautorInterno"); %>
    <div class="btn_container_footer">
        <span class="btn btn_small_brown">
            <%=Html.SubmitButton("Guardar", "Agregar Coautor Interno", new { rel = "' + rel + '", @class = "' + class + '", @style = "border: 0px none;" })%>
        </span>
        
	        <a href="#" class="cancel" rel="coautorinterno">Cancelar</a>
        </span>
    </div>
    <% } %>
';

$('#coautorinterno_form').html(html);
$('#coautorinterno_new').hide();
$('#coautorinterno_form').show();
DateTimePicker.setup();
