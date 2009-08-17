<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<GradoAcademicoInvestigadorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <div id="grado_<%=Html.Encode(Model.Id) %>" class="sublista">
        <h6><%=Html.Encode(Model.GradoAcademicoNombre)%> <span><%=Html.Encode(Model.Fecha)%>, Area: <%=Html.Encode(Model.AreaInvestigacion)%></span></h6>
        <span><%=Html.Encode(Model.Descripcion.Substring(0, Model.Descripcion.Length < 40 ? Model.Descripcion.Length : 40))%></span>
    </div><!--end estadolista-->
';

$('#message').html('');
$('#message').removeClass('errormessage');

$('#grado_form').hide();
$('#grado_new').show();
$('#grado_form').html('');
$('#gradoList div:first').before(html);

$('#grado_' + <%=Html.Encode(Model.Id) %> + ':first').hide();
$('#grado_' + <%=Html.Encode(Model.Id) %> + ':first').fadeIn('slow');

setupSublistRows();
