<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<InvestigadorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<p>
    <label>L&iacute;nea tem&aacute;tica Institucional</label>
    <span id="span_lineatematica" class="valor"><%= Html.Encode(Model.AreaTematicaLineaTematicaNombre)%>&nbsp;</span>
</p>
<p>
    <label>&Aacute;rea tem&aacute;tica Institucional</label>
    <%=Html.DropDownList("AreaTematicaId", Model.AreasTematicas.CreateSelectList<AreaTematicaForm>("Id", "Nombre"),
                        "Seleccione ...", new { @class = "requerido cascade", rel = Url.Action("changearea") })%>
    <%=Html.ValidationMessage("AreaTematicaId")%>
</p>
<p>
    <label>Area tem&aacute;tica 1</label>
    <%=Html.TextBox("AreaTematica1", Model.AreaTematica1, new { @class = "input250", maxlength = 40 })%>
</p>
<p>
    <label>Area tem&aacute;tica 2</label>
    <%=Html.TextBox("AreaTematica2", Model.AreaTematica2, new { @class = "input250", maxlength = 40 })%>
</p>
<p>
    <label>Area tem&aacute;tica 3</label>
    <%=Html.TextBox("AreaTematica3", Model.AreaTematica3, new { @class = "input250", maxlength = 40 })%>
</p>                                  
<p>
    <label>Expediente producci&oacute;n</label>
    <%=Html.TextBox("ExpedienteProduccion", Model.ExpedienteProduccion, new { @class = "input250", maxlength = 40 })%>
    <span class="cvu"></span>
</p> 
<p>
    <label>Expediente acad&eacute;mico</label>
    <%=Html.TextBox("ExpedienteAcademico", Model.ExpedienteAcademico, new { @class = "input250", maxlength = 40 })%>
    <span class="cvu"></span>
</p>                         
<p>
    <label>Clave CVU</label>
    <%=Html.TextBox("ClaveCVU", Model.ClaveCVU, new { @class = "input250", maxlength = 40 })%>
</p>
 