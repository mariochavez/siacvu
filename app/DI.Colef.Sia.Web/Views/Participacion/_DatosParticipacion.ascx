<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ParticipacionForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<table class="subform">
    <tr>
		<td>
			<label>Titulo:<em>*</em></label>
		</td>
		<td>
			<%=Html.TextBox("Titulo", Model.Titulo, new { maxlength = 100 })%>
			<%=Html.ValidationMessage("Titulo")%>
		</td>
	</tr>
		
	<tr>
		<td>
			<label>Autor:<em>*</em></label>
		</td>
		<td>
		    <%=Html.DropDownList("Autor", Model.Autores.CreateSelectList<InvestigadorForm>("Id", "Nombre"),
				"Seleccione ...")%>
			<%=Html.ValidationMessage("Autor")%>
		</td>
	</tr>
		
	<tr>
		<td>
			<label>Otra Participacion:<em>*</em></label>
		</td>
		<td>
			<%=Html.DropDownList("OtraParticipacion", Model.OtrasParticipaciones.CreateSelectList<OtraParticipacionForm>("Id", "Nombre"),
				"Seleccione ...")%>
			<%=Html.ValidationMessage("OtraParticipacion") %>
		</td>
	</tr>
		
	<tr>
		<td>
			<label>Tipo Presentacion:<em>*</em></label>
		</td>
		<td>
			<%=Html.DropDownList("TipoPresentacion", Model.TiposPresentaciones.CreateSelectList<TipoPresentacionForm>("Id", "Nombre"),
				"Seleccione ...")%>
			<%=Html.ValidationMessage("TipoPresentacion") %>
		</td>
	</tr>
		
	<tr>
		<td>
			<label>Institucion:<em>*</em></label>
		</td>
		<td>
			<%=Html.TextBox("Institucion", Model.Institucion, new { maxlength = 100 })%>
			<%=Html.ValidationMessage("Institucion")%>
		</td>
	</tr>
		
	<tr>
		<td>
			<label>Fecha Presentacion:<em>*</em></label>
		</td>
		<td>
			<%=Html.TextBox("FechaPresentacion", Model.FechaPresentacion, new { @class="datetime", maxlength = 10 })%>
            <span class="helper_message">(Formato dd/mm/yyyy)</span>
            <%=Html.ValidationMessage("FechaPresentacion")%>
		</td>
	</tr>
		
	<tr>
		<td>
			<label>Periodo Referencia:<em>*</em></label>
		</td>
		<td>
			<%=Html.DropDownList("PeriodoReferencia", Model.PeriodosReferencias.CreateSelectList<PeriodoReferenciaForm>("Id", "Periodo"),
				"Seleccione ...")%>
			<%=Html.ValidationMessage("PeriodoReferencia") %>
		</td>
	</tr>
		
	<tr>
		<td>
			<label>Proyecto:<em>*</em></label>
		</td>
		<td>
			<%=Html.DropDownList("Proyecto", Model.Proyectos.CreateSelectList<ProyectoForm>("Id", "Nombre"),
				"Seleccione ...")%>
			<%=Html.ValidationMessage("Proyecto") %>
		</td>
	</tr>
		
	<tr>
		<td>
			<label>Lugar:<em>*</em></label>
		</td>
		<td>
			<%=Html.TextBox("Lugar", Model.Lugar, new { maxlength = 100 })%>
			<%=Html.ValidationMessage("Lugar")%>
		</td>
	</tr>
		
	<tr>
		<td>
			<label>Pais:<em>*</em></label>
		</td>
		<td>
			<%=Html.DropDownList("Pais", Model.Paises.CreateSelectList<PaisForm>("Id", "Nombre"),
				"Seleccione ...")%>
			<%=Html.ValidationMessage("Pais") %>
		</td>
	</tr>
		
	<tr>
		<td>
			<label>Estado Pais:<em>*</em></label>
		</td>
		<td>
			<%=Html.DropDownList("EstadoPais", Model.EstadosPaises.CreateSelectList<EstadoPaisForm>("Id", "Nombre"),
				"Seleccione ...")%>
			<%=Html.ValidationMessage("EstadoPais") %>
		</td>
	</tr>
		
	<tr>
		<td>
			<label>Ciudad:<em>*</em></label>
		</td>
		<td>
			<%=Html.TextBox("Ciudad", Model.Ciudad, new { maxlength = 100 })%>
			<%=Html.ValidationMessage("Ciudad")%>
		</td>
	</tr>
</table>
