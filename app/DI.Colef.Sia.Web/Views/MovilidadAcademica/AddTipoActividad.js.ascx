<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<TipoActividadMovilidadAcademicaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <div id="tipoactividad_<%=Html.Encode(Model.Id) %>" class="sublista">
        <h6><%=Html.Encode(Model.TipoActividadNombre) %></h6>
    </div>
';

$('#message').html('');
$('#message').removeClass('errormessage');

$('#tipoactividad_form').hide();
$('#tipoactividad_new').show();
$('#tipoactividad_form').html('');
$('#tipoactividadEmptyList_form').html('');
$('#tipoactividadList div:first').before(html);

$('#tipoactividad_' + <%=Html.Encode(Model.Id) %> + ':first').hide();
$('#tipoactividad_' + <%=Html.Encode(Model.Id) %> + ':first').fadeIn('slow');

setupSublistRows();