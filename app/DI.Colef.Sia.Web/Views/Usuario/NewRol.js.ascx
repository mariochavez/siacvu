<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<UsuarioForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <% using (Html.BeginForm("AddRol", "Usuario", FormMethod.Post, new { id = "rolform" })) { %>
    <%=Html.Hidden("UsuarioId", Model.Id)%>
    <% Html.RenderPartial("_NewRol"); %>
    <div class="minilistaboton">
        <p>
            <span>
                <%=Html.SubmitButton("Guardar", "Agregar Rol", new { rel = "#rolform", @class = "remote", @style = "border: 0px none;" })%>
            </span> &oacute; <a href="#" class="cancel minilistacancelar" rel="rol">Cancelar</a>
        </p>
    </div>
    <% } %>
';

$('#rolForm').html(html);
$('#rolNew').hide();
$('#rolForm').show();