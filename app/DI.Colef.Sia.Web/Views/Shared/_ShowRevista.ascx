<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ShowFieldsForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<% if(!Model.IsShowForm){ %>
    <p>
        <label><%= Html.Encode(Model.RevistaLabel) %></label>
        <%=Html.TextBox("RevistaPublicacionTitulo", Model.RevistaPublicacionTitulo,
            new { @class = "autocomplete buscar-requerido", url = Url.Action(Model.UrlAction, "RevistaPublicacion"), rel = Model.Rel, maxlength = 100 }) %>
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
    <label>Clasificaci&oacute;n 1</label>
    <span id="span_indice1revista" class="valor"><%=Html.Encode(Model.RevistaPublicacionIndice1Nombre)%>&nbsp;</span>
</p>
<p>
    <label>Clasificaci&oacute;n 2</label>
    <span id="span_indice2revista" class="valor"><%=Html.Encode(Model.RevistaPublicacionIndice2Nombre)%>&nbsp;</span>
</p>
<p>
    <label>Clasificaci&oacute;n 3</label>
    <span id="span_indice3revista" class="valor"><%=Html.Encode(Model.RevistaPublicacionIndice3Nombre)%>&nbsp;</span>
</p>