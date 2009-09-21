<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ProyectoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<div class="minilista">
    <h5>Actividad econ&oacute;mica</h5>
</div>
<p>
	<label>Sector econ&oacute;mico</label>
	<%=Html.DropDownList("SectorEconomico", Model.SectoresEconomicos.CreateSelectList<SectorForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "cascade", rel = Url.Action("ChangeSectorEconomico") })%>
	<span class="cvu"></span>
	<%=Html.ValidationMessage("SectorEconomico")%>
</p>
<p>
    <label>Rama</label>
    <%=Html.DropDownList("Rama", Model.Ramas.CreateSelectList<RamaForm>("Id", "Nombre"),
        "Seleccione ...", new { @class = "cascade", rel = Url.Action("ChangeRama") })%>
	<span class="cvu"></span>
    <%=Html.ValidationMessage("Rama") %>
</p>
<p>
    <label>Clase</label>
    <%=Html.DropDownList("Clase", Model.Clases.CreateSelectList<ClaseForm>("Id", "Nombre"),
	            "Seleccione ...")%>
	<span class="cvu"></span>
    <%=Html.ValidationMessage("Clase") %>
</p>