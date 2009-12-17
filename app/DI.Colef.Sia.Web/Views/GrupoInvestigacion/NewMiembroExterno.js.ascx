<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<MiembroExternoGrupoInvestigacionForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var cssclass = 'remote';
var rel = '#miembroexternoform';

var html = '
    <% using (Html.BeginForm("AddMiembroExterno", "GrupoInvestigacion", FormMethod.Post, new { id = "miembroexternoform" }))
       { %>
    <%=Html.Hidden("GrupoInvestigacionId", Model.Id)%>
    <% Html.RenderPartial("_NewMiembroExterno"); %>
    <div class="minilistaboton">
        <p>
            <span>
                <%=Html.SubmitButton("Guardar", "Agregar miembro externo", new { rel = "' + rel + '", @class = "' + cssclass + '", @style = "border: 0px none;" })%>
            </span> &oacute; <a href="#" class="cancel minilistacancelar" rel="miembroexterno">Cancelar</a>
        </p>
    </div>
    <% } %>
';

$('#miembroexternoForm').html(html);
$('#miembroexternoNew').hide();
$('#miembroexternoForm').show();
DateTimePicker.setup();
