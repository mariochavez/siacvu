<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<AutorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var cssclass = 'remote';
var rel = '#autorexternoform';

var html = '
    <% using (Html.BeginForm("AddAutorExterno", Model.Controller, FormMethod.Post, new { id = "autorexternoform" })){ %>
    <%=Html.Hidden(Model.IdName, Model.Id)%>
    <% Html.RenderPartial("_NewAutorExterno"); %>
    <div class="minilistaboton">
        <p>
            <span>
                <%=Html.SubmitButton("Guardar", "Agregar autor externo", new { rel = "' + rel + '", @class = "' + cssclass + '", @style = "border: 0px none;" })%>
            </span> &oacute; <a href="#" class="cancel minilistacancelar" rel="autorexterno">Cancelar</a>
        </p>
    </div>
    <% } %>
';

$('#autorexternoForm').html(html);
$('#autorexternoNew').hide();
$('#autorexternoForm').show();
DateTimePicker.setup();
AutoComplete.config($('#AutorExterno_Institucion'));
