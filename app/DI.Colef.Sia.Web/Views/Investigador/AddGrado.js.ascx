<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<GradoAcademicoInvestigadorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <tr id="grado_<%=Html.Encode(Model.Id) %>">
        <td class="subform">
            <%=Html.Encode(Model.GradoAcademicoNombre) %> <span class="more_info"><%=Html.Encode(Model.Fecha)%>, Area: <%=Html.Encode(Model.AreaInvestigacion)%></span>
            <div class="meta_info"><%=Html.Encode(Model.Descripcion.Substring(0, Model.Descripcion.Length < 40 ? Model.Descripcion.Length : 40))%></div>
        </td>
    </tr>
';

$('#message').html('');
$('#message').removeClass('errormessage');

$('#grado_form').hide();
$('#grado_new').show();
$('#grado_form').html('');
$('#gradoList tr:first').after(html);

$('#grado_' + <%=Html.Encode(Model.Id) %> + ':first').hide();
$('#grado_' + <%=Html.Encode(Model.Id) %> + ':first').fadeIn('slow');
