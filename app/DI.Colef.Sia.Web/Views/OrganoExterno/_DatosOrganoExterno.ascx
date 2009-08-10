<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<OrganoExternoForm>" %>
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
		    <label>Siglas:</label>
		    <br />
		    <%=Html.TextBox("Siglas", Model.Siglas, new { maxlength = 100 })%>
		    <%=Html.ValidationMessage("Siglas")%>
        </td>
    </tr>
    <tr>
        <td class="label">
		    <label>Tipo Organo:</label>
		    <br />
		    <%=Html.DropDownList("TipoOrgano", Model.TiposOrganos.CreateSelectList<TipoOrganoForm>("Id", "Nombre"),
				    "Seleccione ...")%>
		    <%=Html.ValidationMessage("TipoOrgano") %>
        </td>
        <td class="label">
		    <label>Tipo Participacion:</label>
		    <br />
		    <%=Html.DropDownList("TipoParticipacion", Model.TiposParticipaciones.CreateSelectList<TipoParticipacionForm>("Id", "Nombre"),
				    "Seleccione ...")%>
		    <%=Html.ValidationMessage("TipoParticipacion") %>
        </td>
    </tr>
    <tr>
        <td class="label">
		    <label>Sector:</label>
		    <br />
		    <%=Html.DropDownList("Sector", Model.Sectores.CreateSelectList<SectorForm>("Id", "Nombre"),
				    "Seleccione ...")%>
		    <%=Html.ValidationMessage("Sector") %>
        </td>
        <td class="label">
		    <label>Nivel:</label>
		    <br />
		    <%=Html.DropDownList("Nivel", Model.Niveles.CreateSelectList<NivelForm>("Id", "Nombre"),
				    "Seleccione ...")%>
		    <%=Html.ValidationMessage("Nivel") %>
        </td>
    </tr> 
    <tr>
        <td class="label">
		    <label>Fecha Inicial:</label>
		    <br />
		    <%=Html.TextBox("FechaInicial", Model.FechaInicial, new { @class="datetime", maxlength = 10 })%>
            <span class="helper_message">(Formato dd/mm/yyyy)</span>
            <%=Html.ValidationMessage("FechaInicial")%>
        </td>
        <td class="label">
		    <label>Fecha Final:</label>
		    <br />
		    <%=Html.TextBox("FechaFinal", Model.FechaFinal, new { @class="datetime", maxlength = 10 })%>
            <span class="helper_message">(Formato dd/mm/yyyy)</span>
            <%=Html.ValidationMessage("FechaFinal")%>
        </td>
    </tr>
    <tr>
        <td class="label">
		    <label>Ambito:</label>
		    <br />
		    <%=Html.DropDownList("Ambito", Model.Ambitos.CreateSelectList<AmbitoForm>("Id", "Nombre"),
				    "Seleccione ...")%>
		    <%=Html.ValidationMessage("Ambito") %>
        </td>
    </tr>
</table>
