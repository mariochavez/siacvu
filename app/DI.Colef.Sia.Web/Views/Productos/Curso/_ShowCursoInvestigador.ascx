<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CursoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<% if(Model.Id == 0){ %>
    <p>
        <label>Nombre del curso</label>
        <%=Html.DropDownList("CursoInvestigadorId", Model.CursosInvestigadores.CreateSelectList<CursoInvestigadorForm>("Id", "Nombre"),
            "Seleccione ...", new { @class = "requerido cascade", rel = Url.Action("ChangeCursoInvestigador") })%>
        <%=Html.ValidationMessage("CursoInvestigador")%>
    </p>
<% } else { %>
	<p>
	    <label>Nombre del curso</label>
        <span id="span_nombrecurso" class="valor"><%= Html.Encode(Model.CursoInvestigador.Nombre) %>&nbsp;</span>
	</p> 
<% } %>
	                   
<p>
    <label>Programa de estudio</label>
    <span id="span_programaestudio" class="valor"><%= Html.Encode(Model.CursoInvestigador.ProgramaEstudioNombre) %>&nbsp;</span>
</p>
<p>
    <label>Nivel de estudios</label>
    <span id="span_nivelestudio" class="valor"><%= Html.Encode(Model.CursoInvestigador.NivelEstudioNombre)%>&nbsp;</span>
</p>
<p>
    <label>Instituci&oacute;n</label>
    <span id="span_institucioncurso" class="valor"><%= Html.Encode(Model.CursoInvestigador.InstitucionNombre)%>&nbsp;</span>
</p>
<p>
    <label>Pa&iacute;s</label>
    <span id="span_paiscurso" class="valor"><%= Html.Encode(Model.CursoInvestigador.InstitucionPaisNombre)%>&nbsp;</span>
</p>
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

<h4>Estructura funcional</h4>
<p>
    <label>Sector</label>
    <span id="span_sector" class="valor"><%= Html.Encode(Model.CursoInvestigador.SectorNombre)%>&nbsp;</span>
</p>
<p>
    <label>Organizaci&oacute;n</label>
    <span id="span_organizacion" class="valor"><%= Html.Encode(Model.CursoInvestigador.OrganizacionNombre)%>&nbsp;</span>
</p>
<p>
    <label>2do. Nivel</label>
    <span id="span_2donivel" class="valor"><%= Html.Encode(Model.CursoInvestigador.Nivel2Nombre)%>&nbsp;</span>
</p>