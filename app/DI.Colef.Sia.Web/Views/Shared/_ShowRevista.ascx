<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ShowFieldsForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Instituci&oacute;n</label>
    <strong><%=Html.Encode(Model.RevistaPublicacionInstitucionNombre)%>&nbsp;</strong>
</p>
<p>
    <label>Pa&iacute;s</label>
    <strong><%=Html.Encode(Model.RevistaPublicacionPaisNombre)%>&nbsp;</strong>
</p>