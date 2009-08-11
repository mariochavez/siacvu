<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<LibroForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<table class="subform">
    <tr>
        <td>
            <label>
                Nombre:<em>*</em></label>
        </td>
        <td>
            <%=Html.TextBox("Nombre", Model.Nombre, new { maxlength = 100 })%>
            <%=Html.ValidationMessage("Nombre")%>
        </td>
    </tr>
    <tr>
        <td>
            <label>
                Isbn:<em>*</em></label>
        </td>
        <td>
            <%=Html.TextBox("ISBN", Model.ISBN, new { maxlength = 100 })%>
            <%=Html.ValidationMessage("ISBN")%>
        </td>
    </tr>
    <tr>
        <td>
            <label>
                Editorial:<em>*</em></label>
        </td>
        <td>
            <%=Html.TextBox("Editorial", Model.Editorial, new { maxlength = 100 })%>
            <%=Html.ValidationMessage("Editorial")%>
        </td>
    </tr>
    <tr>
        <td>
            <label>
                Fecha Edicion:<em>*</em></label>
        </td>
        <td>
            <%=Html.TextBox("FechaEdicion", Model.FechaEdicion, new { @class="datetime", maxlength = 10 })%>
            <span class="helper_message">(Formato dd/mm/yyyy)</span>
            <%=Html.ValidationMessage("FechaEdicion")%>
        </td>
    </tr>
    <tr>
        <td>
            <label>
                Pais:<em>*</em></label>
        </td>
        <td>
            <%=Html.DropDownList("Pais", Model.Paises.CreateSelectList<PaisForm>("Id", "Nombre"),
								"Seleccione ...")%>
            <%=Html.ValidationMessage("Pais") %>
        </td>
    </tr>
    <tr>
        <td>
            <label>
                No Paginas:<em>*</em></label>
        </td>
        <td>
            <%=Html.TextBox("NoPaginas", Model.NoPaginas, new { maxlength = 100, size = 14 })%>
            <%=Html.ValidationMessage("NoPaginas")%>
        </td>
    </tr>
    <tr>
        <td>
            <label>
                Tiraje:<em>*</em></label>
        </td>
        <td>
            <%=Html.TextBox("Tiraje", Model.Tiraje, new { maxlength = 100 })%>
            <%=Html.ValidationMessage("Tiraje")%>
        </td>
    </tr>
    <tr>
        <td>
            <label>
                Idioma:<em>*</em></label>
        </td>
        <td>
            <%=Html.DropDownList("Idioma", Model.Idiomas.CreateSelectList<IdiomaForm>("Id", "Nombre"),
								"Seleccione ...")%>
            <%=Html.ValidationMessage("Idioma") %>
        </td>
    </tr>
</table>
