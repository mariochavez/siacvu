<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CapituloForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Coautor externo</label>

    <%=Html.DropDownList("CoautorExternoCapitulo.InvestigadorExternoId", Model.CoautoresExternos.CreateSelectList<InvestigadorExternoForm>("Id", "Nombre"),
                "Seleccione ...", new { rel = "#coautorexterno" })%>
    <%=Html.ValidationMessage("CoautorExternoCapitulo.InvestigadorExternoId")%>
</p>
<p>
	<label>Instituci&oacute;n</label>
	<%=Html.TextBox("InstitucionNombre", Model.InstitucionNombre,
        new { @class = "autocomplete buscar-requerido", rel = Url.Action("Search", "Institucion"), maxlength = 100 })%>
    <%=Html.Hidden("InstitucionId", Model.InstitucionId, new { rel = "#InstitucionNombre" })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("InstitucionNombre")%>
</p>