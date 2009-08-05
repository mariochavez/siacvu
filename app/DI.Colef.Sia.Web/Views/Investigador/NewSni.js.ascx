<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<InvestigadorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <% using (Html.BeginForm("AddSni", "Investigador", FormMethod.Post, new { id = "sniform" })) { %>
    <%=Html.Hidden("InvestigadorId", Model.Id) %>
    <% Html.RenderPartial("_NewSni"); %>
    <div class="btn_container_footer">
        <span class="btn btn_small_brown">
            <%=Html.SubmitButton("Guardar", "Agregar sni", new { rel = "#sniform", @class = "remote", @style = "border: 0px none;" })%>
        </span>
        <span class="btn btn_small_white">
	        <a href="#" class="cancel" rel="sni">Cancelar</a>
        </span>
    </div>
    <% } %>
';

$('#sni_form').html(html);
$('#sni_new').hide();
$('#sni_form').show();
DateTimePicker.setup();
