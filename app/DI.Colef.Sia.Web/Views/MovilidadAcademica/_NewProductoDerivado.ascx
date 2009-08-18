<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<MovilidadAcademicaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Producto Derivado</label>
    
	<%=Html.DropDownList("ProductoDerivadoMovilidadAcademica.ProductoDerivado", Model.ProductosDerivados.CreateSelectList<ProductoDerivadoForm>("Id", "Nombre"),
                "Seleccione ...", new { rel = "#productoderivado" })%>
	<%=Html.ValidationMessage("ProductoDerivadoMovilidadAcademica.ProductoDerivado") %>
</p>
