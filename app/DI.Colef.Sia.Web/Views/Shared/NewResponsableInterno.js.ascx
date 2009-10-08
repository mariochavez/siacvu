<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ResponsableForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var cssclass = 'remote';
var rel = '#responsableinternoform';

var html = '
    <% using (Html.BeginForm("AddResponsableInterno", Model.Controller, FormMethod.Post, new { id = "responsableinternoform" })){ %>
    <%=Html.Hidden(Model.IdName, Model.Id)%>
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

$('#responsableinternoForm').html(html);
$('#responsableinternoNew').hide();
$('#responsableinternoForm').show();
DateTimePicker.setup();
AutoComplete.config($('#ResponsableInterno_Nombre'));
