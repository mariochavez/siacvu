<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ResenaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Nombre de la publicaci&oacute;n</label>
    <%=Html.TextBox("NombreProducto", Model.NombreProducto, new { @class = "input420-bold-requerido", maxlength = 200 })%>
    <%=Html.ValidationMessage("NombreProducto")%>
</p>                
<p>
    <label>Tipo de publicaci&oacute;n</label>
    <%=Html.DropDownList("TipoResena", Model.TiposResenas.CreateSelectList<CustomSelectForm>("Id", "Nombre"),
        "Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("TipoResena")%>
</p>
<p>
    <label>&Aacute;rea tem&aacute;tica</label>
    <%=Html.TextBox("AreaTematicaNombre", Model.AreaTematicaNombre,
            new { @class = "autocomplete buscar-requerido", rel = Url.Action("Search", "AreaTematica"), maxlength = 100 })%>
    <%=Html.Hidden("AreaTematicaId", Model.AreaTematicaId, new { rel = "#AreaTematicaNombre" })%>
    <%=Html.ValidationMessage("AreaTematicaNombre")%>
</p>
<p>
    <label>Palabra clave 1</label>
    <%=Html.TextBox("PalabraClave1", Model.PalabraClave1, new { @class = "input250", maxlength = 50 })%>
    <span class="cvu"></span>
</p>
<p>
    <label>Palabra clave 2</label>
    <%=Html.TextBox("PalabraClave2", Model.PalabraClave2, new { @class = "input250", maxlength = 50 })%>
    <span class="cvu"></span>
</p>
<p>
    <label>Palabra clave 3</label>
    <%=Html.TextBox("PalabraClave3", Model.PalabraClave3, new { @class = "input250", maxlength = 50 })%>
    <span class="cvu"></span>
</p>

<% Html.RenderPartial("_ShowSubdisciplina", new ShowFieldsForm { Areas = Model.Areas, Disciplinas = Model.Disciplinas, Subdisciplinas = Model.Subdisciplinas, IsShowForm = false }); %>