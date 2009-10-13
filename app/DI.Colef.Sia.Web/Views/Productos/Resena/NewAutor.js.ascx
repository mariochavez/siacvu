<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ResenaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var cssclass = 'remote';
var rel = '#autorresenaform';

var html = '
    <% using (Html.BeginForm("AddAutor", "Resena", FormMethod.Post, new { id = "autorresenaform" })){ %>
    <%=Html.Hidden("ResenaId", Model.Id)%>
    <% Html.RenderPartial("_NewAutor"); %>
    <div class="minilistaboton">
        <p>
            <span>
                <%=Html.SubmitButton("Guardar", "Agregar autor", new { rel = "' + rel + '", @class = "' + cssclass + '", @style = "border: 0px none;" })%>
            </span> &oacute; <a href="#" class="cancel minilistacancelar" rel="autorresena">Cancelar</a>
        </p>
    </div>
    <% } %>
';

$('#autorresenaForm').html(html);
$('#autorresenaNew').hide();
$('#autorresenaForm').show();