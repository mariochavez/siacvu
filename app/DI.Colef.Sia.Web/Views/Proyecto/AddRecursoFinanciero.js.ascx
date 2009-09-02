<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<RecursoFinancieroProyectoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <div class="sublista" id="recursofinanciero_<%=Html.Encode(Model.Id) %>">
        <h6>
            <%=Html.Encode(Model.InstitucionNombre) %>
            <span><%=Html.Encode(Model.Recurso) %></span>
            <span><%=Html.Encode(Model.Monto) %></span>
            <span><%=Html.Encode(Model.MonedaNombre) %></span>
        </h6>
	</div><!--end sublista-->
';

$('#message').html('');
$('#message').removeClass('errormessage');

$('#recursofinanciero_form').hide();
$('#recursofinanciero_new').show();
$('#recursofinanciero_form').html('');
$('#recursofinancieroEmptyList_form').html('');
$('#recursofinancieroList div:first').before(html);

$('#recursofinanciero_' + <%=Html.Encode(Model.Id) %> + ':first').hide();
$('#recursofinanciero_' + <%=Html.Encode(Model.Id) %> + ':first').fadeIn('slow');

setupSublistRows();