<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ResponsableForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var cssclass = 'remote';
var rel = '#responsableexternoform';

var html = '
    <% using (Html.BeginForm("AddResponsableExterno", Model.Controller, FormMethod.Post, new { id = "responsableexternoform" })){ %>
    <%=Html.Hidden(Model.IdName, Model.Id)%>
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

$('#responsableexternoForm').html(html);
$('#responsableexternoNew').hide();
$('#responsableexternoForm').show();
DateTimePicker.setup();
AutoComplete.config($('#ResponsableExterno_Nombre'));
AutoComplete.config($('#ResponsableExterno_FormaParticipacion'));
