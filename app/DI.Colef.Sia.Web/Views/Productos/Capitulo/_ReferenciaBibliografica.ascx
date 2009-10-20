<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CapituloForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<p>
    <label>Nombre del libro</label>
    <%=Html.TextBox("NombreLibro", Model.NombreLibro, new { @class = "input420-requerido", maxlength = 100 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("NombreLibro")%>
</p>
<p>
    <label>Autor del libro</label>
    <%=Html.TextBox("AutorLibro", Model.AutorLibro, new { @class = "input420", maxlength = 100 })%>
    <%=Html.ValidationMessage("AutorLibro")%>
</p>
<p>
    <label>Resumen</label>
    <%=Html.TextArea("Resumen", Model.Resumen, 3, 35, new { @class = "input420", maxlength = 500 })%>
    <span class="cvu"></span>
</p>
<p>
    <label>Editorial</label>
    <%=Html.DropDownList("Editorial", Model.Editoriales.CreateSelectList<EditorialForm>("Id", "Nombre"),
                        "Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("Editorial")%>
</p>
<p>
    <label>Volumen</label>
    <%=Html.DropDownList("Volumen", Model.Volumenes.CreateSelectList<CustomSelectForm>("Id", "Nombre"),
                        "Seleccione ...")%>
    <%=Html.ValidationMessage("Volumen")%>
    <span class="cvu"></span>
</p>
<p>
    <label>A&ntilde;o de edici&oacute;n</label>
    <%=Html.TextBox("FechaEdicion", Model.FechaEdicion, new { @class = "input100-requerido", maxlength = 4 })%>
    <span>(Formato yyyy)</span>
    <%=Html.ValidationMessage("FechaEdicion")%>
</p>
<p>
    <label>Pa&iacute;s</label>
    <%=Html.DropDownList("Pais", Model.Paises.CreateSelectList<PaisForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "requerido"})%>
    <%=Html.ValidationMessage("Pais") %>
</p>
<p>
    <label>No. de p&aacute;ginas</label>
    <%=Html.TextBox("NoPaginas", Model.NoPaginas, new { @class = "input100-requerido", maxlength = 4 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("NoPaginas")%>
</p>