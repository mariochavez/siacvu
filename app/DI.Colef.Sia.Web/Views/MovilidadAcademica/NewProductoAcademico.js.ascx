<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<MovilidadAcademicaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var cssclass = 'remote';
var rel = '#productoacademicoform';

<% if(Model.Id == 0) { %>
    cssclass = 'local';
    rel = '#ProductoAcademicoMovilidadAcademica.ProductoAcademicoId';
<% } %>

var html = '
    <% using (Html.BeginForm("AddProductoAcademico", "MovilidadAcademica", FormMethod.Post, new { id = "productoacademicoform" })){ %>
    <%=Html.Hidden("MovilidadAcademicaId", Model.Id) %>
    <% Html.RenderPartial("_NewProductoAcademico"); %>
    <div class="minilistaboton">
        <p>
            <span>
                <%=Html.SubmitButton("Guardar", "Agregar producto académico", new { rel = "' + rel + '", @class = "' + cssclass + '", @style = "border: 0px none;" })%>
            </span> &oacute; <a href="#" class="cancel minilistacancelar" rel="productoacademico">Cancelar</a>
        </p>
    </div>
    <% } %>
';

$('#productoacademico_form').html(html);
$('#productoacademico_new').hide();
$('#productoacademico_form').show();
DateTimePicker.setup();