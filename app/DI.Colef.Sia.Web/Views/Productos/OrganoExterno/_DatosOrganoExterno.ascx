<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<OrganoExternoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Nombre</label>
    <%=Html.TextBox("Nombre", Model.Nombre, new { @class = "input250-requerido", maxlength = 100 })%>
    <%=Html.ValidationMessage("Nombre")%>
</p>
<p>
    <label>Siglas</label>
    <%=Html.TextBox("Siglas", Model.Siglas, new { @class = "input250-requerido", maxlength = 100 })%>
    <%=Html.ValidationMessage("Siglas")%>
</p>
<p>
    <label>Tipo Organo</label>
    <%=Html.DropDownList("TipoOrgano", Model.TiposOrganos.CreateSelectList<TipoOrganoForm>("Id", "Nombre"),
		    "Seleccione ...")%>
    <%=Html.ValidationMessage("TipoOrgano") %>
</p>
<p>
    <label>Tipo Participacion</label>
    <%=Html.DropDownList("TipoParticipacion", Model.TiposParticipaciones.CreateSelectList<TipoParticipacionForm>("Id", "Nombre"),
		    "Seleccione ...")%>
    <%=Html.ValidationMessage("TipoParticipacion") %>
</p>
<p>
    <label>Sector</label>
    <%=Html.DropDownList("Sector", Model.Sectores.CreateSelectList<SectorForm>("Id", "Nombre"),
		    "Seleccione ...")%>
    <%=Html.ValidationMessage("Sector") %>
</p>
<p>
    <label>Nivel</label>
    <%=Html.DropDownList("Nivel", Model.Niveles.CreateSelectList<NivelForm>("Id", "Nombre"),
		    "Seleccione ...")%>
    <%=Html.ValidationMessage("Nivel") %>
</p>
<p>
    <label>Fecha Inicial</label>
    <%=Html.TextBox("FechaInicial", Model.FechaInicial, new { @class = "datetime input100-requerido", maxlength = 10 })%>
    <span>(Formato dd/mm/yyyy)</span>
    <%=Html.ValidationMessage("FechaInicial")%>
</p>
<p>
    <label>Fecha Final</label>
    <%=Html.TextBox("FechaFinal", Model.FechaFinal, new { @class = "datetime input100-requerido", maxlength = 10 })%>
    <span>(Formato dd/mm/yyyy)</span>
    <%=Html.ValidationMessage("FechaFinal")%>
</p>
<p>
    <label>Ambito</label>
    <%=Html.DropDownList("Ambito", Model.Ambitos.CreateSelectList<AmbitoForm>("Id", "Nombre"),
		    "Seleccione ...")%>
    <%=Html.ValidationMessage("Ambito") %>
</p>