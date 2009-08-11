<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<MovilidadAcademicaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <% using (Html.BeginForm("AddProductoDerivado", "MovilidadAcademica", FormMethod.Post, new { id = "productoderivadoform" })){ %>
    <%=Html.Hidden("MovilidadAcademicaId", Model.Id) %>
    <% Html.RenderPartial("_NewProductoDerivado"); %>
    <div class="btn_container_footer">
        <span class="btn btn_small_brown">
            <%=Html.SubmitButton("Guardar", "Agregar Producto Derivado", new { rel = "#productoderivadoform", @class = "remote", @style = "border: 0px none;" })%>
        </span>
        <span class="btn btn_small_white">
	        <a href="#" class="cancel" rel="productoderivado">Cancelar</a>
        </span>
    </div>
    <% } %>
';

$('#productoderivado_form').html(html);
$('#productoderivado_new').hide();
$('#productoderivado_form').show();
DateTimePicker.setup();