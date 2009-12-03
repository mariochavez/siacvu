<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ShowFieldsForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<% if(Model.RevistaPublicacionId != 0){ %>
    $('#span_institucionrevista').html('<%=Html.Encode(Model.RevistaPublicacionInstitucionNombre)%>&nbsp;');
    $('#span_paisrevista').html('<%=Html.Encode(Model.RevistaPublicacionPaisNombre)%>&nbsp;');
    $('#span_indice1revista').html('<%=Html.Encode(Model.RevistaPublicacionIndice1Nombre)%>&nbsp;');
    $('#span_indice2revista').html('<%=Html.Encode(Model.RevistaPublicacionIndice2Nombre)%>&nbsp;');
    $('#span_indice3revista').html('<%=Html.Encode(Model.RevistaPublicacionIndice3Nombre)%>&nbsp;');
<% } else { %>
    $('#span_institucionrevista').html('&nbsp;');
    $('#span_paisrevista').html('&nbsp;');
    $('#span_indice1revista').html('&nbsp;');
    $('#span_indice2revista').html('&nbsp;');
    $('#span_indice3revista').html('&nbsp;');
<% } %>