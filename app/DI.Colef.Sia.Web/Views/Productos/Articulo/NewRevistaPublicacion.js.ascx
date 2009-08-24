<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ArticuloForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var cssclass = 'remote';
var rel = '#revistapublicacionform';

var html = '
    <% using (Html.BeginForm("AddRevistaPublicacion", "Articulo", FormMethod.Post, new { id = "revistapublicacionform" }))
       { %>
    <%=Html.Hidden("ArticuloId", Model.Id) %>
    <% Html.RenderPartial("_NewRevistaPublicacion"); %>
    <div class="minilistaboton">
        <p>
            <span>
                <%=Html.SubmitButton("Guardar", "Guardar Revista", new { rel = "' + rel + '", @class = "' + cssclass + '", @style = "border: 0px none;" })%>
            </span> &oacute; <a href="#" class="cancel minilistacancelar" rel="revistapublicacion">Cancelar</a>
        </p>
    </div>
    <% } %>
';

$('#revistapublicacion_form').html(html);
$('#revistapublicacion_new').hide();
$('#revistapublicacion_form').show();
