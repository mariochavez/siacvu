<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ArticuloForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<p>
    <label>
        Pais:<em>*</em></label>
    <%=Html.DropDownList("Pais", Model.Paises.CreateSelectList<PaisForm>("Id", "Nombre"),
                "Seleccione ...")%>
    <%=Html.ValidationMessage("Pais") %>
</p>
<p>
    <label>
        Volumen:<em>*</em></label>
    <%=Html.TextBox("Volumen", Model.Volumen, new { maxlength = 100 })%>
    <%=Html.ValidationMessage("Volumen")%>
</p>
<p>
    <label>
        Numero:<em>*</em></label>
    <%=Html.TextBox("Numero", Model.Numero, new { maxlength = 100 })%>
    <%=Html.ValidationMessage("Numero")%>
</p>
<p>
    <label>Pagina Inicial:<em>*</em></label> 
    <%=Html.TextBox("PaginaInicial", Model.PaginaInicial, new { maxlength = 10, size = 14 })%>
    <%=Html.ValidationMessage("PaginaInicial")%>
</p>
<p>    
    <label>Pagina Final:<em>*</em></label>
    <%=Html.TextBox("PaginaFinal", Model.PaginaFinal, new { maxlength = 10, size = 14 })%>
    <%=Html.ValidationMessage("PaginaFinal")%>
</p>
<p>
    <label>
        Revista Publicacion:<em>*</em></label>
    <%=Html.DropDownList("RevistaPublicacion", Model.RevistasPublicaciones.CreateSelectList<RevistaPublicacionForm>("Id", "Titulo"),
                "Seleccione ...")%>
    <%=Html.ValidationMessage("RevistaPublicacion") %>
</p>
<p>
    <label>
        Institucion:<em>*</em></label>
    <%=Html.DropDownList("Institucion", Model.Instituciones.CreateSelectList<InstitucionForm>("Id", "Nombre"),
                "Seleccione ...")%>
    <%=Html.ValidationMessage("Institucion") %>
</p>
<p>
    <label>
        Indice 1:<em>*</em></label>
    <%=Html.DropDownList("Indice1", Model.Indices1.CreateSelectList<IndiceForm>("Id", "Nombre"),
	                "Seleccione ...")%>
    <%=Html.ValidationMessage("Indice1")%>
</p>
<p>
    <label>
        Indice 2:<em>*</em></label>
    <%=Html.DropDownList("Indice2", Model.Indices2.CreateSelectList<IndiceForm>("Id", "Nombre"),
	                "Seleccione ...")%>
    <%=Html.ValidationMessage("Indice2")%>
</p>
<p>
    <label>
        Indice 3:<em>*</em></label>
    <%=Html.DropDownList("Indice3", Model.Indices3.CreateSelectList<IndiceForm>("Id", "Nombre"),
	                "Seleccione ...")%>
    <%=Html.ValidationMessage("Indice3")%>
</p>
<p>
    <label>
        Fecha Edicion:<em>*</em></label>    
    <%=Html.TextBox("FechaEdicion", Model.FechaEdicion, new { @class="datetime", maxlength = 10 })%>
    <span class="helper_message">(Formato dd/mm/yyyy)</span>
    <%=Html.ValidationMessage("FechaEdicion")%>
</p>
