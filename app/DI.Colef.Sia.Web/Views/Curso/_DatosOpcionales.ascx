<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CursoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<table class="subform">
	<tr>
		<td>
			<label>Sector:</label>
		</td>
	    <td>
			<%=Html.DropDownList("Sector", Model.Sectores.CreateSelectList<SectorForm>("Id", "Nombre"),
				"Seleccione ...")%>
			<%=Html.ValidationMessage("Sector") %>
		</td>
	</tr>
		
	<tr>
		<td>
			<label>Organizacion:</label>
		</td>
		<td>
			<%=Html.DropDownList("Organizacion", Model.Organizaciones.CreateSelectList<OrganizacionForm>("Id", "Nombre"),
				"Seleccione ...")%>
			<%=Html.ValidationMessage("Organizacion") %>
		</td>
	</tr>
		
	<tr>
		<td>
			<label>Nivel 2:</label>
		</td>    		
		<td>
		    <%=Html.DropDownList("Nivel2", Model.Niveles2.CreateSelectList<NivelForm>("Id", "Nombre"),
				"Seleccione ...")%>
			<%=Html.ValidationMessage("Nivel2") %>
		</td>
	</tr>
		
	<tr>
		<td>
			<label>Nivel 3:</label>
		</td>		    
		<td>
		    <%=Html.DropDownList("Nivel3", Model.Niveles3.CreateSelectList<NivelForm>("Id", "Nombre"),
				"Seleccione ...")%>
			<%=Html.ValidationMessage("Nivel3") %>
		</td>
	</tr>
		
	<tr>
		<td>
			<label>Nivel 4:</label>
		</td>		    
		<td>
		    <%=Html.DropDownList("Nivel4", Model.Niveles4.CreateSelectList<NivelForm>("Id", "Nombre"),
				"Seleccione ...")%>
			<%=Html.ValidationMessage("Nivel4") %>
		</td>
	</tr>
		
	<tr>
		<td>
			<label>Nivel 5:</label>
		</td>
	    <td>
	        <%=Html.DropDownList("Nivel5", Model.Niveles5.CreateSelectList<NivelForm>("Id", "Nombre"),
				"Seleccione ...")%>
			<%=Html.ValidationMessage("Nivel5") %>
		</td>
	</tr>
		
	<tr>
		<td>
			<label>Pais:</label>
		</td>
		<td>
			<%=Html.DropDownList("Pais", Model.Paises.CreateSelectList<PaisForm>("Id", "Nombre"),
				"Seleccione ...")%>
			<%=Html.ValidationMessage("Pais") %>
		</td>
	</tr>
		
	<tr>
		<td>
			<label>Area:</label>
		</td>
		<td>
			<%=Html.DropDownList("Area", Model.Areas.CreateSelectList<AreaForm>("Id", "Nombre"),
				"Seleccione ...")%>
			<%=Html.ValidationMessage("Area") %>
		</td>
	</tr>
		
	<tr>
		<td>
			<label>Disciplina:</label>
		</td>
		<td>
			<%=Html.DropDownList("Disciplina", Model.Disciplinas.CreateSelectList<DisciplinaForm>("Id", "Nombre"),
				"Seleccione ...")%>
			<%=Html.ValidationMessage("Disciplina") %>
		</td>
	</tr>
		
	<tr>
		<td>
			<label>Subdisciplina:</label>
		</td>
		<td>
			<%=Html.DropDownList("Subdisciplina", Model.Subdisciplinas.CreateSelectList<SubdisciplinaForm>("Id", "Nombre"),
				"Seleccione ...")%>
			<%=Html.ValidationMessage("Subdisciplina") %>
		</td>
	</tr>
</table>
