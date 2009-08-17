<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CapituloForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<p>
    <label>Forma de Participaci&oacute;n</label>
    <%=Html.DropDownList("FormaParticipacion", Model.FormasParticipaciones.CreateSelectList<FormaParticipacionForm>("Id", "Nombre"),
			    "Seleccione ...")%>
    <%=Html.ValidationMessage("FormaParticipacion") %>
</p>
