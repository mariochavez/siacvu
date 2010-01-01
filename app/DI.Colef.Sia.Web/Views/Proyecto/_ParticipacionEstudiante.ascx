<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ProyectoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<p>
    <label></label>
    ¿Participan estudiantes? <%=Html.CheckBox("ParticipaEstudiante", Model.ParticipaEstudiante)%>
    <br /><label></label><span>(Marque en caso positivo)</span>
</p>