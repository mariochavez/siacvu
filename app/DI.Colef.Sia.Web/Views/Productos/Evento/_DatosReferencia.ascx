<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<EventoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Fecha del evento</label>
	<%=Html.TextBox("FechaEvento", Model.FechaEvento, new { @class = "datetime input100-requerido", maxlength = 10 })%>
    <span>(Formato dd/mm/yyyy)</span>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("FechaEvento")%>
</p>
<p>
    <label>Lugar(Ciudad/Estado)</label>
	<%=Html.TextBox("Lugar", Model.Lugar, new { @class = "input420-requerido", maxlength = 100 })%>
	<%=Html.ValidationMessage("Lugar")%>
</p>
<p>
    <label>Pa&iacute;s</label>
	<%=Html.DropDownList("Pais", Model.Paises.CreateSelectList<PaisForm>("Id", "Nombre"),
                        "Seleccione ...", new { @class = "requerido" })%>
	<%=Html.ValidationMessage("Pais")%>
</p>