<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ShowFieldsForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<h4>&Aacute;rea del conocimiento</h4>
<% if(!Model.IsShowForm){ %>
    <p>
        <label>&Aacute;rea</label>
        <%=Html.DropDownList("AreaId", Model.Areas.CreateSelectList<AreaForm>("Id", "Nombre"),
            "Seleccione ...", new { @class = "cascade", rel = Url.Action("ChangeArea") })%>
        <span class="cvu"></span>
        <%=Html.ValidationMessage("AreaId")%>
    </p>
    <p>
        <label>Disciplina</label>
        <%=Html.DropDownList("DisciplinaId", Model.Disciplinas.CreateSelectList<DisciplinaForm>("Id", "Nombre"),
            "Seleccione ...", new { @class = "cascade", rel = Url.Action("ChangeDisciplina") })%>
        <span class="cvu"></span>
        <%=Html.ValidationMessage("DisciplinaId")%>
    </p>
    <p>
        <label>Subdisciplina</label>
        <%=Html.DropDownList("SubdisciplinaId", Model.Subdisciplinas.CreateSelectList<SubdisciplinaForm>("Id", "Nombre"),
            "Seleccione ...")%>
        <span class="cvu"></span>
        <%=Html.ValidationMessage("SubdisciplinaId")%>
    </p> 
<% } else { %>
    <p>
        <label>&Aacute;rea</label>
        <span class="valor"><%= Html.Encode(Model.AreaNombre)%>&nbsp;</span>
    </p>
    <p>
        <label>Disciplina</label>
        <span class="valor"><%= Html.Encode(Model.DisciplinaNombre)%>&nbsp;</span>
    </p>
    <p>
        <label>Subdisciplina</label>
        <span class="valor"><%= Html.Encode(Model.SubdisciplinaNombre)%>&nbsp;</span>
    </p>
<% } %>