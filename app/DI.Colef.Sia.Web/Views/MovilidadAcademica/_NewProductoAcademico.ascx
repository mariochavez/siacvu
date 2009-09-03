<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<MovilidadAcademicaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Producto acad&eacute;mico</label>
    
	<%=Html.DropDownList("ProductoAcademicoMovilidadAcademica.ProductoAcademicoId", Model.ProductosAcademicos.CreateSelectList<ProductoAcademicoForm>("Id", "Nombre"),
        "Seleccione ...", new { rel = "#productoacademico" })%>
	<%=Html.ValidationMessage("ProductoAcademicoMovilidadAcademica.ProductoAcademicoId")%>
</p>
