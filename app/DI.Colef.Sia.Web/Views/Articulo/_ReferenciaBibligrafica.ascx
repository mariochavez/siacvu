<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ArticuloForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<table class="subform">
    <tr>
        <td class="label required">
            <label>Pais:<em>*</em></label>
            <br />
            <%=Html.DropDownList("Pais", Model.Paises.CreateSelectList<PaisForm>("Id", "Nombre"),
                "Seleccione ...")%>
            <%=Html.ValidationMessage("Pais") %>
        </td>
        <td class="label required">
            <label>Volumen:<em>*</em></label>
            <br />
            <%=Html.TextBox("Volumen", Model.Volumen, new { maxlength = 100 })%>
            <%=Html.ValidationMessage("Volumen")%>
        </td>
        <td class="label required">
            <label>Numero:<em>*</em></label>
            <br />
            <%=Html.TextBox("Numero", Model.Numero, new { maxlength = 100 })%>
            <%=Html.ValidationMessage("Numero")%>										
        </td>
    </tr>
    <tr>
        <td class="label required">
            <label>Pagina Inicial:<em>*</em></label>
            
            <label>Pagina Final:<em>*</em></label>
            <br />
            <%=Html.TextBox("PaginaInicial", Model.PaginaInicial, new { maxlength = 10, size = 14 })%>
            <%=Html.ValidationMessage("PaginaInicial")%>										
            -
            <%=Html.TextBox("PaginaFinal", Model.PaginaFinal, new { maxlength = 10, size = 14 })%>
            <%=Html.ValidationMessage("PaginaFinal")%>
        </td>
        <td class="label required">
            <label>Revista Publicacion:<em>*</em></label>
            <br />
            <%=Html.DropDownList("RevistaPublicacion", Model.RevistasPublicaciones.CreateSelectList<RevistaPublicacionForm>("Id", "Titulo"),
                "Seleccione ...")%>
            <%=Html.ValidationMessage("RevistaPublicacion") %>
        </td>
        <td class="label required">
            <label>Institucion:<em>*</em></label>
            <br />
            <%=Html.DropDownList("Institucion", Model.Instituciones.CreateSelectList<InstitucionForm>("Id", "Nombre"),
                "Seleccione ...")%>
            <%=Html.ValidationMessage("Institucion") %>
        </td>
    </tr>	
    <tr>
        <td class="label required">
            <label>Indice 1:<em>*</em></label>
            <br />
            <%=Html.DropDownList("Indice1", Model.Indices1.CreateSelectList<IndiceForm>("Id", "Nombre"),
	                "Seleccione ...")%>
            <%=Html.ValidationMessage("Indice1")%>
        </td>
        <td class="label required">
            <label>Indice 2:<em>*</em></label>
            <br />
            <%=Html.DropDownList("Indice2", Model.Indices2.CreateSelectList<IndiceForm>("Id", "Nombre"),
	                "Seleccione ...")%>
            <%=Html.ValidationMessage("Indice2")%>				
        </td>
        <td class="label required">
            <label>Indice 3:<em>*</em></label>
            <br />
            <%=Html.DropDownList("Indice3", Model.Indices3.CreateSelectList<IndiceForm>("Id", "Nombre"),
	                "Seleccione ...")%>
            <%=Html.ValidationMessage("Indice3")%>				
        </td>
    </tr>
    <tr>
        <td class="label required">
            <label>Fecha Edicion:<em>*</em></label>
            <br />
            <%=Html.TextBox("FechaEdicion", Model.FechaEdicion, new { @class="datetime", maxlength = 10 })%>
            <span class="helper_message">(Formato dd/mm/yyyy)</span>
            <%=Html.ValidationMessage("FechaEdicion")%>
        </td>
        <td class="label required">
            <label>Coautor Externo Articulos:<em>*</em></label>
            <br />
            <%=Html.DropDownList("CoautorExternoArticulo.InvestigadorExterno", Model.CoautoresExternos.CreateSelectList<InvestigadorExternoForm>("Id", "Nombre"),
                "Seleccione ...")%>
            <%=Html.ValidationMessage("CoautorExternoArticulo.InvestigadorExterno")%>
        </td>
        <td class="label required">
            <label>Coautor Interno Articulos:<em>*</em></label>
            <br />
            <%=Html.DropDownList("CoautorInternoArticulo.Investigador", Model.CoautoresInternos.CreateSelectList<InvestigadorForm>("Id", "Nombre"),
                "Seleccione ...")%>
            <%=Html.ValidationMessage("CoautorInternoArticulo.Investigador")%>
        </td>
    </tr>
</table>
