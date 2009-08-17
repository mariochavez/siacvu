<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CategoriaInvestigadorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <div id="categoria_<%=Html.Encode(Model.Id) %>" class="sublista">
        <h6><%=Html.Encode(Model.CategoriaNombre) %> <span><%=Html.Encode(Model.Fecha) %></span></h6>
    </div><!--end estadolista-->
';

$('#message').html('');
$('#message').removeClass('errormessage');

$('#categoria_form').hide();
$('#categoria_new').show();
$('#categoria_form').html('');
$('#categoriaList div:first').before(html);

$('#categoria_' + <%=Html.Encode(Model.Id) %> + ':first').hide();
$('#categoria_' + <%=Html.Encode(Model.Id) %> + ':first').fadeIn('slow');

setupSublistRows();