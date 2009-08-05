<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ArticuloForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<table class="subform">
    <tr>
        <td class="label required">
            <label>Linea de Investigacion personal:<em>*</em></label>
            <br />
            <%=Html.DropDownList("LineaInvestigacion", Model.LineasInvestigaciones.CreateSelectList<LineaInvestigacionForm>("Id", "Nombre"),
                "Seleccione ...")%>
            <%=Html.ValidationMessage("LineaInvestigacion") %>
        </td>
        <td class="label required">
            <label>Tipo de Actividad:<em>*</em></label>
            <br />
            <%=Html.DropDownList("TipoActividad", Model.TiposActividades.CreateSelectList<TipoActividadForm>("Id", "Nombre"),
                "Seleccione ...")%>
            <%=Html.ValidationMessage("TipoActividad") %>
        </td>
        <td class="label required">
            <label>Tipo de Participante:<em>*</em></label>
            <br />
            <%=Html.DropDownList("TipoParticipante", Model.TiposParticipantes.CreateSelectList<TipoParticipanteForm>("Id", "Nombre"),
                "Seleccione ...")%>
            <%=Html.ValidationMessage("TipoParticipante") %>
        </td>
    </tr>
    <tr>
        <td class="label required">
            <label>Participantes:<em>*</em></label>
            <br />
            <%=Html.TextBox("Participantes", Model.Participantes, new { maxlength = 5, size = 5 })%>
            <%=Html.ValidationMessage("Participantes")%>
        </td>
        <td class="label required">
            <label>Palabras Claves:<em>*</em></label>
            <br />
            <%=Html.TextBox("PalabrasClaves", Model.PalabrasClaves, new { maxlength = 100 })%>
            <%=Html.ValidationMessage("PalabrasClaves")%>
        </td>
        <td class="label required">
            <label>Area:<em>*</em></label>
            <br />
            <%=Html.DropDownList("Area", Model.Areas.CreateSelectList<AreaForm>("Id", "Nombre"),
                "Seleccione ...")%>
            <%=Html.ValidationMessage("Area") %>
        </td>
    </tr>
    <tr>
        <td class="label required">
            <label>Disciplina:<em>*</em></label>
            <br />
            <%=Html.DropDownList("Disciplina", Model.Disciplinas.CreateSelectList<DisciplinaForm>("Id", "Nombre"),
                "Seleccione ...")%>
            <%=Html.ValidationMessage("Disciplina") %>
        </td>
        <td class="label required">
            <label>Subdisciplina:<em>*</em></label>
            <br />
            <%=Html.DropDownList("Subdisciplina", Model.Subdisciplinas.CreateSelectList<SubdisciplinaForm>("Id", "Nombre"),
                "Seleccione ...")%>
            <%=Html.ValidationMessage("Subdisciplina") %>
        </td>
        <td class="label required">
            <label>Fecha Publicacion:<em>*</em></label>
            <br />
            <%=Html.TextBox("FechaPublicacion", Model.FechaPublicacion, new { @class="datetime", maxlength = 10 })%>
            <span class="helper_message">(Formato dd/mm/yyyy)</span>
            <%=Html.ValidationMessage("FechaPublicacion")%>
        </td>
    </tr>
</table>