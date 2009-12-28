<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<HomeForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
        <h4>Producci&oacute;n acad&eacute;mica</h4>
        <% Html.RenderPartial("_ProduccionAcademica", Model); %>
        
        <h4>Proyectos de investigaci&oacute;n</h4>
        <% Html.RenderPartial("_ProyectosInvestigacion", Model); %>
        
        <h4>Formaci&oacute;n de recursos humanos</h4>
        <% Html.RenderPartial("_RecursosHumanos", Model); %>
        
        <h4>Actividades de vinculaci&oacute;n y difusi&oacute;n</h4>
        <% Html.RenderPartial("_VinculacionDifusion", Model); %>
';

$('#lista').html('');
$('#lista').html(html);

<% if(Model.FilterType == 1){ %>
    $('#Departamento').attr('value', '');
<% } %>
<% if(Model.FilterType == 2){ %>
    $('#Investigador').attr('value', '');
<% } %>