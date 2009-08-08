<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CursoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<table class="subform">
	<tr>
		<td>
			<label>Sector:<em>*</em></label>
		</td>
	    <td>
			<%=Html.DropDownList("Sector", Model.Sectores.CreateSelectList<SectorForm>("Id", "Nombre"),
				"Seleccione ...")%>
			<%=Html.ValidationMessage("Sector") %>
		</td>
	</tr>
		
	<tr>
		<td>
			<label>Organizacion:<em>*</em></label>
		</td>
		<td>
			<%=Html.DropDownList("Organizacion", Model.Organizaciones.CreateSelectList<OrganizacionForm>("Id", "Nombre"),
				"Seleccione ...")%>
			<%=Html.ValidationMessage("Organizacion") %>
		</td>
	</tr>
		
	<tr>
		<td>
			<label>Nivel2:<em>*</em></label>
		</td>    		
		<td>
		    <%=Html.DropDownList("Nivel", Model.Niveles.CreateSelectList<NivelForm>("Id", "Nombre"),
				"Seleccione ...")%>
			<%=Html.ValidationMessage("Nivel") %>
		</td>
	</tr>
		
	<tr>
		<td>
			<label>Nivel3:<em>*</em></label>
		</td>		    
		<td>
		    <%=Html.DropDownList("Nivel", Model.Niveles.CreateSelectList<NivelForm>("Id", "Nombre"),
				"Seleccione ...")%>
			<%=Html.ValidationMessage("Nivel") %>
		</td>
	</tr>
		
	<tr>
		<td>
			<label>Nivel4:<em>*</em></label>
		</td>		    
		<td>
		    <%=Html.DropDownList("Nivel", Model.Niveles.CreateSelectList<NivelForm>("Id", "Nombre"),
				"Seleccione ...")%>
			<%=Html.ValidationMessage("Nivel") %>
		</td>
	</tr>
		
	<tr>
		<td>
			<label>Nivel5:<em>*</em></label>
		</td>
	    <td>
	        <%=Html.DropDownList("Nivel", Model.Niveles.CreateSelectList<NivelForm>("Id", "Nombre"),
				"Seleccione ...")%>
			<%=Html.ValidationMessage("Nivel") %>
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
			<label>Area:<em>*</em></label>
		</td>
		<td>
			<%=Html.DropDownList("Area", Model.Areas.CreateSelectList<AreaForm>("Id", "Nombre"),
				"Seleccione ...")%>
			<%=Html.ValidationMessage("Area") %>
		</td>
	</tr>
		
	<tr>
		<td>
			<label>Disciplina:<em>*</em></label>
		</td>
		<td>
			<%=Html.DropDownList("Disciplina", Model.Disciplinas.CreateSelectList<DisciplinaForm>("Id", "Nombre"),
				"Seleccione ...")%>
			<%=Html.ValidationMessage("Disciplina") %>
		</td>
	</tr>
		
	<tr>
		<td>
			<label>Subdisciplina:<em>*</em></label>
		</td>
		<td>
			<%=Html.DropDownList("Subdisciplina", Model.Subdisciplinas.CreateSelectList<SubdisciplinaForm>("Id", "Nombre"),
				"Seleccione ...")%>
			<%=Html.ValidationMessage("Subdisciplina") %>
		</td>
	</tr>
</table>
