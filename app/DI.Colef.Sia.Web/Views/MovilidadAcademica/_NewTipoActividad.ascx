<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<MovilidadAcademicaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<table class="subform">
    <tr>
        <td class="label">
            <label>Tipo Actividad</label>
            <br />
			<%=Html.DropDownList("TipoActividadMovilidadAcademica.TipoActividad", Model.TiposActividades.CreateSelectList<TipoActividadForm>("Id", "Nombre"),
			"Seleccione ...")%>
			<%=Html.ValidationMessage("TipoActividadMovilidadAcademica.TipoActividad") %>
        </td>
    </tr>                           
</table>
