<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<InvestigadorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<table class="form" id="gradoList">
    <tr>
        <th class="subform">Grado</th>
    </tr>
    <% foreach(var grado in Model.GradosAcademicosInvestigador) { %>
    <tr id="grado_<%=Html.Encode(grado.Id) %>">
        <td class="subform">
            <%=Html.Encode(grado.GradoAcademicoNombre) %> <span class="more_info"><%=Html.Encode(grado.Fecha) %>, Area: <%=Html.Encode(grado.AreaInvestigacion) %></span>
            <div class="meta_info"><%=Html.Encode(grado.Descripcion.Substring(0, grado.Descripcion.Length < 40 ? grado.Descripcion.Length : 40)) %></div>
        </td>
    </tr>
    <% } %>
</table>
<div id="grado_new" class="floatl btn_container">
    <span class="btn btn_small_white">
	    <%=Html.ActionLink("+ Nuevo Grado", "NewGrado", new { Id = Model.Id }, new { @class = "remote get" })%>
	</span>
</div>
<div id="grado_form" class="display:hidden;"></div>