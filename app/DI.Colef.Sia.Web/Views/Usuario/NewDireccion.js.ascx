<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<UsuarioForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <% using (Html.BeginForm("AddDireccion", "Usuario", FormMethod.Post, new { id = "direccionform" })) { %>
    <%=Html.Hidden("UsuarioId", Model.Id)%>
    <% Html.RenderPartial("_NewDireccion"); %>
    <div class="minilistaboton">
        <p>
            <span>
                <%=Html.SubmitButton("Guardar", "Agregar Dirección", new { rel = "#direccionform", @class = "remote", @style = "border: 0px none;" })%>
            </span> &oacute; <a href="#" class="cancel minilistacancelar" rel="direccion">Cancelar</a>
        </p>
    </div>
    <% } %>
';

$('#direccionForm').html(html);
$('#direccionNew').hide();
$('#direccionForm').show();
