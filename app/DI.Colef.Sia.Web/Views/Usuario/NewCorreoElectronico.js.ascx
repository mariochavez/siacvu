<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<UsuarioForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <% using (Html.BeginForm("AddCorreoElectronico", "Usuario", FormMethod.Post, new { id = "correoelectronicoform" })) { %>
    <%=Html.Hidden("UsuarioId", Model.Id)%>
    <% Html.RenderPartial("_NewCorreoElectronico"); %>
    <div class="minilistaboton">
        <p>
            <span>
                <%=Html.SubmitButton("Guardar", "Agregar Correo electrónico", new { rel = "#correoelectronicoform", @class = "remote", @style = "border: 0px none;" })%>
            </span> &oacute; <a href="#" class="cancel minilistacancelar" rel="correoElectronico">Cancelar</a>
        </p>
    </div>
    <% } %>
';

$('#correoElectronicoForm').html(html);
$('#correoElectronicoNew').hide();
$('#correoElectronicoForm').show();
