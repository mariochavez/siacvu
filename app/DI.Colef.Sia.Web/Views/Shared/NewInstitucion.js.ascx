<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<InstitucionForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var cssclass = 'remote';
var rel = '#institucionform';

var html = '
    <% using (Html.BeginForm("AddInstitucion", null, FormMethod.Post, new { id = "institucionform" })){ %>
    <%=Html.Hidden("modelId", Model.Id)%>
    <% Html.RenderPartial("_NewInstitucion"); %>
    <div class="minilistaboton" id="submit">
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
AutoComplete.config($('#Institucion_InstitucionNombre'));

$('#institucionForm').effect("highlight", {}, 1500);