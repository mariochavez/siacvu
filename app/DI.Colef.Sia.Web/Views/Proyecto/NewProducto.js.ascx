<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ProyectoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var cssclass = 'remote';
var rel = '#productogeneradoform';

var html = '
    <% using (Html.BeginForm("AddProducto", "Proyecto", FormMethod.Post, new { id = "productogeneradoform" })){ %>
    <%=Html.Hidden("ProyectoId", Model.Id)%>
    <% Html.RenderPartial("_NewProducto"); %>
    <div class="minilistaboton" id="submit">
        <p>
            <span>
                <%=Html.SubmitButton("Guardar", "Agregar producto generado", new { rel = "' + rel + '", @class = "' + cssclass + '", @style = "border: 0px none;" })%>
            </span> &oacute; <a href="#" class="cancel minilistacancelar" rel="productogenerado">Cancelar</a>
        </p>
    </div>
    <% } %>
';

$('#productogeneradoForm').html(html);
$('#productogeneradoNew').hide();
$('#productogeneradoForm').show();
DateTimePicker.setup();
