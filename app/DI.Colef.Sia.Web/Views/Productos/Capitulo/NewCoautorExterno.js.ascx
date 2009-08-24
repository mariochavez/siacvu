<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CapituloForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var cssclass = 'remote';
var rel = '#coautorexternoform';

<% if(Model.Id == 0) { %>
    cssclass = 'local';
    rel = '#CoautorExternoCapitulo.InvestigadorExternoId';
<% } %>

var html = '
    <% using (Html.BeginForm("AddCoautorExterno", "Capitulo", FormMethod.Post, new { id = "coautorexternoform" })){ %>
    <%=Html.Hidden("CapituloId", Model.Id)%>
    <% Html.RenderPartial("_NewCoautorExterno"); %>
    <div class="minilistaboton">
        <p>
            <span>
                <%=Html.SubmitButton("Guardar", "Agregar coautor externo", new { rel = "' + rel + '", @class = "' + cssclass + '", @style = "border: 0px none;" })%>
            </span> &oacute; <a href="#" class="cancel minilistacancelar" rel="coautorexterno">Cancelar</a>
        </p>
    </div>
    <% } %>
';

$('#coautorexterno_form').html(html);
$('#coautorexterno_new').hide();
$('#coautorexterno_form').show();
DateTimePicker.setup();
