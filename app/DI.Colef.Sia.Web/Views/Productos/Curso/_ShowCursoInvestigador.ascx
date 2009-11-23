<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CursoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Nombre del curso</label>
    <span class="valor"><%= Html.Encode(Model.CursoInvestigador.Nombre) %>&nbsp;</span>
</p>
<p>
    <label>Programa de estudio</label>
    <span class="valor"><%= Html.Encode(Model.CursoInvestigador.ProgramaEstudioNombre) %>&nbsp;</span>
</p>
<p>
    <label>Instituci&oacute;n</label>
    <span class="valor"><%= Html.Encode(Model.CursoInvestigador.InstitucionNombre) %>&nbsp;</span>
</p>
<p>
    <label>Fecha inicial</label>
    <span class="valor"><%= Html.Encode(Model.CursoInvestigador.FechaInicial) %>&nbsp;</span>
</p>
<p>
    <label>Fecha final</label>
    <span class="valor"><%= Html.Encode(Model.CursoInvestigador.FechaFinal) %>&nbsp;</span>
</p>
<p>
    <label>N&uacute;mero de horas</label>
    <span class="valor"><%= Html.Encode(Model.CursoInvestigador.NumeroHoras) %>&nbsp;</span>
</p>