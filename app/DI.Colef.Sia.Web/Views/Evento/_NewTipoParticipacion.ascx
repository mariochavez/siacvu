<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<EventoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<table class="subform">
    <tr>
        <td class="label">
            <label>Tipos Participaciones:<em>*</em></label>
            <br />
            <%=Html.DropDownList("TipoParticipacionEvento.TipoParticipacion", Model.TiposParticipaciones.CreateSelectList<TipoParticipacionForm>("Id", "Nombre"),
                "Seleccione ...")%>
            <%=Html.ValidationMessage("TipoParticipacionEvento.TipoParticipacion") %>
        </td>
    </tr>                            
</table>