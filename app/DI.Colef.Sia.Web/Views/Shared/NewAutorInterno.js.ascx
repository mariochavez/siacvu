<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<AutorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var cssclass = 'remote';
var rel = '#autorinternoform';

var html = '
    <% using (Html.BeginForm("AddAutorInterno", Model.Controller, FormMethod.Post, new { id = "autorinternoform" })){ %>
    <%=Html.Hidden(Model.IdName, Model.Id)%>
    <% Html.RenderPartial("_NewAutorInterno"); %>
    <div class="minilistaboton" id="submit">
        <p>
            <span>
                <%=Html.SubmitButton("Guardar", "Agregar autor(a) interno(a)", new { rel = "' + rel + '", @class = "' + cssclass + '", @style = "border: 0px none;" })%>
            </span> &oacute; <a href="#" class="cancel minilistacancelar" rel="autor">Cancelar</a>
        </p>
    </div>
    <% } %>
';

$('#autorForm').html(html);
$('#autorNew').hide();
$('#autorForm').show();
DateTimePicker.setup();
AutoComplete.config($('#AutorInterno_Nombre'));
$('#AutorInterno_AutorSeOrdenaAlfabeticamente').attr('value', $('#AutorSeOrdenaAlfabeticamente').is(':checked'));
