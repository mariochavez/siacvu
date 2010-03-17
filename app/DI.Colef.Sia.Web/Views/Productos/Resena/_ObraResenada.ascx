<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ResenaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Nombre del libro</label>
    <%=Html.TextBox("TituloLibro", Model.TituloLibro, new { @class = "input420", maxlength = 100 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("TituloLibro")%>
</p>

<h4>Autor(es) del libro</h4>
<% Html.RenderPartial("_AddButtons", new ShowFieldsForm { ModelId = Model.Id, CheckboxName = "AutorSeOrdenaAlfabeticamente", CheckboxValue = Model.CoautorSeOrdenaAlfabeticamente, Rel = "NewAutorInternoLink, NewAutorExternoLink", SubFormName = "autor", UrlActionExterno = "NewAutorExterno", UrlActionInterno = "NewAutorInterno", Link1Id = "NewAutorInternoLink", Link2Id = "NewAutorExternoLink" }); %>
<% Html.RenderPartial("_EditAutorInterno", new AutorForm { AutoresInternos = Model.AutorInternoResenas, ModelId = Model.Id, AutorSeOrdenaAlfabeticamente = Model.AutorSeOrdenaAlfabeticamente }); %>
<% Html.RenderPartial("_EditAutorExterno", new AutorForm { AutoresExternos = Model.AutorExternoResenas, ModelId = Model.Id, AutorSeOrdenaAlfabeticamente = Model.AutorSeOrdenaAlfabeticamente }); %>
<% Html.RenderPartial("_AutorEmptyListMessage", new AutorForm { AutoresExternos = Model.AutorExternoResenas, AutoresInternos = Model.AutorInternoResenas }); %>
<%--<p>
    <label>Investigador</label>
    <span class="valor"><%=Html.Encode(Model.InvestigadorNombre) %></span>
</p>
<p id="AutorSeOrdenaAlfabeticamente_field">
    <label>Posici&oacute;n del autor</label>
    <%=Html.TextBox("PosicionAutor", Model.PosicionAutor, new { @class = "input100-requerido", maxlength = 2 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("PosicionAutor")%>
</p>
<p>
    <label>Total de investigadores</label>
    <span id="totalautores" class="valor"><%=Html.Encode(Model.TotalAutores) %></span>
    <span class="cvu"></span>
</p>--%>
<p></p>

<% Html.RenderPartial("_EditEditorial", Model); %>
    
<p>
    <label>Pa&iacute;s</label>
    <%=Html.DropDownList("Pais", Model.Paises.CreateSelectList<PaisForm>("Id", "Nombre"),
        "Seleccione ...")%>
    <%=Html.ValidationMessage("Pais") %>
</p>