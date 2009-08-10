<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ParticipacionMedioForm>" %>
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
			<label>Nombre:<em>*</em></label>
		</td>
		<td>
			<%=Html.TextBox("Nombre", Model.Nombre, new { maxlength = 100 })%>
			<%=Html.ValidationMessage("Nombre")%>
		</td>
	</tr>
		
	<tr>
		<td>
			<label>Medio Impreso:<em>*</em></label>
		</td>
		<td>
			<%=Html.DropDownList("MedioImpreso", Model.MediosImpresos.CreateSelectList<MedioImpresoForm>("Id", "Nombre"),
				"Seleccione ...")%>
			<%=Html.ValidationMessage("MedioImpreso") %>
		</td>
	</tr>
		
	<tr>
		<td>
			<label>Medio Electronico:<em>*</em></label>
		</td>
		<td>
			<%=Html.DropDownList("MedioElectronico", Model.MediosElectronicos.CreateSelectList<MedioElectronicoForm>("Id", "Nombre"),
				"Seleccione ...")%>
			<%=Html.ValidationMessage("MedioElectronico") %>
		</td>
	</tr>
		
	<tr>
		<td>
			<label>Especificacion:<em>*</em></label>
		</td>
		<td>
			<%=Html.TextBox("Especificacion", Model.Especificacion, new { maxlength = 100 })%>
			<%=Html.ValidationMessage("Especificacion")%>
		</td>
	</tr>
		
	<tr>
		<td>
			<label>Genero:<em>*</em></label>
		</td>
		<td>
			<%=Html.DropDownList("Genero", Model.Generos.CreateSelectList<GeneroForm>("Id", "Nombre"),
				"Seleccione ...")%>
			<%=Html.ValidationMessage("Genero") %>
		</td>
	</tr>
		
	<tr>
		<td>
			<label>Tema:<em>*</em></label>
		</td>
		<td>
			<%=Html.TextBox("Tema", Model.Tema, new { maxlength = 100 })%>
			<%=Html.ValidationMessage("Tema")%>
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
			<label>Linea Tematica:<em>*</em></label>
		</td>
		<td>
			<%=Html.DropDownList("LineaTematica", Model.LineasTematicas.CreateSelectList<LineaTematicaForm>("Id", "Nombre"),
				"Seleccione ...")%>
			<%=Html.ValidationMessage("LineaTematica") %>
		</td>
	</tr>
		
	<tr>
		<td>
			<label>Ambito:<em>*</em></label>
		</td>
		<td>
			<%=Html.DropDownList("Ambito", Model.Ambitos.CreateSelectList<AmbitoForm>("Id", "Nombre"),
				"Seleccione ...")%>
			<%=Html.ValidationMessage("Ambito") %>
		</td>
	</tr>
		
	<tr>
		<td>
			<label>Fecha Difusion:<em>*</em></label>
		</td>
		<td>
			<%=Html.TextBox("FechaDifusion", Model.FechaDifusion, new { @class="datetime", maxlength = 10 })%>
            <span class="helper_message">(Formato dd/mm/yyyy)</span>
            <%=Html.ValidationMessage("FechaDifusion")%>
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
