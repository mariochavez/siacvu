<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<InvestigadorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <% using (Html.BeginForm("AddGrado", "Investigador", FormMethod.Post, new { id = "gradoform" })) { %>
    <%=Html.Hidden("InvestigadorId", Model.Id) %>
    <% Html.RenderPartial("_NewGrado"); %>
    <div class="btn_container_footer">
        <span class="btn btn_small_brown">
            <%=Html.SubmitButton("Guardar", "Agregar grado", new { rel = "#gradoform", @class = "remote", @style = "border: 0px none;" })%>
        </span>
        <span class="btn btn_small_white">
	        <a href="#" class="cancel" rel="grado">Cancelar</a>
        </span>
    </div>
    <% } %>
';

$('#grado_form').html(html);
$('#grado_new').hide();
$('#grado_form').show();
DateTimePicker.setup();
