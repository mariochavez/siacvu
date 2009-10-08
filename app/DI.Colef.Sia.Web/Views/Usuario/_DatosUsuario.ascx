<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<UsuarioForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<p>
    <label>Nombre Completo</label>
    <strong><%= Html.Encode(Model.NombreCompleto)%>&nbsp;</strong>
</p>
<p>
    <label>Usuario</label>
    <strong><%= Html.Encode(Model.UsuarioNombre)%>&nbsp;</strong>
</p>
<p>
    <label>Direcci&oacute;n</label>
    <strong><%= Html.Encode(Model.Direccion)%>&nbsp;</strong>
</p>
<p>
    <label>Tel&eacute;fono</label>
    <strong><%= Html.Encode(Model.Telefono) %>&nbsp;</strong>
</p>
<p>
    <label>Correo electr&oacute;nico</label>
    <strong><%= Html.Encode(Model.CorreoElectronico)%>&nbsp;</strong>
</p>
<p>
    <label>Estado civil</label>
    <strong><%= Html.Encode(Model.EstadoCivil)%>&nbsp;</strong>
</p>
<p>
    <label>Sexo</label>
    <strong><%=Html.Encode(HumanizeHelper.Sexo(Model.Sexo)) %>&nbsp;</strong>
</p>
<p>
    <label>C.U.R.P.</label>
    <strong><%= Html.Encode(Model.CURP) %>&nbsp;</strong>
</p>
<p>
    <label>R.F.C.</label>
    <strong><%= Html.Encode(Model.RFC)%>&nbsp;</strong>
</p>
<p>
    <label>C&eacute;dula profesional</label>
    <strong><%= Html.Encode(Model.CedulaProfesional)%>&nbsp;</strong>
</p>
<p>
    <label>Nacionalidad</label>
    <strong><%= Html.Encode(Model.Nacionalidad)%>&nbsp;</strong>
</p>
<p>
    <label>C&oacute;digo R.H.</label>
    <strong><%= Html.Encode(Model.CodigoRH)%>&nbsp;</strong>
</p>
<p>
    <label>Fecha nacimiento</label>
    <strong><%= Html.Encode(Model.FechaNacimiento)%>&nbsp;</strong><span>Formato (yyyy)</span>
</p>
<p>
    <label>Fecha ingreso</label>
    <strong><%= Html.Encode(Model.FechaIngreso)%>&nbsp;</strong><span>Formato (yyyy)</span>
</p>
<p>
    <label>Investigador</label>
    <strong><%= Html.Encode(HumanizeHelper.Boolean(Model.Investigador))%>&nbsp;</strong>
</p>
<p>
    <label>Activo</label>
    <strong><%= Html.Encode(HumanizeHelper.Boolean(Model.Activo))%>&nbsp;</strong>
</p>