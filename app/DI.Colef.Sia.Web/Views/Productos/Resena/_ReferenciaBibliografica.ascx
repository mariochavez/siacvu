<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ResenaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Volumen</label>
    <%=Html.TextBox("Volumen", Model.Volumen, new { @class = "input100", maxlength = 4 })%>
    <%=Html.ValidationMessage("Volumen")%>
</p>
<p>
    <label>N&uacute;mero</label>
    <%=Html.TextBox("Numero", Model.Numero, new { @class = "input100", maxlength = 4, size = 14 })%>
    <%=Html.ValidationMessage("Numero")%>										
</p>
<p>
    <label>De la p&aacute;gina</label>
    <%=Html.TextBox("PaginaInicial", Model.PaginaInicial, new { @class = "input100", maxlength = 4, size = 14 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("PaginaInicial")%>										
</p>
<p>
    <label>A la p&aacute;gina</label>
    <%=Html.TextBox("PaginaFinal", Model.PaginaFinal, new { @class = "input100", maxlength = 4, size = 14 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("PaginaFinal")%>
</p>