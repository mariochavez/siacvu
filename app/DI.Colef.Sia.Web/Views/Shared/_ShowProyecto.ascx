﻿<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ShowFieldsForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<% if(!Model.IsShowForm){ %>
    <p>
        <label>Nombre del proyecto de investigaci&oacute;n</label>
        <%=Html.TextBox("ProyectoNombre", Model.ProyectoNombre,
            new { @class = "autocomplete buscar-requerido", url = Url.Action("Search", "Proyecto"), maxlength = 300 })%>
        <%=Html.Hidden("ProyectoId", Model.ProyectoId, new { rel = "#ProyectoNombre" })%>
        <%=Html.ValidationMessage("ProyectoNombre")%>
    </p>
<% } else { %>
    <p>
        <label>Nombre del proyecto de investigaci&oacute;n</label>
        <span class="valor"><%= Html.Encode(Model.ProyectoNombre)%>&nbsp;</span>
    </p>
<% } %>