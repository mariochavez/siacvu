<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<DistincionForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<table class="subform">
    <tr>
        <td class="label">
		    <label>Tipo Distincion:</label>
		    <br />
		    <%=Html.DropDownList("TipoDistincion", Model.TiposDistinciones.CreateSelectList<TipoDistincionForm>("Id", "Nombre"),
				    "Seleccione ...")%>
		    <%=Html.ValidationMessage("TipoDistincion") %>
        </td>
        <td class="label">
		    <label>Descripcion:<em>*</em></label>
		    <br />
		    <%=Html.TextBox("Descripcion", Model.Descripcion, new { maxlength = 100 })%>
		    <%=Html.ValidationMessage("Descripcion")%>
        </td>
    </tr>
    <tr>
        <td class="label">
		    <label>Fecha Otorgamiento:</label>
		    <br />
		    <%=Html.TextBox("FechaOtorgamiento", Model.FechaOtorgamiento, new { @class="datetime", maxlength = 10 })%>
            <span class="helper_message">(Formato dd/mm/yyyy)</span>
            <%=Html.ValidationMessage("FechaOtorgamiento")%>
        </td>
        <td class="label">
		    <label>Institucion:</label>
		    <br />
		    <%=Html.DropDownList("Institucion", Model.Instituciones.CreateSelectList<InstitucionForm>("Id", "Nombre"),
				    "Seleccione ...")%>
		    <%=Html.ValidationMessage("Institucion") %>
        </td>
    </tr>
    <tr>
        <td class="label">
		    <label>Ambito:</label>
		    <br />
		    <%=Html.DropDownList("Ambito", Model.Ambitos.CreateSelectList<AmbitoForm>("Id", "Nombre"),
				    "Seleccione ...")%>
		    <%=Html.ValidationMessage("Ambito") %>
        </td>
        <td class="label">
		    <label>Pais:</label>
		    <br />
		    <%=Html.DropDownList("Pais", Model.Paises.CreateSelectList<PaisForm>("Id", "Nombre"),
				    "Seleccione ...")%>
		    <%=Html.ValidationMessage("Pais") %>
        </td>
    </tr> 
    <tr>
        <td class="label">
		    <label>Estado:</label>
		    <br />
		    <%=Html.DropDownList("EstadoPais", Model.EstadosPaises.CreateSelectList<EstadoPaisForm>("Id", "Nombre"),
				    "Seleccione ...")%>
		    <%=Html.ValidationMessage("EstadoPais") %>
        </td>
        <td class="label" colspan="2">
		    <label>Ciudad:</label>
		    <br />
		    <%=Html.TextBox("Ciudad", Model.Ciudad, new { maxlength = 100 })%>
		    <%=Html.ValidationMessage("Ciudad")%>
        </td>
    </tr>
</table>
