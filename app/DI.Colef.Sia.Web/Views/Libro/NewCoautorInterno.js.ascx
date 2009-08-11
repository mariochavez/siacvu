<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<LibroForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <% using (Html.BeginForm("AddCoautorInterno", "Libro", FormMethod.Post, new { id = "coautorinternoform" })){ %>
    <%=Html.Hidden("LibroId", Model.Id) %>
    <% Html.RenderPartial("_NewCoautorInterno"); %>
    <div class="btn_container_footer">
        <span class="btn btn_small_brown">
            <%=Html.SubmitButton("Guardar", "Agregar Coautor Interno", new { rel = "#coautorinternoform", @class = "remote", @style = "border: 0px none;" })%>
        </span>
        <span class="btn btn_small_white">
	        <a href="#" class="cancel" rel="coautorinterno">Cancelar</a>
        </span>
    </div>
    <% } %>
';

$('#coautorinterno_form').html(html);
$('#coautorinterno_new').hide();
$('#coautorinterno_form').show();
DateTimePicker.setup();
