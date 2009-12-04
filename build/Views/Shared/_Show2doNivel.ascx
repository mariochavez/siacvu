<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ShowFieldsForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<h4>Estructura funcional</h4>
<% if(!Model.IsShowForm){ %>
    <p>
        <label>Sector</label>
        <%=Html.DropDownList("SectorId", Model.Sectores.CreateSelectList<SectorForm>("Id", "Nombre"),
            "Seleccione ...", new { @class = "cascade", rel = Url.Action("ChangeSector") })%>
        <span class="cvu"></span>
        <%=Html.ValidationMessage("SectorId")%>
    </p>
    <p>
        <label>Organizaci&oacute;n</label>
        <%=Html.DropDownList("OrganizacionId", Model.Organizaciones.CreateSelectList<OrganizacionForm>("Id", "Nombre"),
            "Seleccione ...", new { @class = "cascade", rel = Url.Action("ChangeOrganizacion") })%>
        <span class="cvu"></span>
        <%=Html.ValidationMessage("OrganizacionId")%>
    </p>
    <p>
        <label>2do Nivel</label>
        <%=Html.DropDownList("Nivel2Id", Model.Niveles.CreateSelectList<NivelForm>("Id", "Nombre"),
            "Seleccione ...")%>
        <span class="cvu"></span>
        <%=Html.ValidationMessage("Nivel2Id")%>
    </p>
<% } else { %>
    <p>
        <label>Sector</label>
        <span class="valor"><%= Html.Encode(Model.SectorNombre)%>&nbsp;</span>
    </p>
    <p>
        <label>Organizaci&oacute;n</label>
        <span class="valor"><%= Html.Encode(Model.OrganizacionNombre)%>&nbsp;</span>
    </p>
    <p>
        <label>2do. Nivel</label>
        <span class="valor"><%= Html.Encode(Model.Nivel2Nombre)%>&nbsp;</span>
    </p>
<% } %>