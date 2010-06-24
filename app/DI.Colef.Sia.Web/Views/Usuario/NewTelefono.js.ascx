<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<UsuarioForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <% using (Html.BeginForm("AddTelefono", "Usuario", FormMethod.Post, new { id = "telefonoform" })) { %>
    <%=Html.Hidden("UsuarioId", Model.Id)%>
    <% Html.RenderPartial("_NewTelefono"); %>
    <div class="minilistaboton">
        <p>
            <span>
                <%=Html.SubmitButton("Guardar", "Agregar Telefono", new { rel = "#telefonoform", @class = "remote", @style = "border: 0px none;" })%>
            </span> &oacute; <a href="#" class="cancel minilistacancelar" rel="telefono">Cancelar</a>
        </p>
    </div>
    <% } %>
';

$('#telefonoForm').html(html);
$('#telefonoNew').hide();
$('#telefonoForm').show();
