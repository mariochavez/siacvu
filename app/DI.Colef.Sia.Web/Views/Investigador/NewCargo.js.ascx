<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<InvestigadorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <% using (Html.BeginForm("AddCargo", "Investigador", FormMethod.Post, new { id = "cargoform" })) { %>
    <%=Html.Hidden("InvestigadorId", Model.Id) %>
    <% Html.RenderPartial("_NewCargo"); %>
    <div class="btn_container_footer">
        <span class="btn btn_small_brown">
            <%=Html.SubmitButton("Guardar", "Agregar Cargo", new { rel = "#cargoform", @class = "remote", @style = "border: 0px none;" })%>
        </span>
        <span class="btn btn_small_white">
	        <a href="#" class="cancel" rel="cargo">Cancelar</a>
        </span>
    </div>
    <% } %>
';

$('#cargo_form').html(html);
$('#cargo_new').hide();
$('#cargo_form').show();
DateTimePicker.setup();
