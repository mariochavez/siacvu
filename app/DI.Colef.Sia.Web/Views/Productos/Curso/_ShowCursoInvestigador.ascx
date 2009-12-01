<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CursoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Programa de estudio</label>
    <span id="span_programaestudio" class="valor"><%= Html.Encode(Model.CursoInvestigador.ProgramaEstudioNombre) %>&nbsp;</span>
</p>
<p>
    <label>Nivel de estudios</label>
    <span id="span_nivelestudio" class="valor"><%= Html.Encode(Model.CursoInvestigador.NivelEstudioNombre)%>&nbsp;</span>
</p>

<% Html.RenderPartial("_ShowInstitucionShort", Model.ShowFields); %>

<p>
    <label>Fecha de inicio</label>
    <span id="span_fechainicio" class="valor"><%= Html.Encode(Model.CursoInvestigador.FechaInicial) %>&nbsp;</span>
</p>
<p>
    <label>Fecha de fin</label>
    <span id="span_fechafin" class="valor"><%= Html.Encode(Model.CursoInvestigador.FechaFinal) %>&nbsp;</span>
</p>
<p>
    <label>N&uacute;mero de horas</label>
    <span id="span_numerohoras" class="valor"><%= Html.Encode(Model.CursoInvestigador.NumeroHoras) %>&nbsp;</span>
</p>

<% Html.RenderPartial("_Show2doNivel", Model.ShowFields); %>
<% Html.RenderPartial("_ShowSubdisciplina", Model.ShowFields); %>