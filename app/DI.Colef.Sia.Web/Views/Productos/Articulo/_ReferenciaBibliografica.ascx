<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ArticuloForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<p>
    <label>Pa&iacute;s</label>
    <%=Html.DropDownList("Pais", Model.Paises.CreateSelectList<PaisForm>("Id", "Nombre"),
                "Seleccione ...")%>
    <%=Html.ValidationMessage("Pais") %>
</p>
<p>
    <label>Volumen</label>
    <%=Html.TextBox("Volumen", Model.Volumen, new { @class = "input250-requerido", maxlength = 100 })%>
    <%=Html.ValidationMessage("Volumen")%>
</p>
<p>
    <label>Numero</label>
    <%=Html.TextBox("Numero", Model.Numero, new { @class = "input250-requerido", maxlength = 100 })%>
    <%=Html.ValidationMessage("Numero")%>
</p>
<p>
    <label>Pagina Inicial</label> 
    <%=Html.TextBox("PaginaInicial", Model.PaginaInicial, new { @class = "input250-requerido", maxlength = 10, size = 14 })%>
    <%=Html.ValidationMessage("PaginaInicial")%>
</p>
<p>    
    <label>Pagina Final</label>
    <%=Html.TextBox("PaginaFinal", Model.PaginaFinal, new { @class = "input250-requerido", maxlength = 10, size = 14 })%>
    <%=Html.ValidationMessage("PaginaFinal")%>
</p>
<p>
    <label>Revista Publicaci&oacute;n</label>
    <%=Html.DropDownList("RevistaPublicacion", Model.RevistasPublicaciones.CreateSelectList<RevistaPublicacionForm>("Id", "Titulo"),
                "Seleccione ...")%>
    <%=Html.ValidationMessage("RevistaPublicacion") %>
</p>
<p>
    <label>Instituci&oacute;n</label>
    <%=Html.DropDownList("Institucion", Model.Instituciones.CreateSelectList<InstitucionForm>("Id", "Nombre"),
                "Seleccione ...")%>
    <%=Html.ValidationMessage("Institucion") %>
</p>
<p>
    <label>Indice 1</label>
    <%=Html.DropDownList("Indice1", Model.Indices1.CreateSelectList<IndiceForm>("Id", "Nombre"),
	                "Seleccione ...")%>
    <%=Html.ValidationMessage("Indice1")%>
</p>
<p>
    <label>Indice 2</label>
    <%=Html.DropDownList("Indice2", Model.Indices2.CreateSelectList<IndiceForm>("Id", "Nombre"),
	                "Seleccione ...")%>
    <%=Html.ValidationMessage("Indice2")%>
</p>
<p>
    <label>Indice 3</label>
    <%=Html.DropDownList("Indice3", Model.Indices3.CreateSelectList<IndiceForm>("Id", "Nombre"),
	                "Seleccione ...")%>
    <%=Html.ValidationMessage("Indice3")%>
</p>
<p>
    <label>Fecha Edici&oacute;n</label>    
    <%=Html.TextBox("FechaEdicion", Model.FechaEdicion, new { @class = "datetime input100-requerido", maxlength = 10 })%>
    <span>(Formato dd/mm/yyyy)</span>
    <%=Html.ValidationMessage("FechaEdicion")%>
</p>
