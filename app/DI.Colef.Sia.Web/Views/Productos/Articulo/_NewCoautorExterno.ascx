<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ArticuloForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Coautor externo</label>
    <%=Html.TextBox("CoautorExternoArticulo.InvestigadorExternoNombre", Model.CoautorExternoArticulo.InvestigadorExternoNombre,
        new { @class = "autocomplete buscar-requerido", rel = Url.Action("Search", "#InvestigadorExterno"), maxlength = 100 })%>
    <%=Html.Hidden("CoautorExternoArticulo.InvestigadorExternoId", Model.CoautorExternoArticulo.InvestigadorExternoId, new { rel = "#InvestigadorExterno" })%>
    
    <%--<%=Html.DropDownList("CoautorExternoArticulo.InvestigadorExternoId", Model.CoautoresExternos.CreateSelectList<InvestigadorExternoForm>("Id", "Nombre"),
                "Seleccione ...", new { rel = "#coautorexterno", @class = "requerido" })%>
    <%=Html.ValidationMessage("CoautorExternoArticulo.InvestigadorExternoId")%>--%>
</p>
<p>
	<label>Instituci&oacute;n</label>
	<%=Html.TextBox("InstitucionNombre", Model.InstitucionNombre,
        new { @class = "autocomplete buscar-requerido", rel = Url.Action("Search", "Institucion"), maxlength = 100 })%>
    <%=Html.Hidden("InstitucionId", Model.InstitucionId, new { rel = "#InstitucionNombre" })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("InstitucionNombre")%>
</p>