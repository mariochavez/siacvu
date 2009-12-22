<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<OrganoInternoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<p>
    <label>Invstigador interno</label>
    <%=Html.TextBox("AutorInterno.Nombre", "",
        new { @class = "autocomplete buscar-requerido", rel = Url.Action("Search", "Investigador"), maxlength = 100 })%>
    <%=Html.Hidden("AutorInterno.InvestigadorId", 0, new { rel = "#AutorInterno_Nombre" })%>
    <%=Html.ValidationMessage("AutorInterno.Nombre")%>
</p>
<p>
    <label>Consejo o Comisi&oacute;n</label>
    <%=Html.DropDownList("ConsejoComision", Model.ConsejosComisiones.CreateSelectList<ConsejoComisionForm>("Id", "Nombre"),
        "Seleccione ...", new { @class = "requerido" })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("ConsejoComision") %>
</p>
<p>
    <label>Fecha inicial</label>
    <%=Html.TextBox("FechaInicial", Model.FechaInicial, new { @class = "datetime input100-requerido", maxlength = 10 })%>
    <span>(Formato dd/mm/yyyy)</span>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("FechaInicial")%>
</p>
<p>
    <label>Fecha final</label>
    <%=Html.TextBox("FechaFinal", Model.FechaFinal, new { @class = "datetime input100-requerido", maxlength = 10 })%>
    <span>(Formato dd/mm/yyyy)</span>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("FechaFinal")%>
</p>
<p id="periodo_field">
    <label>Periodo</label>
    <%=Html.DropDownList("Periodo", Model.Periodos.CreateSelectList<CustomSelectForm>("Id", "Nombre"),
        "Seleccione ...", new { @class = "requerido" })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("Periodo")%>
</p>