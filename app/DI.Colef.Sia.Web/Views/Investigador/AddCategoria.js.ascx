<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CategoriaInvestigadorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var deleteUrl = '<%=Url.Action("DeleteCategoria", null, new {id = Model.Id, investigadorId = 1000000 }) %>';
deleteUrl = deleteUrl.replace(/1000000/i, $('#Id').val());

var html = '
    <div id="categoria_<%=Html.Encode(Model.Id) %>" class="sublista">
        <h6><a href="' + deleteUrl + '" class="remote delete"><img src="<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>" /></a>
        <%=Html.Encode(Model.CategoriaNombre) %> <span><%=Html.Encode(Model.FechaInicial)%> a <%=Html.Encode(Model.FechaFinal)%></span></h6>
    </div><!--end estadolista-->
';

$('#message').html('');
$('#message').removeClass('errormessage');

$('#categoriaForm').hide();
$('#categoriaNew').show();
$('#categoriaForm').html('');
$('#categoriaList div:first').before(html);

$('#categoria_' + <%=Html.Encode(Model.Id) %> + ':first').hide();
$('#categoria_' + <%=Html.Encode(Model.Id) %> + ':first').fadeIn('slow');

setupSublistRows();