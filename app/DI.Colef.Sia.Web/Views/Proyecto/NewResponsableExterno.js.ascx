<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ProyectoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <% using (Html.BeginForm("AddResponsableInterno", "Proyecto", FormMethod.Post, new { id = "responsableinternoform" })){ %>
    <%=Html.Hidden("ProyectoId", Model.Id) %>
    <% Html.RenderPartial("_NewResponsableInterno"); %>
    <div class="btn_container_footer">
        <span class="btn btn_small_brown">
            <%=Html.SubmitButton("Guardar", "Agregar Responsable Interno", new { rel = "#responsableinternoform", @class = "remote", @style = "border: 0px none;" })%>
        </span>
        <span class="btn btn_small_white">
	        <a href="#" class="cancel" rel="responsableinterno">Cancelar</a>
        </span>
    </div>
    <% } %>
';

$('#responsableinterno_form').html(html);
$('#responsableinterno_new').hide();
$('#responsableinterno_form').show();
DateTimePicker.setup();
var html = '
    <% using (Html.BeginForm("AddResponsableExterno", "Proyecto", FormMethod.Post, new { id = "responsableexternoform" })){ %>
    <%=Html.Hidden("ProyectoId", Model.Id) %>
    <% Html.RenderPartial("_NewResponsableExterno"); %>
    <div class="btn_container_footer">
        <span class="btn btn_small_brown">
            <%=Html.SubmitButton("Guardar", "Agregar Responsable Externo", new { rel = "#responsableexternoform", @class = "remote", @style = "border: 0px none;" })%>
        </span>
        <span class="btn btn_small_white">
	        <a href="#" class="cancel" rel="responsableexterno">Cancelar</a>
        </span>
    </div>
    <% } %>
';

$('#responsableexterno_form').html(html);
$('#responsableexterno_new').hide();
$('#responsableexterno_form').show();
DateTimePicker.setup();
var html = '
    <% using (Html.BeginForm("AddParticipanteInterno", "Proyecto", FormMethod.Post, new { id = "participanteinternoform" })){ %>
    <%=Html.Hidden("ProyectoId", Model.Id) %>
    <% Html.RenderPartial("_NewParticipanteInterno"); %>
    <div class="btn_container_footer">
        <span class="btn btn_small_brown">
            <%=Html.SubmitButton("Guardar", "Agregar Participante Interno", new { rel = "#participanteinternoform", @class = "remote", @style = "border: 0px none;" })%>
        </span>
        <span class="btn btn_small_white">
	        <a href="#" class="cancel" rel="participanteinterno">Cancelar</a>
        </span>
    </div>
    <% } %>
';

$('#participanteinterno_form').html(html);
$('#participanteinterno_new').hide();
$('#participanteinterno_form').show();
DateTimePicker.setup();
var html = '
    <% using (Html.BeginForm("AddParticipanteExterno", "Proyecto", FormMethod.Post, new { id = "participanteexternoform" })){ %>
    <%=Html.Hidden("ProyectoId", Model.Id) %>
    <% Html.RenderPartial("_NewParticipanteExterno"); %>
    <div class="btn_container_footer">
        <span class="btn btn_small_brown">
            <%=Html.SubmitButton("Guardar", "Agregar Participante Externo", new { rel = "#participanteexternoform", @class = "remote", @style = "border: 0px none;" })%>
        </span>
        <span class="btn btn_small_white">
	        <a href="#" class="cancel" rel="participanteexterno">Cancelar</a>
        </span>
    </div>
    <% } %>
';

$('#participanteexterno_form').html(html);
$('#participanteexterno_new').hide();
$('#participanteexterno_form').show();
DateTimePicker.setup();
