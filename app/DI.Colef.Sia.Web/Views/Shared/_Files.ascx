<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ArchivoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<div id="caja-archivos">
    <p>
        <label>Archivo</label>
        <%=Html.TextBox("Nombre", Model.Nombre, new { @class = "input250-requerido"})%>
    </p>
    <p>
        <label>Tipo de archivo</label>
        <%=Html.DropDownList("TipoArchivo", Model.TipoArchivos.CreateSelectList<TipoArchivoForm>("Id", "Nombre"), 
            "Seleccione ...", new { @class = "requerido"})%>
        <%=Html.ValidationMessage("TipoArchivo")%>
    </p>
</div>
