<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<InstitucionForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var cssclass = 'remote';
var rel = '#institucionform';

var html = '
    <% using (Html.BeginForm("AddInstitucion", Model.Controller, FormMethod.Post, new { id = "institucionform" })){ %>
    <%=Html.Hidden(Model.IdName, Model.Id)%>
    <% Html.RenderPartial("_NewInstitucion"); %>
    <div class="minilistaboton">
        <p>
            <span>
                <%=Html.SubmitButton("Guardar", "Agregar institución", new { rel = "' + rel + '", @class = "' + cssclass + '", @style = "border: 0px none;" })%>
            </span> &oacute; <a href="#" class="cancel minilistacancelar" rel="institucion">Cancelar</a>
        </p>
    </div>
    <% } %>
';

$('#institucionForm').html(html);
$('#institucionNew').hide();
$('#institucionForm').show();
AutoComplete.config($('#Institucion_Nombre'));