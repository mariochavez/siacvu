<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ResenaForm>" %>
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
showMessage('Reseña <%=Html.Encode(Model.NombreRevista) %> ha sido <%if(Model.Activo) { %> activada. <% } else { %> desactivada. <% } %>');
