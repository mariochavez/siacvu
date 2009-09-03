<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ProyectoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<p>
    <label>Tipo de proyecto</label>
    <%=Html.DropDownList("TipoProyecto", Model.TiposProyectos.CreateSelectList<TipoProyectoForm>("Id", "Nombre"),
		        "Seleccione ...", new {@class="requerido"})%>
    <%=Html.ValidationMessage("TipoProyecto") %>
</p>
<p>
    <label>Nombre</label>
    <%=Html.TextBox("Nombre", Model.Nombre, new { @class="input350-bold-requerido", maxlength = 100 })%>
    <%=Html.ValidationMessage("Nombre")%>
</p>
<p>
    <label>Responsable</label>
    <%=Html.TextBox("Responsable", Model.Responsable, new { @class = "input250-requerido", maxlength = 100 })%>
    <%=Html.ValidationMessage("Responsable")%>
</p>
<p>
    <label>L&iacute;nea tem&aacute;tica</label>
    <%=Html.DropDownList("LineaTematica", Model.LineasTematicas.CreateSelectList<LineaTematicaForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("LineaTematica") %>
</p>
<p>
    <label>Fecha inicial</label>
    <%=Html.TextBox("FechaInicial", Model.FechaInicial, new { @class = "datetime input100-requerido", maxlength = 10 })%>
    <span>(Formato dd/mm/yyyy)</span>
    <%=Html.ValidationMessage("FechaInicial")%>
</p>
<p>
    <label>Fecha final</label>
    <%=Html.TextBox("FechaFinal", Model.FechaFinal, new { @class = "datetime input100-requerido", maxlength = 10 })%>
    <span>(Formato dd/mm/yyyy)</span>
    <%=Html.ValidationMessage("FechaFinal")%>
</p>
<p>
    <label>Fecha de registro</label>
    <%=Html.TextBox("FechaRegistro", Model.FechaRegistro, new { @class = "datetime input100-requerido", maxlength = 10 })%>
    <span>(Formato dd/mm/yyyy)</span>
    <%=Html.ValidationMessage("FechaRegistro")%>
</p>
<p>
    <label>Producto esperado</label>
    <%=Html.TextBox("ProductoEsperado", Model.ProductoEsperado, new { @class = "input250-requerido", maxlength = 100 })%>
    <%=Html.ValidationMessage("ProductoEsperado")%>
</p>
<p>
    <label>Coordinaci&oacute;n</label>
    <%=Html.DropDownList("Coordinacion", Model.Coordinaciones.CreateSelectList<CoordinacionForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("Coordinacion")%>
</p>
<p>
    <label>Con financiamiento</label>
    <%= Html.CheckBox("ConFinanciamiento", Model.ConFinanciamiento)%>
    <%=Html.ValidationMessage("ConFinanciamiento")%>
</p>
<p>
    <label>Estado del proyecto</label>
    <%=Html.TextBox("EstadoProyecto", Model.EstadoProyecto, new { @class = "input250-requerido", maxlength = 100 })%>
    <%=Html.ValidationMessage("EstadoProyecto")%>
</p>
<p>
    <label>Fecha de tr&aacute;mite</label>
    <%=Html.TextBox("FechaTramite", Model.FechaTramite, new { @class = "datetime input100-requerido", maxlength = 10 })%>
    <span>(Formato dd/mm/yyyy)</span>
    <%=Html.ValidationMessage("FechaTramite")%>
</p>
<p>
    <label>Objetivos</label>
    <%=Html.TextBox("Objetivos", Model.Objetivos, new { @class = "input250-requerido", maxlength = 100 })%>
    <%=Html.ValidationMessage("Objetivos")%>
</p>