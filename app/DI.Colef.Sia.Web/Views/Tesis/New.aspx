<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true" 
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<TesisForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DI.Colef.Sia.Web.Controllers" %>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <h2><%=Html.Encode(Model.Title) %></h2>
    <% Html.RenderPartial("_Message"); %>
    <br />
    <% using (Html.BeginForm("Create", "Tesis")) { %>
		<div id="form">
					<tr>
				<td>
					<label>Titulo:<em>*</em></label>
				</td>
				<td>
											<%=Html.TextBox("Titulo", Model.Form.Titulo, new { maxlength = 100 })%>
						<%=Html.ValidationMessage("Titulo")%>
										
										
										
									</td>
			</tr>
		
					<tr>
				<td>
					<label>Fecha Conclusion:<em>*</em></label>
				</td>
				<td>
										
											<%=Html.TextBox("FechaConclusion", Model.Form.FechaConclusion, new { @class="datetime", maxlength = 10 })%>
                        <span class="helper_message">(Formato dd/mm/yyyy)</span>
                        <%=Html.ValidationMessage("FechaConclusion")%>
										
										
									</td>
			</tr>
		
					<tr>
				<td>
					<label>Autor:<em>*</em></label>
				</td>
				<td>
											<%=Html.TextBox("Autor", Model.Form.Autor, new { maxlength = 100 })%>
						<%=Html.ValidationMessage("Autor")%>
										
										
										
									</td>
			</tr>
		
					<tr>
				<td>
					<label>Fecha Grado:<em>*</em></label>
				</td>
				<td>
										
											<%=Html.TextBox("FechaGrado", Model.Form.FechaGrado, new { @class="datetime", maxlength = 10 })%>
                        <span class="helper_message">(Formato dd/mm/yyyy)</span>
                        <%=Html.ValidationMessage("FechaGrado")%>
										
										
									</td>
			</tr>
		
					<tr>
				<td>
					<label>Grado Academico:<em>*</em></label>
				</td>
				<td>
										
										
										
											<%=Html.DropDownList("GradoAcademico", Model.Form.GradosAcademicos.CreateSelectList<GradoAcademicoForm>("Id", "Nombre"),
							"Seleccione ...")%>
						<%=Html.ValidationMessage("GradoAcademico") %>
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
					<label>Forma Participacion:<em>*</em></label>
				</td>
				<td>
										
										
										
											<%=Html.DropDownList("FormaParticipacion", Model.Form.FormasParticipaciones.CreateSelectList<FormaParticipacionForm>("Id", "Nombre"),
							"Seleccione ...")%>
						<%=Html.ValidationMessage("FormaParticipacion") %>
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
					<label>Linea Tematica:<em>*</em></label>
				</td>
				<td>
										
										
										
											<%=Html.DropDownList("LineaTematica", Model.Form.LineasTematicas.CreateSelectList<LineaTematicaForm>("Id", "Nombre"),
							"Seleccione ...")%>
						<%=Html.ValidationMessage("LineaTematica") %>
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
					<label>Dependencia:<em>*</em></label>
				</td>
				<td>
										
										
										
											<%=Html.DropDownList("Dependencia", Model.Form.Dependencias.CreateSelectList<DependenciaForm>("Id", "Nombre"),
							"Seleccione ...")%>
						<%=Html.ValidationMessage("Dependencia") %>
									</td>
			</tr>
		
					<tr>
				<td>
					<label>Departamento:<em>*</em></label>
				</td>
				<td>
										
										
										
											<%=Html.DropDownList("Departamento", Model.Form.Departamentos.CreateSelectList<DepartamentoForm>("Id", "Nombre"),
							"Seleccione ...")%>
						<%=Html.ValidationMessage("Departamento") %>
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
					<%=Html.ActionLink<TesisController>(x => x.Index(), "Regresar") %>
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
