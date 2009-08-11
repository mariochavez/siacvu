<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<EventoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<table class="subform">
    <tr>
        <td class="label">
		    <label>Nombre:<em>*</em></label>
		    <br />
			<%=Html.TextBox("Nombre", Model.Nombre, new { maxlength = 100 })%>
			<%=Html.ValidationMessage("Nombre")%>
        </td>
        <td class="label">
		    <label>Ambito:<em>*</em></label>
		    <br />
			<%=Html.DropDownList("Ambito", Model.Ambitos.CreateSelectList<AmbitoForm>("Id", "Nombre"),
				    "Seleccione ...")%>
			<%=Html.ValidationMessage("Ambito") %>
        </td>
    </tr>
    <tr>
        <td class="label">
		    <label>Tipo Evento:<em>*</em></label>
		    <br />
			<%=Html.DropDownList("TipoEvento", Model.TiposEventos.CreateSelectList<TipoEventoForm>("Id", "Nombre"),
				    "Seleccione ...")%>
			<%=Html.ValidationMessage("TipoEvento") %>
        </td>
        <td class="label">
		    <label>Titulo:<em>*</em></label>
		    <br />
			<%=Html.TextBox("Titulo", Model.Titulo, new { maxlength = 100 })%>
			<%=Html.ValidationMessage("Titulo")%>
        </td>
    </tr>
    <tr>
        <td class="label" colspan="2">
		    <label>Invitacion:<em>*</em></label>
		    <br />
	        <%= Html.CheckBox("Invitacion", Model.Invitacion) %>
	        <%=Html.ValidationMessage("Invitacion")%>
        </td>
    </tr>
</table>
