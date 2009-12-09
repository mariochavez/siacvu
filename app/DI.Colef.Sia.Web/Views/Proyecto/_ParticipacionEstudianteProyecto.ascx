<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ProyectoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<p>
    <label>Participa estudiante</label>
    <%=Html.CheckBox("ParticipaEstudiante", Model.ParticipaEstudiante)%>
    <%=Html.ValidationMessage("ParticipaEstudiante")%>
</p>