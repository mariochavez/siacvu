<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<UsuarioForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

$('#sexo').text('<%=Html.Encode(HumanizeHelper.Sexo(Model.Sexo)) %>');
$('#fechanacimiento').text('<%=Html.Encode(Model.FechaNacimiento) %>');
$('#fechaingreso').text('<%=Html.Encode(Model.FechaIngreso) %>');

