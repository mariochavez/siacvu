<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true" 
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<ParticipacionForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DI.Colef.Sia.Web.Controllers" %>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <h2><%=Html.Encode(Model.Title) %></h2>
    <% Html.RenderPartial("_Message"); %>
    <br />
    <% using (Html.BeginForm("Create", "Participacion")) { %>
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
					<label>Autor:<em>*</em></label>
				</td>
				<td>
										
										
										
									</td>
			</tr>
		
					<tr>
				<td>
					<label>Otra Participacion:<em>*</em></label>
				</td>
				<td>
										
										
										
											<%=Html.DropDownList("OtraParticipacion", Model.Form.OtrasParticipaciones.CreateSelectList<OtraParticipacionForm>("Id", "Nombre"),
							"Seleccione ...")%>
						<%=Html.ValidationMessage("OtraParticipacion") %>
									</td>
			</tr>
		
					<tr>
				<td>
					<label>Tipo Presentacion:<em>*</em></label>
				</td>
				<td>
										
										
										
											<%=Html.DropDownList("TipoPresentacion", Model.Form.TiposPresentaciones.CreateSelectList<TipoPresentacionForm>("Id", "Nombre"),
							"Seleccione ...")%>
						<%=Html.ValidationMessage("TipoPresentacion") %>
									</td>
			</tr>
		
					<tr>
				<td>
					<label>Institucion:<em>*</em></label>
				</td>
				<td>
											<%=Html.TextBox("Institucion", Model.Form.Institucion, new { maxlength = 100 })%>
						<%=Html.ValidationMessage("Institucion")%>
										
										
										
									</td>
			</tr>
		
					<tr>
				<td>
					<label>Fecha Presentacion:<em>*</em></label>
				</td>
				<td>
										
											<%=Html.TextBox("FechaPresentacion", Model.Form.FechaPresentacion, new { @class="datetime", maxlength = 10 })%>
                        <span class="helper_message">(Formato dd/mm/yyyy)</span>
                        <%=Html.ValidationMessage("FechaPresentacion")%>
										
										
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
					<label>Lugar:<em>*</em></label>
				</td>
				<td>
											<%=Html.TextBox("Lugar", Model.Form.Lugar, new { maxlength = 100 })%>
						<%=Html.ValidationMessage("Lugar")%>
										
										
										
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
					<%=Html.ActionLink<ParticipacionController>(x => x.Index(), "Regresar") %>
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
