<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<DistincionForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Tipo Distinci&oacute;n</label>
    <%=Html.DropDownList("TipoDistincion", Model.TiposDistinciones.CreateSelectList<TipoDistincionForm>("Id", "Nombre"),
		    "Seleccione ...")%>
    <%=Html.ValidationMessage("TipoDistincion") %>
</p>
<p>
    <label>Descripci&oacute;n</label>
    <%=Html.TextBox("Descripcion", Model.Descripcion, new { @class = "input250-requerido", maxlength = 100 })%>
    <%=Html.ValidationMessage("Descripcion")%>
</p>
<p>
    <label>Fecha Otorgamiento</label>
    <%=Html.TextBox("FechaOtorgamiento", Model.FechaOtorgamiento, new { @class = "datetime input100-requerido", maxlength = 10 })%>
    <span>(Formato dd/mm/yyyy)</span>
    <%=Html.ValidationMessage("FechaOtorgamiento")%>
</p>
<p>
    <label>Instituci&oacute;n</label>
    <%=Html.DropDownList("Institucion", Model.Instituciones.CreateSelectList<InstitucionForm>("Id", "Nombre"),
		    "Seleccione ...")%>
    <%=Html.ValidationMessage("Institucion") %>
</p>
<p>
    <label>Ambito</label>
    <%=Html.DropDownList("Ambito", Model.Ambitos.CreateSelectList<AmbitoForm>("Id", "Nombre"),
		    "Seleccione ...")%>
    <%=Html.ValidationMessage("Ambito") %>
</p>
<p>
    <label>Pa&iacute;s</label>
    <%=Html.DropDownList("Pais", Model.Paises.CreateSelectList<PaisForm>("Id", "Nombre"),
		    "Seleccione ...")%>
    <%=Html.ValidationMessage("Pais") %>
</p>
<p>
    <label>Estado</label>
    <%=Html.DropDownList("EstadoPais", Model.EstadosPaises.CreateSelectList<EstadoPaisForm>("Id", "Nombre"),
		    "Seleccione ...")%>
    <%=Html.ValidationMessage("EstadoPais") %>
</p>
<p>
    <label>Ciudad</label>
    <%=Html.TextBox("Ciudad", Model.Ciudad, new { @class = "input250-requerido", maxlength = 100 })%>
    <%=Html.ValidationMessage("Ciudad")%>
</p>