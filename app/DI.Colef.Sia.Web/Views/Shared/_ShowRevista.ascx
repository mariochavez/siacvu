<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ShowFieldsForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<% if(!Model.IsShowForm){ %>
    <p>
        <label><%= Html.Encode(Model.RevistaLabel) %></label>
        <%=Html.TextBox("RevistaPublicacionTitulo", Model.RevistaPublicacionTitulo,
            new { @class = "autocomplete buscar-requerido", rel = Url.Action("Search", "RevistaPublicacion"), maxlength = 100 }) %>
        <%=Html.Hidden("RevistaPublicacionId", Model.RevistaPublicacionId, new { rel = "#RevistaPublicacionTitulo", url = Url.Action("ChangeRevista") })%>
        <span class="cvu"></span>
        <%=Html.ValidationMessage("RevistaPublicacionTitulo")%>
    </p>
<% } else { %>
    <p>
        <label><%= Html.Encode(Model.RevistaLabel) %></label>
        <span class="valor"><%=Html.Encode(Model.RevistaPublicacionTitulo)%>&nbsp;</span>
    </p>
<% } %>
<p>
    <label>Instituci&oacute;n</label>
    <span id="span_institucionrevista" class="valor"><%=Html.Encode(Model.RevistaPublicacionInstitucionNombre)%>&nbsp;</span>
</p>
<p>
    <label>Pa&iacute;s</label>
    <span id="span_paisrevista" class="valor"><%=Html.Encode(Model.RevistaPublicacionPaisNombre)%>&nbsp;</span>
</p>
<p>
    <label>&Iacute;ndice 1</label>
    <span id="span_indice1revista" class="valor"><%=Html.Encode(Model.RevistaPublicacionIndice1Nombre)%>&nbsp;</span>
</p>
<p>
    <label>&Iacute;ndice 2</label>
    <span id="span_indice2revista" class="valor"><%=Html.Encode(Model.RevistaPublicacionIndice2Nombre)%>&nbsp;</span>
</p>
<p>
    <label>&Iacute;ndice 3</label>
    <span id="span_indice3revista" class="valor"><%=Html.Encode(Model.RevistaPublicacionIndice3Nombre)%>&nbsp;</span>
</p>