<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true" 
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<DictamenForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DI.Colef.Sia.Web.Controllers" %>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <h2><%=Html.Encode(Model.Title) %></h2>
    <% Html.RenderPartial("_Message"); %>
    <br />
    <% using (Html.BeginForm("Create", "Dictamen")) { %>
		<div id="form">
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
					<label>Tipo Dictamen:<em>*</em></label>
				</td>
				<td>
										
										
										
											<%=Html.DropDownList("TipoDictamen", Model.Form.TiposDictamenes.CreateSelectList<TipoDictamenForm>("Id", "Nombre"),
							"Seleccione ...")%>
						<%=Html.ValidationMessage("TipoDictamen") %>
									</td>
			</tr>
		
					<tr>
				<td>
					<label>Tipo Participacion:<em>*</em></label>
				</td>
				<td>
										
										
										
											<%=Html.DropDownList("TipoParticipacion", Model.Form.TiposParticipaciones.CreateSelectList<TipoParticipacionForm>("Id", "Nombre"),
							"Seleccione ...")%>
						<%=Html.ValidationMessage("TipoParticipacion") %>
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
					<label>Periodo Referencia:<em>*</em></label>
				</td>
				<td>
										
										
										
											<%=Html.DropDownList("PeriodoReferencia", Model.Form.PeriodosReferencias.CreateSelectList<PeriodoReferenciaForm>("Id", "Nombre"),
							"Seleccione ...")%>
						<%=Html.ValidationMessage("PeriodoReferencia") %>
									</td>
			</tr>
		
				
			<div class="btn_container_footer">
				<span class="btn btn_normal_brown">
					<%=Html.SubmitButton("Guardar", "Guardar Cambios") %>
				</span>
				<span class="btn btn_normal_white">
					<%=Html.ActionLink<DictamenController>(x => x.Index(), "Regresar") %>
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
