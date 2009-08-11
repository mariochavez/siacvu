<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<MovilidadAcademicaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<table class="subform">                          
    <tr>
        <td class="label">
            <label>Proyecto</label>
            <br />
			<%=Html.DropDownList("ProyectoMovilidadAcademica.Proyecto", Model.Proyectos.CreateSelectList<ProyectoForm>("Id", "Nombre"),
			"Seleccione ...")%>
			<%=Html.ValidationMessage("ProyectoMovilidadAcademica.Proyecto") %>
        </td>
    </tr>                            
</table>
