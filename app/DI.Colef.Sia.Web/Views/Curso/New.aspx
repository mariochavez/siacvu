<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true" 
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<CursoForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DI.Colef.Sia.Web.Controllers" %>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <h2><%=Html.Encode(Model.Title) %></h2>
    <% Html.RenderPartial("_Message"); %>
    <br />
    <% using (Html.BeginForm("Create", "Curso")) { %>
		<div id="form">
					<tr>
				<td>
					<label>Numero Horas:<em>*</em></label>
				</td>
				<td>
										
										
										
									</td>
			</tr>
		
					<tr>
				<td>
					<label>Periodo Referencia:<em>*</em></label>
				</td>
				<td>
										
										
										
											<%=Html.DropDownList("PeriodoReferencia", Model.Form.PeriodosReferencias.CreateSelectList<PeriodoReferenciaForm>("Id", "Nombre"),
							"Seleccione ...")%>
						<%=Html.ValidationMessage("PeriodoReferencia") %>
									</td>
			</tr>
		
					<tr>
				<td>
					<label>Programa Estudio:<em>*</em></label>
				</td>
				<td>
										
										
										
											<%=Html.DropDownList("ProgramaEstudio", Model.Form.ProgramasEstudios.CreateSelectList<ProgramaEstudioForm>("Id", "Nombre"),
							"Seleccione ...")%>
						<%=Html.ValidationMessage("ProgramaEstudio") %>
									</td>
			</tr>
		
					<tr>
				<td>
					<label>Institucion:<em>*</em></label>
				</td>
				<td>
										
										
										
											<%=Html.DropDownList("Institucion", Model.Form.Instituciones.CreateSelectList<InstitucionForm>("Id", "Nombre"),
							"Seleccione ...")%>
						<%=Html.ValidationMessage("Institucion") %>
									</td>
			</tr>
		
					<tr>
				<td>
					<label>Nivel:<em>*</em></label>
				</td>
				<td>
										
										
										
											<%=Html.DropDownList("Nivel", Model.Form.Niveles.CreateSelectList<NivelForm>("Id", "Nombre"),
							"Seleccione ...")%>
						<%=Html.ValidationMessage("Nivel") %>
									</td>
			</tr>
		
					<tr>
				<td>
					<label>Sector:<em>*</em></label>
				</td>
				<td>
										
										
										
											<%=Html.DropDownList("Sector", Model.Form.Sectores.CreateSelectList<SectorForm>("Id", "Nombre"),
							"Seleccione ...")%>
						<%=Html.ValidationMessage("Sector") %>
									</td>
			</tr>
		
					<tr>
				<td>
					<label>Organizacion:<em>*</em></label>
				</td>
				<td>
										
										
										
											<%=Html.DropDownList("Organizacion", Model.Form.Organizaciones.CreateSelectList<OrganizacionForm>("Id", "Nombre"),
							"Seleccione ...")%>
						<%=Html.ValidationMessage("Organizacion") %>
									</td>
			</tr>
		
					<tr>
				<td>
					<label>Nivel2:<em>*</em></label>
				</td>
				<td>
										
										
										
									</td>
			</tr>
		
					<tr>
				<td>
					<label>Nivel3:<em>*</em></label>
				</td>
				<td>
										
										
										
									</td>
			</tr>
		
					<tr>
				<td>
					<label>Nivel4:<em>*</em></label>
				</td>
				<td>
										
										
										
									</td>
			</tr>
		
					<tr>
				<td>
					<label>Nivel5:<em>*</em></label>
				</td>
				<td>
										
										
										
									</td>
			</tr>
		
					<tr>
				<td>
					<label>Pais:<em>*</em></label>
				</td>
				<td>
										
										
										
											<%=Html.DropDownList("Pais", Model.Form.Paises.CreateSelectList<PaisForm>("Id", "Nombre"),
							"Seleccione ...")%>
						<%=Html.ValidationMessage("Pais") %>
									</td>
			</tr>
		
					<tr>
				<td>
					<label>Area:<em>*</em></label>
				</td>
				<td>
										
										
										
											<%=Html.DropDownList("Area", Model.Form.Areas.CreateSelectList<AreaForm>("Id", "Nombre"),
							"Seleccione ...")%>
						<%=Html.ValidationMessage("Area") %>
									</td>
			</tr>
		
					<tr>
				<td>
					<label>Disciplina:<em>*</em></label>
				</td>
				<td>
										
										
										
											<%=Html.DropDownList("Disciplina", Model.Form.Disciplinas.CreateSelectList<DisciplinaForm>("Id", "Nombre"),
							"Seleccione ...")%>
						<%=Html.ValidationMessage("Disciplina") %>
									</td>
			</tr>
		
					<tr>
				<td>
					<label>Subdisciplina:<em>*</em></label>
				</td>
				<td>
										
										
										
											<%=Html.DropDownList("Subdisciplina", Model.Form.Subdisciplinas.CreateSelectList<SubdisciplinaForm>("Id", "Nombre"),
							"Seleccione ...")%>
						<%=Html.ValidationMessage("Subdisciplina") %>
									</td>
			</tr>
		
				
			<div class="btn_container_footer">
				<span class="btn btn_normal_brown">
					<%=Html.SubmitButton("Guardar", "Guardar Cambios") %>
				</span>
				<span class="btn btn_normal_white">
					<%=Html.ActionLink<CursoController>(x => x.Index(), "Regresar") %>
				</span>
			</div>
	    </div>
    <% } %>
    
<script type="text/javascript">
    $(document).ready(function() {
        setupDocument();
    });
</script>
</asp:Content>
