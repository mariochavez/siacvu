<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ArticuloForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<% if (Model.RevistaPublicacionId != 0){ %>
    $('#institucion').html('<%=Html.Encode(Model.RevistaPublicacionInstitucionNombre)%>&nbsp;');
    $('#pais').html('<%=Html.Encode(Model.RevistaPublicacionPaisNombre)%>&nbsp;');
    $('#indice1').html('<%=Html.Encode(Model.RevistaPublicacionIndice1Nombre)%>&nbsp;');
    $('#indice2').html('<%=Html.Encode(Model.RevistaPublicacionIndice2Nombre)%>&nbsp;');
    $('#indice3').html('<%=Html.Encode(Model.RevistaPublicacionIndice3Nombre)%>&nbsp;');
<% } else { %>
    $('#institucion').html('&nbsp;');
    $('#pais').html('&nbsp;');
    $('#indice1').html('&nbsp;');
    $('#indice2').html('&nbsp;');
    $('#indice3').html('&nbsp;');
<% } %>