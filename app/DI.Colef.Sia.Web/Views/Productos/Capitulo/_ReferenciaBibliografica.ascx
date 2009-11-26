<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CapituloForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<p>
    <label>Nombre del libro</label>
    <%=Html.TextBox("NombreLibro", Model.NombreLibro, new { @class = "input420-requerido", maxlength = 100 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("NombreLibro")%>
</p>

<h4>Autor(es) del libro</h4>
<% Html.RenderPartial("_EditAutorInterno", new AutorForm { AutoresInternos = Model.AutorInternoCapitulos, ModelId = Model.Id }); %>
<% Html.RenderPartial("_EditAutorExterno", new AutorForm { AutoresExternos = Model.AutorExternoCapitulos, ModelId = Model.Id } ); %>

<p>
    <label>Tipo de libro</label>
    <%=Html.DropDownList("TipoLibro", Model.TiposLibro.CreateSelectList<CustomSelectForm>("Id", "Nombre"),
                        "Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("TipoLibro")%>
</p>
<p>
    <label>Editorial(es)</label>
    <%=Html.DropDownList("Editorial", Model.Editoriales.CreateSelectList<EditorialForm>("Id", "Nombre"),
                        "Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("Editorial")%>
</p>
<p>
    <label>Resumen</label>
    <%=Html.TextArea("Resumen", Model.Resumen, 3, 35, new { @class = "input420", maxlength = 500 })%>
    <span class="cvu"></span>
</p>
<p>
    <label>Volumen</label>
    <%=Html.TextBox("Volumen", Model.Volumen, new { @class = "input100-requerido", maxlength = 4 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("Volumen")%>
</p>
<p>
    <label>No. de p&aacute;ginas</label>
    <%=Html.TextBox("NoPaginas", Model.NoPaginas, new { @class = "input100-requerido", maxlength = 4 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("NoPaginas")%>
</p>
<p>
    <label>No. de citas</label>
    <%=Html.TextBox("NoCitas", Model.NoCitas, new { @class = "input100-requerido", maxlength = 4 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("NoCitas")%>
</p>