<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ShowFieldsForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<h4>Actividad econ&oacute;mica</h4>
<% if(!Model.IsShowForm){ %>
    <p>
        <label>Sector econ&oacute;mico</label>
        <%=Html.DropDownList("SectorEconomicoId", Model.SectoresEconomicos.CreateSelectList<SectorForm>("Id", "Nombre"),
            "Seleccione ...", new { @class = "cascade", rel = Url.Action("ChangeSectorEconomico") })%>
        <span class="cvu"></span>
        <%=Html.ValidationMessage("SectorEconomicoId")%>
    </p>
    <p>
        <label>Rama</label>
        <%=Html.DropDownList("RamaId", Model.Ramas.CreateSelectList<RamaForm>("Id", "Nombre"),
            "Seleccione ...", new { @class = "cascade", rel = Url.Action("ChangeRama") })%>
        <span class="cvu"></span>
        <%=Html.ValidationMessage("RamaId")%>
    </p>
    <p>
        <label>Clase</label>
        <%=Html.DropDownList("ClaseId", Model.Clases.CreateSelectList<ClaseForm>("Id", "Nombre"),
            "Seleccione ...")%>
        <span class="cvu"></span>
        <%=Html.ValidationMessage("ClaseId")%>
    </p>
<% } else { %>
    <p>
        <label>Sector econ&oacute;mico</label>
        <span class="valor"><%= Html.Encode(Model.ClaseRamaSectorNombre)%>&nbsp;</span>
    </p>
    <p>
        <label>Rama</label>
        <span class="valor"><%= Html.Encode(Model.ClaseRamaNombre)%>&nbsp;</span>
    </p>
    <p>
        <label>Clase</label>
        <span class="valor"><%= Html.Encode(Model.ClaseNombre)%>&nbsp;</span>
    </p>
<% } %>