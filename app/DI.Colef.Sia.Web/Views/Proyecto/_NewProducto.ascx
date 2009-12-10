<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ProyectoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Producto generado</label>
	<%=Html.DropDownList("ProductoGenerado.ProductoGenerado", Model.ProductosGenerados.CreateSelectList<CustomSelectForm>("Id", "Nombre"),
                    "Seleccione ...", new { @class = "requerido" })%>
	<%=Html.ValidationMessage("ProductoGenerado.ProductoGenerado")%>
</p>
<p>
    <label>Fecha de entrega</label>
    <%=Html.TextBox("ProductoGenerado.FechaEntrega", "", new { @class = "datetime input100-requerido", maxlength = 10 })%>
    <span>(Formato dd/mm/yyyy)</span>
    <%=Html.ValidationMessage("ProductoGenerado.FechaEntrega")%>
</p>