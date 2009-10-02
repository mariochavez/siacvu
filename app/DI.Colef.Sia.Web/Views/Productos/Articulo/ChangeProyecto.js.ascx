<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ArticuloForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var lineaTematica ='
    <label>L&iacute;nea tem&aacute;tica</label>
    <%=Html.Encode(Model.ProyectoLineaTematicaNombre)%>
';

var areaTematica ='
    <label>&Aacute;rea tem&aacute;tica</label>
    <%=Html.Encode(Model.ProyectoAreaTematicaNombre)%>
';

$('#lineatematica').html('');
$('#lineatematica').html(lineaTematica);

$('#areatematica').html('');
$('#areatematica').html(areaTematica);


