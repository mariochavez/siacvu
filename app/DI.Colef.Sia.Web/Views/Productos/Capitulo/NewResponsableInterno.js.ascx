<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CapituloForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var class = 'remote';
var rel = '#responsableinternoform';

<% if(Model.Id == 0) { %>
    class = 'local';
    rel = '#ResponsableInternoCapitulo.InvestigadorId';
<% } %>

var html = '
    <% using (Html.BeginForm("AddResponsableInterno", "Capitulo", FormMethod.Post, new { id = "responsableinternoform" }))
       { %>
    <%=Html.Hidden("CapituloId", Model.Id)%>
    <% Html.RenderPartial("_NewResponsableInterno"); %>
    <div class="btn_container_footer">
        <span class="btn btn_small_brown">
            <%=Html.SubmitButton("Guardar", "Agregar Responsable Interno", new { rel = "' + rel + '", @class = "' + class + '", @style = "border: 0px none;" })%>
        </span>
        
	        <a href="#" class="cancel" rel="responsableinterno">Cancelar</a>
        </span>
    </div>
    <% } %>
';

$('#responsableinterno_form').html(html);
$('#responsableinterno_new').hide();
$('#responsableinterno_form').show();
DateTimePicker.setup();
