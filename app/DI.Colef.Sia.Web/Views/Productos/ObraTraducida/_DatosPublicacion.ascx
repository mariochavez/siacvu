<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ObraTraducidaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<p>
    <label>Nombre original de la obra</label>
    <%=Html.TextBox("Nombre", Model.Nombre, new { @class = "input420-bold-requerido", maxlength = 100 })%>
    <%=Html.ValidationMessage("Nombre")%>
</p>
<p>
    <label>Idioma al que se tradujo</label>
    <%=Html.DropDownList("Idioma", Model.Idiomas.CreateSelectList<IdiomaForm>("Id", "Nombre"),
        "Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("Idioma") %>
</p>

<h4>Nombre del traductor (co-traductor)</h4>
<p>
    <label>Nombre</label>
    <%=Html.TextBox("NombreTraductor", Model.NombreTraductor, new { @class = "input250-requerido", maxlength = 40 })%>
    <%=Html.ValidationMessage("NombreTraductor")%>
</p>
<p>
    <label>Apellido paterno</label>
    <%=Html.TextBox("ApellidoPaterno", Model.ApellidoPaterno, new { @class = "input250-requerido", maxlength = 40 })%>
    <%=Html.ValidationMessage("ApellidoPaterno")%>
</p>
<p>
    <label>Apellido materno</label>
    <%=Html.TextBox("ApellidoMaterno", Model.ApellidoMaterno, new { @class = "input250-requerido", maxlength = 40 })%>
    <%=Html.ValidationMessage("ApellidoMaterno")%>
</p>
<p>
    <label>Nombre de la obra en el idioma traducido</label>
    <%=Html.TextBox("NombreObraTraducida", Model.NombreObraTraducida, new { @class = "input420-requerido", maxlength = 100 })%>
    <%=Html.ValidationMessage("NombreObraTraducida")%>
</p>
<p>
    <label>Tipo de publicaci&oacute;n</label>
    <%=Html.DropDownList("TipoObraTraducida", Model.TiposObraTraducidas.CreateSelectList<CustomSelectForm>("Id", "Nombre"),
        "Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("TipoObraTraducida")%>
</p>

<% Html.RenderPartial("_ShowAreaTematica", new ShowFieldsForm { AreaTematicaId = Model.AreaTematicaId, AreaTematicaNombre = Model.AreaTematicaNombre, IsShowForm = false}); %>
<% Html.RenderPartial("_ShowPalabrasClave", new ShowFieldsForm { PalabraClave1 = Model.PalabraClave1, PalabraClave2 = Model.PalabraClave2, PalabraClave3 = Model.PalabraClave3, IsShowForm = false }); %>