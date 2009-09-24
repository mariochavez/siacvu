<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<div id="caja-archivos">
    <p>
        <label>Nombre del archivo</label>
        <%=Html.TextBox("Nombre")%>
    </p>
    <p>
        <label>Tipo de archivo</label>
        <%=Html.DropDownList("TipoArchivo", "Seleccione ...")%>
        <%=Html.ValidationMessage("TipoArchivo")%>
    </p>
</div>
