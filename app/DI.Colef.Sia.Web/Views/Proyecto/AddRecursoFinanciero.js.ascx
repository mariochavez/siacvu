<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<RecursoFinancieroProyectoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var counter = $('#recursofinancieroList div[id^=recursofinanciero_]').length;

var html = '
    <div class="sublista" id="recursofinanciero_<%=Html.Encode(Model.Id) %>">
        <h6>
            <a href="<%=Url.Action("DeleteRecursoFinanciero", null, new{ id = Model.ParentId, recursoId = Model.Id, monto = Model.Monto, tipoMoneda = Model.MonedaId}) %>" class="remote delete"><img src="<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>" /></a>
            <%=Html.Encode(Model.InstitucionNombre)%>
            <%=Html.Hidden("RecursoFinanciero['  + counter + '].InstitucionId", Model.InstitucionId)%>
            <span>
                Monto <%=Html.Encode(Math.Round(Model.Monto, 2))%>
                <%=Html.Hidden("RecursoFinanciero['  + counter + '].Monto", Model.Monto)%>
                Moneda <%=Html.Encode(Model.MonedaNombre)%>
                <%=Html.Hidden("RecursoFinanciero['  + counter + '].Moneda", Model.MonedaId)%>
            </span>
        </h6>
	</div><!--end sublista-->
';

$('#mensaje-error').html('');
$('#mensaje-error').removeClass('mensaje-error');

$('#recursofinancieroForm').hide();
$('#recursofinancieroNew').show();
$('#recursofinancieroForm').html('');

$('#recursofinancieroEmptyListForm').html('');
$('#recursofinancieroList div:first').before(html);

$('#recursofinanciero_<%=Html.Encode(Model.Id)%>:first').hide();
$('#recursofinanciero_<%=Html.Encode(Model.Id)%>:first').fadeIn('slow');

if(<%=Html.Encode(Model.MonedaId)%> == 1){
    var pesos =  parseFloat($('#totalpesos').text()) + parseFloat(<%=Html.Encode(Model.Monto)%>);
    $('#totalpesos').text(Math.round(pesos*100)/100);
}
if(<%=Html.Encode(Model.MonedaId)%> == 2){
    var dolares =  parseFloat($('#totaldolares').text()) + parseFloat(<%=Html.Encode(Model.Monto)%>);
    $('#totaldolares').text(Math.round(dolares*100)/100);
}

setupSublistRows();