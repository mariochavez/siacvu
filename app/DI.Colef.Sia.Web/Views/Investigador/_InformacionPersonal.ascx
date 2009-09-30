<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<InvestigadorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<p>
    <label>Direcci&oacute;n</label>
    <span id="direccion"><%=Html.Encode(Model.UsuarioDireccion) %>&nbsp;</span>
</p> 
<p>
    <label>Tel&eacute;fono</label>
    <span id="telefono"><%=Html.Encode(Model.UsuarioTelefono) %>&nbsp;</span>
</p>
<p>
    <label>Correo electr&oacute;nico</label>
    <span id="correoelectronico"><%=Html.Encode(Model.UsuarioCorreoElectronico) %>&nbsp;</span>
</p>
<p>
    <label>Estado civil</label>
    <span id="estadocivil">&nbsp;</span>
</p>
<p>
    <label>Fecha de nacimiento</label>
    <span id="fechanacimiento"><%=Html.Encode(Model.UsuarioFechaNacimiento) %>&nbsp;</span>
    <span>(Formato dd/mm/yyyy)</span>
</p>
<p>
    <label>Documentos de identidad</label>
    <span id="documentosidentidad">&nbsp;</span>
</p>
<p>
    <label>CURP</label>
    <span id="curp">&nbsp;</span>
</p>
<p>
    <label>RFC</label>
    <span id="rfc">&nbsp;</span>
</p>
<p>
    <label>Sexo</label>
    <span id="sexo"><%=Html.Encode(HumanizeHelper.Sexo(Model.UsuarioSexo)) %>&nbsp;</span>
</p>
<p>
    <label>Nacionalidad</label>
    <span id="nacionalidad">&nbsp;</span>
</p>	
<p>
    <label>Fecha de ingreso</label>
    <span id="fechaingreso"><%=Html.Encode(Model.UsuarioFechaIngreso) %>&nbsp;</span>
    <span>(Formato dd/mm/yyyy)</span>
</p>
<p>
    <label>N&uacute;n. de c&eacute;dula profesional</label>
    <span id="cedulaprofesional">&nbsp;</span>
</p>	         
<p>
    <label>C&oacute;digo RH</label>
    <span id="codigorh">&nbsp;</span>
</p>	