<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ArticuloForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<p>
    <label>Nombre del art&iacute;culo</label>
    <%=Html.TextBox("Titulo", Model.Titulo, new { @class = "input420-bold-requerido", maxlength = 100 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("Titulo")%>
</p>
<p>
    <label>Tipo de art&iacute;culo</label>
    <%=Html.DropDownList("TipoArticulo", Model.TiposArticulos.CreateSelectList<CustomSelectForm>("Id", "Nombre"),
                        "Seleccione ...", new { @class = "tipo requerido" })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("TipoArticulo") %>
</p>
<p>
    <label></label>
    <%= Html.CheckBox("TieneProyecto", Model.TieneProyecto)%> ¿Existe proyecto de investigaci&oacute;n de referencia?
</p>
<div id="tieneproyecto_field">
    <% Html.RenderPartial("_ShowProyecto", new ShowFieldsForm { ProyectoId = Model.ProyectoId, ProyectoNombre = Model.ProyectoNombre, IsShowForm = false }); %>
</div>

<% Html.RenderPartial("_ShowAreaTematica", new ShowFieldsForm { AreaTematicaId = Model.AreaTematicaId, AreaTematicaNombre = Model.AreaTematicaNombre, IsShowForm = false }); %>
<% Html.RenderPartial("_ShowPalabrasClave", new ShowFieldsForm { PalabraClave1 = Model.PalabraClave1, PalabraClave2 = Model.PalabraClave2, PalabraClave3 = Model.PalabraClave3, IsShowForm = false }); %>
<% Html.RenderPartial("_ShowSubdisciplina", new ShowFieldsForm { Areas = Model.Areas, Disciplinas = Model.Disciplinas, Subdisciplinas = Model.Subdisciplinas, IsShowForm = false }); %>