<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<UsuarioForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<p>
    <label>Nombre Completo</label>
    <span class="valor"><%= Html.Encode(Model.NombreCompleto)%>&nbsp;</span>
</p>
<p>
    <label>Usuario</label>
    <span class="valor"><%= Html.Encode(Model.UsuarioNombre)%>&nbsp;</span>
</p>
<p>
    <label>Direcci&oacute;n</label>
    <span class="valor"><%= Html.Encode(Model.Direccion)%>&nbsp;</span>
</p>
<p>
    <label>Tel&eacute;fono</label>
    <span class="valor"><%= Html.Encode(Model.Telefono) %>&nbsp;</span>
</p>
<p>
    <label>Correo electr&oacute;nico</label>
    <span class="valor"><%= Html.Encode(Model.CorreoElectronico)%>&nbsp;</span>
</p>
<p>
    <label>Estado civil</label>
    <span class="valor"><%= Html.Encode(Model.EstadoCivil)%>&nbsp;</span>
</p>
<p>
    <label>Sexo</label>
    <span class="valor"><%=Html.Encode(HumanizeHelper.Sexo(Model.Sexo)) %>&nbsp;</span>
</p>
<p>
    <label>C.U.R.P.</label>
    <span class="valor"><%= Html.Encode(Model.CURP) %>&nbsp;</span>
</p>
<p>
    <label>R.F.C.</label>
    <span class="valor"><%= Html.Encode(Model.RFC)%>&nbsp;</span>
</p>
<p>
    <label>C&eacute;dula profesional</label>
    <span class="valor"><%= Html.Encode(Model.CedulaProfesional)%>&nbsp;</span>
</p>
<p>
    <label>Nacionalidad</label>
    <span class="valor"><%= Html.Encode(Model.Nacionalidad)%>&nbsp;</span>
</p>
<p>
    <label>C&oacute;digo R.H.</label>
    <span class="valor"><%= Html.Encode(Model.CodigoRH)%>&nbsp;</span>
</p>
<p>
    <label>Fecha nacimiento</label>
    <span class="valor"><%= Html.Encode(Model.FechaNacimiento)%>&nbsp;</span><span>Formato (yyyy)</span>
</p>
<p>
    <label>Fecha ingreso</label>
    <span class="valor"><%= Html.Encode(Model.FechaIngreso)%>&nbsp;</span><span>Formato (yyyy)</span>
</p>
<p>
    <label>Investigador</label>
    <span class="valor"><%= Html.Encode(HumanizeHelper.Boolean(Model.Investigador))%>&nbsp;</span>
</p>
<p>
    <label>Activo</label>
    <span class="valor"><%= Html.Encode(HumanizeHelper.Boolean(Model.Activo))%>&nbsp;</span>
</p>