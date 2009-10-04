<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CapituloForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var lineaAreaTematica ='
    <p>
        <label>L&iacute;nea tem&aacute;tica</label>
        <%=Html.Encode(Model.ProyectoLineaTematicaNombre)%>&nbsp;
    </p>
    <p>
        <label>&Aacute;rea tem&aacute;tica</label>
        <%=Html.Encode(Model.ProyectoAreaTematicaNombre)%>&nbsp;
    </p>
';

$('#arealineatematica').html('');
<% if (Model.ProyectoId != 0){ %>
    $('#arealineatematica').html(lineaAreaTematica);
    <% if (Model.ProyectoLineaTematicaNombre == "" && Model.ProyectoAreaTematicaNombre == ""){%>
        $('#arealineatematica').html('');
<%     }
   } %>