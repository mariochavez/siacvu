<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ShowFieldsForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<% if(Model.InstitucionId != 0){ %>
    $('#span_ciudad').html('<%=Html.Encode(Model.InstitucionCiudad)%>&nbsp;');
    $('#span_estado').html('<%=Html.Encode(Model.InstitucionEstadoPaisNombre)%>&nbsp;');
    $('#span_pais').html('<%=Html.Encode(Model.InstitucionPaisNombre)%>&nbsp;');
    $('#span_tipoinstitucion').html('<%=HumanizeHelper.TipoInstitucion(Model.InstitucionTipoInstitucionNombre)%>&nbsp;');
<% } else { %>
    $('#span_ciudad').html('&nbsp;');
    $('#span_estado').html('&nbsp;');
    $('#span_pais').html('&nbsp;');
    $('#span_tipoinstitucion').html('&nbsp;');
<% } %>