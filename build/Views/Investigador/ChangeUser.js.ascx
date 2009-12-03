<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<UsuarioForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

$('#direccion').text('<%=Html.Encode(Model.Direccion) %>');
$('#telefono').text('<%=Html.Encode(Model.Telefono) %>');
$('#correoelectronico').text('<%=Html.Encode(Model.CorreoElectronico) %>');
$('#estadocivil').text('<%=Html.Encode(Model.EstadoCivil) %>');
$('#sexo').text('<%=Html.Encode(HumanizeHelper.Sexo(Model.Sexo)) %>');
$('#fechanacimiento').text('<%=Html.Encode(Model.FechaNacimiento) %>');
$('#fechaingreso').text('<%=Html.Encode(Model.FechaIngreso) %>');
$('#documentosidentidad').text('<%=Html.Encode(Model.DocumentosIdentidad) %>');
$('#curp').text('<%=Html.Encode(Model.CURP) %>');
$('#rfc').text('<%=Html.Encode(Model.RFC) %>');
$('#nacionalidad').text('<%=Html.Encode(Model.Nacionalidad) %>');
$('#cedulaprofesional').text('<%=Html.Encode(Model.CedulaProfesional) %>');
$('#codigorh').text('<%=Html.Encode(Model.CodigoRH) %>');
