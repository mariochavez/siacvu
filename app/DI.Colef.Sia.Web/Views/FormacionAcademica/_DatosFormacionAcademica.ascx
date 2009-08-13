<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<FormacionAcademicaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Nivel Estudio:</label>

    <%=Html.DropDownList("NivelEstudio", Model.NivelesEstudios.CreateSelectList<NivelEstudioForm>("Id", "Nombre"),
        "Seleccione ...")%>
    <%=Html.ValidationMessage("NivelEstudio") %>
</p>
<p>
    <label>Numero Cedula:</label>

    <%=Html.TextBox("NumeroCedula", Model.NumeroCedula, new { @class = "input250", maxlength = 10, size = 14 })%>
    <%=Html.ValidationMessage("NumeroCedula")%>
</p>
<p>
    <label>Titulo Grado:</label>

    <%=Html.TextBox("TituloGrado", Model.TituloGrado, new { @class = "input250-requerido", maxlength = 100 })%>
    <%=Html.ValidationMessage("TituloGrado")%>
</p>
<p>
    <label>Fecha Obtencion:</label>
 
    <%=Html.TextBox("FechaObtencion", Model.FechaObtencion, new { @class = "datetime input100", maxlength = 10 })%>
    <span class="helper_message">(Formato dd/mm/yyyy)</span>
    <%=Html.ValidationMessage("FechaObtencion")%>
</p>
<p>
    <label>Institucion:</label>
  
    <%=Html.DropDownList("Institucion", Model.Instituciones.CreateSelectList<InstitucionForm>("Id", "Nombre"),
        "Seleccione ...")%>
    <%=Html.ValidationMessage("Institucion") %>
</p>
<p>
    <label>Titulo Tesis:</label>

    <%=Html.TextBox("TituloTesis", Model.TituloTesis, new { @class = "input250", maxlength = 100 })%>
    <%=Html.ValidationMessage("TituloTesis")%>
</p>
<p>
    <label>Linea Tematica:</label>

    <%=Html.DropDownList("LineaTematica", Model.LineasTematicas.CreateSelectList<LineaTematicaForm>("Id", "Nombre"),
        "Seleccione ...")%>
    <%=Html.ValidationMessage("LineaTematica") %>
</p>
<p>
    <label>Pais:</label>

    <%=Html.DropDownList("Pais", Model.Paises.CreateSelectList<PaisForm>("Id", "Nombre"),
        "Seleccione ...")%>
    <%=Html.ValidationMessage("Pais") %>
</p>
<p>
    <label>Estado Pais:</label>

    <%=Html.DropDownList("EstadoPais", Model.EstadosPaises.CreateSelectList<EstadoPaisForm>("Id", "Nombre"),
        "Seleccione ...")%>
    <%=Html.ValidationMessage("EstadoPais") %>
</p>
<p>
    <label>Ciudad:</label>

    <%=Html.TextBox("Ciudad", Model.Ciudad, new { @class = "input250", maxlength = 100 })%>
    <%=Html.ValidationMessage("Ciudad")%>
</p>