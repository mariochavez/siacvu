<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ArticuloForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<table class="subform">
    <tr>
        <td class="label">
            <label>Pais:<em>*</em></label>
            <br />
            <%=Html.DropDownList("Pais", Model.Paises.CreateSelectList<PaisForm>("Id", "Nombre"),
                "Seleccione ...")%>
            <%=Html.ValidationMessage("Pais") %>
        </td>
        <td class="label">
            <label>Volumen:<em>*</em></label>
            <br />
            <%=Html.TextBox("Volumen", Model.Volumen, new { maxlength = 100 })%>
            <%=Html.ValidationMessage("Volumen")%>
        </td>
    </tr>
    <tr>
        <td class="label">
            <label>Numero:<em>*</em></label>
            <br />
            <%=Html.TextBox("Numero", Model.Numero, new { maxlength = 100 })%>
            <%=Html.ValidationMessage("Numero")%>										
        </td>
        <td class="label">
            <label>Pagina Inicial:<em>*</em></label>
            
            <label>Pagina Final:<em>*</em></label>
            <br />
            <%=Html.TextBox("PaginaInicial", Model.PaginaInicial, new { maxlength = 10, size = 14 })%>
            <%=Html.ValidationMessage("PaginaInicial")%>										
            -
            <%=Html.TextBox("PaginaFinal", Model.PaginaFinal, new { maxlength = 10, size = 14 })%>
            <%=Html.ValidationMessage("PaginaFinal")%>
        </td>
    </tr>
    <tr>
        <td class="label">
            <label>Revista Publicacion:<em>*</em></label>
            <br />
            <%=Html.DropDownList("RevistaPublicacion", Model.RevistasPublicaciones.CreateSelectList<RevistaPublicacionForm>("Id", "Titulo"),
                "Seleccione ...")%>
            <%=Html.ValidationMessage("RevistaPublicacion") %>
        </td>
        <td class="label">
            <label>Institucion:<em>*</em></label>
            <br />
            <%=Html.DropDownList("Institucion", Model.Instituciones.CreateSelectList<InstitucionForm>("Id", "Nombre"),
                "Seleccione ...")%>
            <%=Html.ValidationMessage("Institucion") %>
        </td>
    </tr>	
    <tr>
        <td class="label">
            <label>Indice 1:<em>*</em></label>
            <br />
            <%=Html.DropDownList("Indice1", Model.Indices1.CreateSelectList<IndiceForm>("Id", "Nombre"),
	                "Seleccione ...")%>
            <%=Html.ValidationMessage("Indice1")%>
        </td>
        <td class="label">
            <label>Indice 2:<em>*</em></label>
            <br />
            <%=Html.DropDownList("Indice2", Model.Indices2.CreateSelectList<IndiceForm>("Id", "Nombre"),
	                "Seleccione ...")%>
            <%=Html.ValidationMessage("Indice2")%>				
        </td>
    </tr>
    <tr>
        <td class="label">
            <label>Indice 3:<em>*</em></label>
            <br />
            <%=Html.DropDownList("Indice3", Model.Indices3.CreateSelectList<IndiceForm>("Id", "Nombre"),
	                "Seleccione ...")%>
            <%=Html.ValidationMessage("Indice3")%>				
        </td>
        <td class="label">
            <label>Fecha Edicion:<em>*</em></label>
            <br />
            <%=Html.TextBox("FechaEdicion", Model.FechaEdicion, new { @class="datetime", maxlength = 10 })%>
            <span class="helper_message">(Formato dd/mm/yyyy)</span>
            <%=Html.ValidationMessage("FechaEdicion")%>
        </td>
    </tr>
</table>
