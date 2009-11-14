<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ShowFieldsForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>&Aacute;rea</label>
    <span class="valor"><%= Html.Encode(Model.SubdisciplinaDisciplinaAreaNombre)%>&nbsp;</span>
</p>
<p>
    <label>Disciplina</label>
    <span class="valor"><%= Html.Encode(Model.SubdisciplinaDisciplinaNombre)%>&nbsp;</span>
</p>
<p>
    <label>Subdisciplina</label>
    <span class="valor"><%= Html.Encode(Model.SubdisciplinaNombre)%>&nbsp;</span>
</p>