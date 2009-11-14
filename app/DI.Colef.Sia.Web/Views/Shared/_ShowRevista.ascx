<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ShowFieldsForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Instituci&oacute;n</label>
    <span class="valor"><%=Html.Encode(Model.RevistaPublicacionInstitucionNombre)%>&nbsp;</span>
</p>
<p>
    <label>Pa&iacute;s</label>
    <span class="valor"><%=Html.Encode(Model.RevistaPublicacionPaisNombre)%>&nbsp;</span>
</p>