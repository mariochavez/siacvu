<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ArticuloForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<p>
    <label>Volumen</label>
    <%=Html.TextBox("Volumen", Model.Volumen, new { @class = "input100-requerido", maxlength = 10 })%>
    <%=Html.ValidationMessage("Volumen")%>
</p>
<p>
    <label>N&uacute;mero</label>
    <%=Html.TextBox("Numero", Model.Numero, new { @class = "input100-requerido", maxlength = 4 })%>
    <%=Html.ValidationMessage("Numero")%>
</p>
<p class="EstatusPublicado">
    <label>P&aacute;gina inicial</label> 
    <%=Html.TextBox("PaginaInicial", Model.PaginaInicial, new { @class = "input100-requerido", maxlength = 4, size = 14 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("PaginaInicial")%>
</p>
<p class="EstatusPublicado">    
    <label>P&aacute;gina final</label>
    <%=Html.TextBox("PaginaFinal", Model.PaginaFinal, new { @class = "input100-requerido", maxlength = 4, size = 14 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("PaginaFinal")%>
</p>
<%if(Model.Id != 0){ %>
    <p>
        <label>A&ntilde;o de publicaci&oacute;n</label>
        <%=Html.Encode(Model.AnioPublicacion) %>
        <span class="cvu"></span>
    </p>
<% } %>
<p>
    <label>Fecha de edici&oacute;n</label>    
    <%=Html.TextBox("FechaEdicion", Model.FechaEdicion, new { @class = "datetime input100-requerido", maxlength = 10 })%>
    <span>(Formato dd/mm/yyyy)</span>
    <%=Html.ValidationMessage("FechaEdicion")%>
</p>
<p>
    <label></label>
    <%= Html.CheckBox("ArticuloTraducido", Model.ArticuloTraducido)%> Art&iacute;culo traducido a otro idioma?
    <%=Html.ValidationMessage("ArticuloTraducido")%>
</p>
<p id="idioma_field">
    <label>Idioma al que se tradujo</label>
    <%=Html.DropDownList("Idioma", Model.Idiomas.CreateSelectList<IdiomaForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("Idioma") %>
</p>