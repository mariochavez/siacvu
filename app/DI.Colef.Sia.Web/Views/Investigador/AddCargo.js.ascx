<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CargoInvestigadorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var deleteUrl = '<%=Url.Action("DeleteCargo", null, new {id = Model.Id, investigadorId = 1000000 }) %>';
deleteUrl = deleteUrl.replace(/1000000/i, $('#Id').val());

var html = '
    <div id="cargo_<%=Html.Encode(Model.Id) %>" class="sublista">
        <h6>
        <a href="' + deleteUrl + '" class="remote delete"><img src="<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>" /></a>
        <%=Html.Encode(Model.PuestoNombre)%> <span><%=Html.Encode(Model.SedeNombre)%></span></h6>
        <span><%=Html.Encode(Model.DepartamentoNombre)%>, <%=Html.Encode(Model.SedeDireccionRegionalNombre) %></span>
    </div><!--end estadolista-->
';

$('#message').html('');
$('#message').removeClass('errormessage');

$('#cargoForm').hide();
$('#cargoNew').show();
$('#cargoForm').html('');
$('#cargoList div:first').before(html);

$('#cargo_' + <%=Html.Encode(Model.Id) %> + ':first').hide();
$('#cargo_' + <%=Html.Encode(Model.Id) %> + ':first').fadeIn('slow');

setupSublistRows();
