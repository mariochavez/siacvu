<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<EventoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<table class="subform">
    <tr>
        <td class="label">
		    <label>Institucion:<em>*</em></label>
		    <br />
			<%=Html.DropDownList("Institucion", Model.Instituciones.CreateSelectList<InstitucionForm>("Id", "Nombre"),
				    "Seleccione ...")%>
			<%=Html.ValidationMessage("Institucion") %>
        </td>
        <td class="label">
		    <label>Lugar:<em>*</em></label>
		    <br />
			<%=Html.TextBox("Lugar", Model.Lugar, new { maxlength = 100 })%>
			<%=Html.ValidationMessage("Lugar")%>
        </td>
    </tr>
    <tr>
        <td class="label">
		    <label>Linea Tematica:<em>*</em></label>
		    <br />
			<%=Html.DropDownList("LineaTematica", Model.LineasTematicas.CreateSelectList<LineaTematicaForm>("Id", "Nombre"),
				    "Seleccione ...")%>
			<%=Html.ValidationMessage("LineaTematica") %>
        </td>
        <td class="label">
		    <label>Tipo Financiamiento:<em>*</em></label>
		    <br />
			<%=Html.DropDownList("TipoFinanciamiento", Model.TiposFinanciamientos.CreateSelectList<TipoFinanciamientoForm>("Id", "Nombre"),
				    "Seleccione ...")%>
			<%=Html.ValidationMessage("TipoFinanciamiento") %>
        </td>
    </tr>
    <tr>
        <td class="label">
		    <label>Fecha Inicial:<em>*</em></label>
		    <br />
			<%=Html.TextBox("FechaInicial", Model.FechaInicial, new { @class="datetime", maxlength = 10 })%>
            <span class="helper_message">(Formato dd/mm/yyyy)</span>
            <%=Html.ValidationMessage("FechaInicial")%>
        </td>
        <td class="label">
		    <label>Fecha Final:<em>*</em></label>
		    <br />
			<%=Html.TextBox("FechaFinal", Model.FechaFinal, new { @class="datetime", maxlength = 10 })%>
            <span class="helper_message">(Formato dd/mm/yyyy)</span>
            <%=Html.ValidationMessage("FechaFinal")%>
        </td>
    </tr>
</table>
