<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<EventoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
<span>
<% if (Model.Activo) { %>
    
        <%=Html.ActionLink("Desactivar", "Deactivate", new { id = Model.Id }, new { @class = "remote put" })%>
    </span>
<% } else { %>
    
        <%=Html.ActionLink("Activar", "Activate", new { id = Model.Id }, new { @class = "remote put" })%>
    </span>
<% } %>
</div>
';

$('#accion_<%=Html.Encode(Model.Id) %>').html(html);
showMessage('Evento <%=Html.Encode(Model.Nombre) %> ha sido <%if(Model.Activo) { %> activado. <% } else { %> desactivado. <% } %>');
