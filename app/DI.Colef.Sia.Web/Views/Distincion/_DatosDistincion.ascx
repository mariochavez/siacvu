<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<DistincionForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Tipo Distincion:</label>
    
    <%=Html.DropDownList("TipoDistincion", Model.TiposDistinciones.CreateSelectList<TipoDistincionForm>("Id", "Nombre"),
		    "Seleccione ...")%>
    <%=Html.ValidationMessage("TipoDistincion") %>
</p>
<p>
    <label>Descripcion:</label>

    <%=Html.TextBox("Descripcion", Model.Descripcion, new { @class = "input250-requerido", maxlength = 100 })%>
    <%=Html.ValidationMessage("Descripcion")%>
</p>
<p>
    <label>Fecha Otorgamiento:</label>

    <%=Html.TextBox("FechaOtorgamiento", Model.FechaOtorgamiento, new { @class = "datetime input100", maxlength = 10 })%>
    <span class="helper_message">(Formato dd/mm/yyyy)</span>
    <%=Html.ValidationMessage("FechaOtorgamiento")%>
</p>
<p>
    <label>Institucion:</label>

    <%=Html.DropDownList("Institucion", Model.Instituciones.CreateSelectList<InstitucionForm>("Id", "Nombre"),
		    "Seleccione ...")%>
    <%=Html.ValidationMessage("Institucion") %>
</p>
<p>
    <label>Ambito:</label>
  
    <%=Html.DropDownList("Ambito", Model.Ambitos.CreateSelectList<AmbitoForm>("Id", "Nombre"),
		    "Seleccione ...")%>
    <%=Html.ValidationMessage("Ambito") %>
</p>
<p>
    <label>Pais:</label>

    <%=Html.DropDownList("Pais", Model.Paises.CreateSelectList<PaisForm>("Id", "Nombre"),
		    "Seleccione ...")%>
    <%=Html.ValidationMessage("Pais") %>
</p>
<p>
    <label>Estado:</label>
  
    <%=Html.DropDownList("EstadoPais", Model.EstadosPaises.CreateSelectList<EstadoPaisForm>("Id", "Nombre"),
		    "Seleccione ...")%>
    <%=Html.ValidationMessage("EstadoPais") %>
</p>
<p>
    <label>Ciudad:</label>
   
    <%=Html.TextBox("Ciudad", Model.Ciudad, new { @class = "input250", maxlength = 100 })%>
    <%=Html.ValidationMessage("Ciudad")%>
</p>