<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<LibroForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Editorial</label>
	<%=Html.DropDownList("EditorialLibro.Editorial", Model.Editoriales.CreateSelectList<EditorialForm>("Id", "Nombre"),
            "Seleccione ...")%>
</p>