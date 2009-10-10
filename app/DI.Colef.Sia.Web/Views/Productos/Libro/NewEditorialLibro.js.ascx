<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<LibroForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var cssclass = 'remote';
var rel = '#editoriallibroform';

var html = '
    <% using (Html.BeginForm("AddEditorial", "Libro", FormMethod.Post, new { id = "editoriallibroform" })){ %>
    <%=Html.Hidden("LibroId", Model.Id)%>
    <% Html.RenderPartial("_NewEditorialLibro"); %>
    <div class="minilistaboton">
        <p>
            <span>
                <%=Html.SubmitButton("Guardar", "Agregar editorial", new { rel = "' + rel + '", @class = "' + cssclass + '", @style = "border: 0px none;" })%>
            </span> &oacute; <a href="#" class="cancel minilistacancelar" rel="editoriallibro">Cancelar</a>
        </p>
    </div>
    <% } %>
';

$('#editoriallibroForm').html(html);
$('#editoriallibroNew').hide();
$('#editoriallibroForm').show();
