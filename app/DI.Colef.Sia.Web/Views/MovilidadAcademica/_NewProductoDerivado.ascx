<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<MovilidadAcademicaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<table class="subform">                       
    <tr>
        <td class="label">
            <label>Producto Derivado</label>
            <br />
			<%=Html.DropDownList("ProductoDerivadoMovilidadAcademica.ProductoDerivado", Model.ProductosDerivados.CreateSelectList<ProductoDerivadoForm>("Id", "Nombre"),
			"Seleccione ...")%>
			<%=Html.ValidationMessage("ProductoDerivadoMovilidadAcademica.ProductoDerivado") %>
        </td>
    </tr>              
</table>
