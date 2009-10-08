<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ArticuloForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<% if (Model.RevistaPublicacionId != 0){ %>
    $('#indice1').html('<%=Html.Encode(Model.RevistaPublicacionIndice1Nombre)%>&nbsp;');
    $('#indice2').html('<%=Html.Encode(Model.RevistaPublicacionIndice2Nombre)%>&nbsp;');
    $('#indice3').html('<%=Html.Encode(Model.RevistaPublicacionIndice3Nombre)%>&nbsp;');
<% } %>