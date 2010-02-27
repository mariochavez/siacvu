<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ProyectoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<p>
    <label>Objetivo general</label>
    <%=Html.TextArea("ObjetivoGeneral", Model.ObjetivoGeneral, 5, 35, new { @class = "input420-requerido", maxlength = 100 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("ObjetivoGeneral")%>
</p>

<% Html.RenderPartial("_LineaAreaTematica", Model); %>

<p>
    <label>Impacto en la pol&iacute;tica p&uacute;blica</label>
    <%=Html.DropDownList("ImpactoPoliticaPublica", Model.ImpactoPuliticaPublicas.CreateSelectList<CustomSelectForm>("Id", "Nombre"),
                "Seleccione ...")%>
    <%=Html.ValidationMessage("ImpactoPoliticaPublica")%>
</p>
<p>
    <label>Vinculaci&oacute;n con la APyD</label>
    <%=Html.DropDownList("VinculacionAPyD", Model.VinculacionesAPyDs.CreateSelectList<VinculacionAPyDForm>("Id", "Nombre"),
                "Seleccione ...")%>
    <%=Html.ValidationMessage("VinculacionAPyD")%>
</p>
<p>
    <label>Resumen del proyecto</label>
    <%=Html.TextArea("ResumenProyecto", Model.ResumenProyecto, 5, 35, new { @class = "input420-requerido", maxlength = 100 })%>
    <%=Html.ValidationMessage("ResumenProyecto")%>
</p>

<% Html.RenderPartial("_ShowSubdisciplina", new ShowFieldsForm { Areas = Model.Areas, Disciplinas = Model.Disciplinas, Subdisciplinas = Model.Subdisciplinas, IsShowForm = false }); %>