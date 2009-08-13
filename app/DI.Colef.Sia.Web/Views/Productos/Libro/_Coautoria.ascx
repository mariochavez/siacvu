<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<LibroForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<p>
    <label>
        Forma Participacion:</label>
    <%=Html.DropDownList("FormaParticipacion", Model.FormasParticipaciones.CreateSelectList<FormaParticipacionForm>("Id", "Nombre"),
								"Seleccione ...")%>
    <%=Html.ValidationMessage("FormaParticipacion") %>
</p>
