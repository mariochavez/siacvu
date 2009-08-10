<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<FormacionAcademicaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<table class="subform">
    <tr>
        <td class="label">
            <label>Nivel Estudio:<em>*</em></label>
            <br />
            <%=Html.DropDownList("NivelEstudio", Model.NivelesEstudios.CreateSelectList<NivelEstudioForm>("Id", "Nombre"),
                "Seleccione ...")%>
            <%=Html.ValidationMessage("NivelEstudio") %>
        </td>
        <td class="label">
            <label>Numero Cedula:<em>*</em></label>
            <br />
            <%=Html.TextBox("NumeroCedula", Model.NumeroCedula, new { maxlength = 10, size = 14 })%>
            <%=Html.ValidationMessage("NumeroCedula")%>
        </td>
    </tr>
    <tr>
        <td class="label">
            <label>Titulo Grado:<em>*</em></label>
            <br />
            <%=Html.TextBox("TituloGrado", Model.TituloGrado, new { maxlength = 100 })%>
            <%=Html.ValidationMessage("TituloGrado")%>
        </td>
        <td class="label">
            <label>Fecha Obtencion:<em>*</em></label>
            <br />
            <%=Html.TextBox("FechaObtencion", Model.FechaObtencion, new { @class="datetime", maxlength = 10 })%>
            <span class="helper_message">(Formato dd/mm/yyyy)</span>
            <%=Html.ValidationMessage("FechaObtencion")%>
        </td>
    </tr>
    <tr>
        <td class="label">
            <label>Institucion:<em>*</em></label>
            <br />
            <%=Html.DropDownList("Institucion", Model.Instituciones.CreateSelectList<InstitucionForm>("Id", "Nombre"),
                "Seleccione ...")%>
            <%=Html.ValidationMessage("Institucion") %>
        </td>
        <td class="label">
            <label>Titulo Tesis:<em>*</em></label>
            <br />
            <%=Html.TextBox("TituloTesis", Model.TituloTesis, new { maxlength = 100 })%>
            <%=Html.ValidationMessage("TituloTesis")%>
        </td>
    </tr> 
    
    <tr>
        <td class="label">
            <label>Linea Tematica:<em>*</em></label>
            <br />
            <%=Html.DropDownList("LineaTematica", Model.LineasTematicas.CreateSelectList<LineaTematicaForm>("Id", "Nombre"),
                "Seleccione ...")%>
            <%=Html.ValidationMessage("LineaTematica") %>
        </td>
        <td class="label">
            <label>Pais:<em>*</em></label>
            <br />
            <%=Html.DropDownList("Pais", Model.Paises.CreateSelectList<PaisForm>("Id", "Nombre"),
                "Seleccione ...")%>
            <%=Html.ValidationMessage("Pais") %>
        </td>
    </tr> 
    
    <tr>
        <td class="label">
            <label>Estado Pais:<em>*</em></label>
            <br />
            <%=Html.DropDownList("EstadoPais", Model.EstadosPaises.CreateSelectList<EstadoPaisForm>("Id", "Nombre"),
                "Seleccione ...")%>
            <%=Html.ValidationMessage("EstadoPais") %>
        </td>
        <td class="label">
            <label>Ciudad:<em>*</em></label>
            <br />
            <%=Html.TextBox("Ciudad", Model.Ciudad, new { maxlength = 100 })%>
            <%=Html.ValidationMessage("Ciudad")%>
        </td>
    </tr> 
</table>
