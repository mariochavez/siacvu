<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CapituloForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<table class="subform">    	
	<tr>
		<td>
			<label>Nombre del Libro:<em>*</em></label>
		</td>
		<td>
			<%=Html.TextBox("NombreLibro", Model.NombreLibro, new { maxlength = 100 })%>
			<%=Html.ValidationMessage("NombreLibro")%>
	    </td>
	</tr>
		
	<tr>
		<td>
			<label>Editorial:<em>*</em></label>
		</td>
		<td>
			<%=Html.TextBox("Editorial", Model.Editorial, new { maxlength = 100 })%>
			<%=Html.ValidationMessage("Editorial")%>
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
			<label>No. de Paginas:<em>*</em></label>
		</td>
	    <td>
	        <%=Html.TextBox("NoPaginas", Model.NoPaginas, new { maxlength = 100 })%>
		    <%=Html.ValidationMessage("NoPaginas")%>
		</td>
	</tr>
</table>
