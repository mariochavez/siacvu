<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ProyectoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<p>
    <label>Objetivo general</label>
    <%=Html.TextBox("ObjetivoGeneral", Model.ObjetivoGeneral, new { @class = "input250", maxlength = 100 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("ObjetivoGeneral")%>
</p>
<p>
    <label>Palabra clave 1</label>
    <%=Html.TextBox("PalabraClave1", Model.PalabraClave1, new { @class = "input250", maxlength = 100 })%>
    <%=Html.ValidationMessage("PalabraClave1")%>
</p>
<p>
    <label>Palabra clave 2</label>
    <%=Html.TextBox("PalabraClave2", Model.PalabraClave2, new { @class = "input250", maxlength = 100 })%>
    <%=Html.ValidationMessage("PalabraClave2")%>
</p>
<p>
    <label>Palabra clave 3</label>
    <%=Html.TextBox("PalabraClave3", Model.PalabraClave3, new { @class = "input250", maxlength = 100 })%>
    <%=Html.ValidationMessage("PalabraClave3")%>
</p>
<p>
    <label>L&iacute;nea tem&aacute;tica institucional</label>
    <%=Html.DropDownList("LineaTematica", Model.LineasTematicas.CreateSelectList<LineaTematicaForm>("Id", "Nombre"),
                                "Seleccione ...", new { @class = "cascade", rel = Url.Action("ChangeLineaTematica") })%>
    <%=Html.ValidationMessage("LineaTematica")%>
</p>
<p>
    <label>&Aacute;rea tem&aacute;tica institucional</label>
    <%=Html.DropDownList("AreaTematica", Model.AreasTematicas.CreateSelectList<AreaTematicaForm>("Id", "Nombre"),
                                "Seleccione ...")%>
    <%=Html.ValidationMessage("AreaTematica")%>
</p>
<p>
    <label>Impacto en la pol&iacute;tica p&uacute;blica</label>
    <%=Html.DropDownList("ImpactoPoliticaPublica", Model.ImpactosPoliticasPublicas.CreateSelectList<ImpactoPoliticaPublicaForm>("Id", "Nombre"),
                "Seleccione ...")%>
    <%=Html.ValidationMessage("ImpactoPoliticaPublica")%>
</p>
<p>
    <label>Impacto acad&eacute;mico esperado</label>
    <%=Html.TextBox("ImpactoAcademicoEsperado", Model.ImpactoAcademicoEsperado, new { @class = "input250", maxlength = 100 })%>
    <%=Html.ValidationMessage("ImpactoAcademicoEsperado")%>
</p>
<p>
    <label>Usuarios potenciales</label>
    <%=Html.TextBox("UsuariosPotenciales", Model.UsuariosPotenciales, new { @class = "input250", maxlength = 100 })%>
    <%=Html.ValidationMessage("UsuariosPotenciales")%>
</p>
<p>
    <label>Posibles beneficiarios</label>
    <%=Html.TextBox("PosiblesBeneficiarios", Model.PosiblesBeneficiarios, new { @class = "input250", maxlength = 100 })%>
    <%=Html.ValidationMessage("PosiblesBeneficiarios")%>
</p>
<p>
    <label>Requiere servicio de la USEG</label>
    <%=Html.CheckBox("RequiereServicioUSEG", Model.RequiereServicioUSEG)%>
    <%=Html.ValidationMessage("RequiereServicioUSEG")%>
</p>
<p>
    <label>Servicio USEG</label>
    <%=Html.DropDownList("USEG", Model.Usegs.CreateSelectList<USEGForm>("Id", "Nombre"),
                "Seleccione ...")%>
    <%=Html.ValidationMessage("USEG")%>
</p>