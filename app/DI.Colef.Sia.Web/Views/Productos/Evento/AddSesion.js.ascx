<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<SesionEventoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var counter = $('#sesionList div[id^=sesion_]').length;

var html = '
    <div class="sublista" id="sesion_<%=Html.Encode(Model.NombreSesion.Replace(" ", "_")) %>">
        <h6>
            <a href="<%=Url.Action("DeleteSesion", null, new{ id = Model.ParentId, nombreSesion = Model.NombreSesion.Replace(" ", "_")}) %>" class="remote delete"><img src="<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>" /></a>
            <%=Html.Encode(Model.NombreSesion)%>
            <%=Html.Hidden("Sesion['  + counter + '].NombreSesion", Model.NombreSesion)%>
            <span>
                Objetivo <%=Html.Encode(Model.ObjetivoSesion)%>
                <%=Html.Hidden("Sesion['  + counter + '].ObjetivoSesion", Model.ObjetivoSesion)%>
                &Aacute;mbito <%=Html.Encode(Model.AmbitoNombre)%>
                <%=Html.Hidden("Sesion['  + counter + '].Ambito", Model.AmbitoId)%>
                Fecha <%=Html.Encode(Model.FechaEvento)%>
                <%=Html.Hidden("Sesion['  + counter + '].FechaEvento", Model.FechaEvento)%>
                Lugar <%=Html.Encode(Model.Lugar)%>
                <%=Html.Hidden("Sesion['  + counter + '].Lugar", Model.Lugar)%>
            </span>
        </h6>
	</div><!--end sublista-->
';

$('#mensaje-error').html('');
$('#mensaje-error').removeClass('mensaje-error');

$('#sesionForm').hide();
$('#sesionNew').show();
$('#sesionForm').html('');

if($('#sesion_<%=Html.Encode(Model.NombreSesion.Replace(" ", "_"))%>').length == 0){
    $('#sesionEmptyListForm').html('');
    $('#sesionList div:first').before(html);
    
    $('#sesion_<%=Html.Encode(Model.NombreSesion.Replace(" ", "_"))%>:first').hide();
    $('#sesion_<%=Html.Encode(Model.NombreSesion.Replace(" ", "_"))%>:first').fadeIn('slow');
}

setupSublistRows();