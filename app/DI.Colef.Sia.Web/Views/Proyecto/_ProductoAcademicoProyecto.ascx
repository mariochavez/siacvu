<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ProyectoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<p>
    <label>Producto acad&eacute;mico</label>
    <%=Html.DropDownList("ProductoAcademico", Model.ProductosAcademicos.CreateSelectList<ProductoAcademicoForm>("Id", "Nombre"),
                "Seleccione ...")%>
    <%=Html.ValidationMessage("ProductoAcademico")%>
</p>
<p>
    <label>Actividad prevista</label>
    <%=Html.DropDownList("ActividadPrevista", Model.ActividadesPrevistas.CreateSelectList<ActividadPrevistaForm>("Id", "Nombre"),
                "Seleccione ...")%>
    <%=Html.ValidationMessage("ActividadPrevista")%>
</p>
<p>
    <label>Fecha de entrega</label>
    <%=Html.TextBox("FechaEntregaProducto", Model.FechaEntregaProducto, new { @class = "datetime input100", maxlength = 10 })%>
    <span>(Formato dd/mm/yyyy)</span>
    <%=Html.ValidationMessage("FechaEntregaProducto")%>
</p>