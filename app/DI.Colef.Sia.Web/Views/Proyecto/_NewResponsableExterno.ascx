<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ProyectoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<table class="subform">
    <tr>
        <td class="label">
            <label>Responsable Interno</label>
            <br />
			<%=Html.DropDownList("ResponsableInternoProyecto.ResponsableInterno", Model.ResponsablesInternos.CreateSelectList<ResponsableInternoForm>("Id", "Nombre"),
			"Seleccione ...")%>
			<%=Html.ValidationMessage("ResponsableInternoProyecto.ResponsableInterno") %>
        </td>
    </tr>                            
    <tr>
        <td class="label">
            <label>Responsable Externo</label>
            <br />
			<%=Html.DropDownList("ResponsableExternoProyecto.ResponsableExterno", Model.ResponsablesExternos.CreateSelectList<ResponsableExternoForm>("Id", "Nombre"),
			"Seleccione ...")%>
			<%=Html.ValidationMessage("ResponsableExternoProyecto.ResponsableExterno") %>
        </td>
    </tr>                            
    <tr>
        <td class="label">
            <label>Participante Interno</label>
            <br />
			<%=Html.DropDownList("ParticipanteInternoProyecto.ParticipanteInterno", Model.ParticipantesInternos.CreateSelectList<ParticipanteInternoForm>("Id", "Nombre"),
			"Seleccione ...")%>
			<%=Html.ValidationMessage("ParticipanteInternoProyecto.ParticipanteInterno") %>
        </td>
    </tr>                            
    <tr>
        <td class="label">
            <label>Participante Externo</label>
            <br />
			<%=Html.DropDownList("ParticipanteExternoProyecto.ParticipanteExterno", Model.ParticipantesExternos.CreateSelectList<ParticipanteExternoForm>("Id", "Nombre"),
			"Seleccione ...")%>
			<%=Html.ValidationMessage("ParticipanteExternoProyecto.ParticipanteExterno") %>
        </td>
    </tr>                            
</table>
