<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CapituloForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <% using (Html.BeginForm("AddResponsableExterno", "Capitulo", FormMethod.Post, new { id = "responsableexternoform" }))
       { %>
    <%=Html.Hidden("CapituloId", Model.Id)%>
    <% Html.RenderPartial("_NewResponsableExterno"); %>
    <div class="btn_container_footer">
        <span class="btn btn_small_brown">
            <%=Html.SubmitButton("Guardar", "Agregar Responsable Externo", new { rel = "#responsableexternoform", @class = "remote", @style = "border: 0px none;" })%>
        </span>
        
	        <a href="#" class="cancel" rel="responsableexterno">Cancelar</a>
        </span>
    </div>
    <% } %>
';

$('#responsableexterno_form').html(html);
$('#responsableexterno_new').hide();
$('#responsableexterno_form').show();
DateTimePicker.setup();
