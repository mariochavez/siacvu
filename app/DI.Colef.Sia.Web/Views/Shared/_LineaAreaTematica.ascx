<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<BaseForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>

<p>
    <label>L&iacute;nea tem&aacute;tica institucional</label>
    <%=Html.DropDownList("LineaTematicaId", Model.LineasTematicas.CreateSelectList<CatalogoForm>("Id", "Nombre"),
            "Seleccione ...", new { @class = "cascade", rel = Url.Action("ChangeLineaTematica") })%>
</p>
<p>
    <label>&Aacute;rea tem&aacute;tica institucional</label>
    <%=Html.DropDownList("AreaTematicaId", Model.AreasTematicas.CreateSelectList<CatalogoForm>("Id", "Nombre"),
            "Seleccione ...")%>
</p>