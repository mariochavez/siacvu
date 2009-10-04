<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ArticuloForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var indice123 ='
    <p>
        <label>&Iacute;ndice 1</label>
        <%= Html.Encode(Model.RevistaPublicacionIndice1Nombre)%>&nbsp;
    </p>
    <p>
        <label>&Iacute;ndice 2</label>
        <%= Html.Encode(Model.RevistaPublicacionIndice2Nombre)%>&nbsp;
    </p>
    <p>
        <label>&Iacute;ndice 3</label>
        <%= Html.Encode(Model.RevistaPublicacionIndice3Nombre)%>&nbsp;
    </p>
';

$('#indices').html('');
<% if (Model.RevistaPublicacionId != 0){ %>
    $('#indices').html(indice123);
    <% if (Model.RevistaPublicacionIndice1Nombre == "" && Model.RevistaPublicacionIndice2Nombre == "" && Model.RevistaPublicacionIndice2Nombre == ""){ %>
        $('#indices').html('');    
<%     }
   } %>