<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<InvestigadorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers" %>

<p>
    <label>Estado civil</label>
    <span id="estadocivil" class="valor"><%=Html.Encode(Model.UsuarioEstadoCivil) %>&nbsp;</span>
</p>
<p>
    <label>Fecha de nacimiento</label>
    <span id="fechanacimiento" class="valor"><%=Html.Encode(Model.UsuarioFechaNacimiento) %>&nbsp;</span>
    <span>(Formato dd/mm/aaaa)</span>
</p>
<p>
    <label>Documentos de identidad</label>
    <span id="documentosidentidad" class="valor"><%=Html.Encode(Model.UsuarioDocumentosIdentidad) %>&nbsp;</span>
</p>
<p>
    <label>CURP</label>
    <span id="curp" class="valor"><%=Html.Encode(Model.UsuarioCURP) %>&nbsp;</span>
</p>
<p>
    <label>RFC</label>
    <span id="rfc" class="valor"><%=Html.Encode(Model.UsuarioRFC) %>&nbsp;</span>
</p>
<p>
    <label>Sexo</label>
    <span id="sexo" class="valor"><%=Html.Encode(HumanizeHelper.Sexo(Model.UsuarioSexo)) %>&nbsp;</span>
</p>
<p>
    <label>Nacionalidad</label>
    <span id="nacionalidad" class="valor"><%=Html.Encode(Model.UsuarioNacionalidad) %>&nbsp;</span>
</p>	
<p>
    <label>Fecha de ingreso</label>
    <span id="fechaingreso" class="valor"><%=Html.Encode(Model.UsuarioFechaIngreso) %>&nbsp;</span>
    <span>(Formato dd/mm/aaaa)</span>
</p>
<p>
    <label>N&uacute;m. de c&eacute;dula profesional</label>
    <span id="cedulaprofesional" class="valor"><%=Html.Encode(Model.UsuarioCedulaProfesional) %>&nbsp;</span>
</p>	         
<p>
    <label>C&oacute;digo RH</label>
    <span id="codigorh" class="valor"><%=Html.Encode(Model.UsuarioCodigoRH) %>&nbsp;</span>
</p>	
<!-- -->
<% Html.RenderPartial("_ShowDirecciones", Model.UsuarioDirecciones); %>

<% Html.RenderPartial("_ShowCorreosElectronicos", Model.UsuarioCorreosElectronicos); %>

<% Html.RenderPartial("_ShowTelefonos", Model.UsuarioTelefonos); %>
<!-- -->
<p class="submit">
    <%=Html.ActionLink<UsuarioController>(x => x.Edit(Model.UsuarioId), "Editar informacion personal") %>
</p>