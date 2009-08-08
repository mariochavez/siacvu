<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true" 
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<ParticipacionMedioForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DI.Colef.Sia.Web.Controllers" %>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <h2><%=Html.Encode(Model.Title) %></h2>
    <% Html.RenderPartial("_Message"); %>
    <br />
    <% using (Html.BeginForm("Create", "ParticipacionMedio")) { %>
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
					<label>Nombre:<em>*</em></label>
				</td>
				<td>
											<%=Html.TextBox("Nombre", Model.Form.Nombre, new { maxlength = 100 })%>
						<%=Html.ValidationMessage("Nombre")%>
										
										
										
									</td>
			</tr>
		
					<tr>
				<td>
					<label>Medio Impreso:<em>*</em></label>
				</td>
				<td>
										
										
										
											<%=Html.DropDownList("MedioImpreso", Model.Form.MediosImpresos.CreateSelectList<MedioImpresoForm>("Id", "Nombre"),
							"Seleccione ...")%>
						<%=Html.ValidationMessage("MedioImpreso") %>
									</td>
			</tr>
		
					<tr>
				<td>
					<label>Medio Electronico:<em>*</em></label>
				</td>
				<td>
										
										
										
											<%=Html.DropDownList("MedioElectronico", Model.Form.MediosElectronicos.CreateSelectList<MedioElectronicoForm>("Id", "Nombre"),
							"Seleccione ...")%>
						<%=Html.ValidationMessage("MedioElectronico") %>
									</td>
			</tr>
		
					<tr>
				<td>
					<label>Especificacion:<em>*</em></label>
				</td>
				<td>
											<%=Html.TextBox("Especificacion", Model.Form.Especificacion, new { maxlength = 100 })%>
						<%=Html.ValidationMessage("Especificacion")%>
										
										
										
									</td>
			</tr>
		
					<tr>
				<td>
					<label>Genero:<em>*</em></label>
				</td>
				<td>
										
										
										
											<%=Html.DropDownList("Genero", Model.Form.Generos.CreateSelectList<GeneroForm>("Id", "Nombre"),
							"Seleccione ...")%>
						<%=Html.ValidationMessage("Genero") %>
									</td>
			</tr>
		
					<tr>
				<td>
					<label>Tema:<em>*</em></label>
				</td>
				<td>
											<%=Html.TextBox("Tema", Model.Form.Tema, new { maxlength = 100 })%>
						<%=Html.ValidationMessage("Tema")%>
										
										
										
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
					<label>Proyecto:<em>*</em></label>
				</td>
				<td>
										
										
										
											<%=Html.DropDownList("Proyecto", Model.Form.Proyectos.CreateSelectList<ProyectoForm>("Id", "Nombre"),
							"Seleccione ...")%>
						<%=Html.ValidationMessage("Proyecto") %>
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
					<label>Ambito:<em>*</em></label>
				</td>
				<td>
										
										
										
											<%=Html.DropDownList("Ambito", Model.Form.Ambitos.CreateSelectList<AmbitoForm>("Id", "Nombre"),
							"Seleccione ...")%>
						<%=Html.ValidationMessage("Ambito") %>
									</td>
			</tr>
		
					<tr>
				<td>
					<label>Fecha Difusion:<em>*</em></label>
				</td>
				<td>
										
											<%=Html.TextBox("FechaDifusion", Model.Form.FechaDifusion, new { @class="datetime", maxlength = 10 })%>
                        <span class="helper_message">(Formato dd/mm/yyyy)</span>
                        <%=Html.ValidationMessage("FechaDifusion")%>
										
										
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
					<label>Estado Pais:<em>*</em></label>
				</td>
				<td>
										
										
										
											<%=Html.DropDownList("EstadoPais", Model.Form.EstadosPaises.CreateSelectList<EstadoPaisForm>("Id", "Nombre"),
							"Seleccione ...")%>
						<%=Html.ValidationMessage("EstadoPais") %>
									</td>
			</tr>
		
					<tr>
				<td>
					<label>Ciudad:<em>*</em></label>
				</td>
				<td>
											<%=Html.TextBox("Ciudad", Model.Form.Ciudad, new { maxlength = 100 })%>
						<%=Html.ValidationMessage("Ciudad")%>
										
										
										
									</td>
			</tr>
		
				
			<div class="btn_container_footer">
				<span class="btn btn_normal_brown">
					<%=Html.SubmitButton("Guardar", "Guardar Cambios") %>
				</span>
				<span class="btn btn_normal_white">
					<%=Html.ActionLink<ParticipacionMedioController>(x => x.Index(), "Regresar") %>
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
