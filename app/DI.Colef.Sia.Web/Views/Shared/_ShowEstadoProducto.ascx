<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ShowFieldsForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<h4>Estatus de la publicaci&oacute;n</h4>
<% if(!Model.IsShowForm){ %>
    <p>
        <label>Estatus de la publicaci&oacute;n</label>
        <%=Html.DropDownList("EstadoProducto", Model.EstadosProductos.CreateSelectList<CustomSelectForm>("Id", "Nombre"),
            "Seleccione ...", new { @class = "requerido" })%>
        <%=Html.ValidationMessage("EstadoProducto")%>
    </p>
    <p class="EstatusAceptado">
        <label>A&ntilde;o de aceptaci&oacute;n</label>
        <%=Html.TextBox("FechaAceptacion", Model.FechaAceptacion, new { @class = "input100-requerido", maxlength = 4 })%>
        <span>(Formato yyyy)</span>
        <%=Html.ValidationMessage("FechaAceptacion")%>
    </p>
    <p class="EstatusPublicado">
        <label>A&ntilde;o de publicaci&oacute;n</label>
        <%=Html.TextBox("FechaPublicacion", Model.FechaPublicacion, new { @class = "input100-requerido", maxlength = 4 })%>
        <span>(Formato yyyy)</span>
        <%=Html.ValidationMessage("FechaPublicacion")%>
    </p>
    <div id="documentoprobatorio_field">        
        <p>
            <label>Carta de aceptaci&oacute;n</label>
            <span id="span_aceptado_documento" class="valor">
                <% if(Model.ModelId != 0){ %>
                    <%if(!String.IsNullOrEmpty(Model.ComprobanteAceptadoNombre)) { %> 
	                    <%=Html.ActionLink<ArchivoController>(x => x.Show(Model.ComprobanteAceptadoId), Model.ComprobanteAceptadoNombre, new { target = "_blank" })%> 
	                <% }else{ %>
	                    &nbsp;
	                <% } %>
                <% } else { %>
                    &nbsp;
                <% } %>
            </span><br />
        </p>
        <div style="padding: 0 0 10px 20px">
            <input type="file" name="Aceptado_DocumentoProbatorio" id="Aceptado_DocumentoProbatorio" class="fileUpload"/>
        </div>
    </div> 
    <div id="Aceptado_FileQueue" style="display:none;" rel="#span_aceptado_documento"></div>
<% } else { %>
    <p>
        <label>Estatus de la publicaci&oacute;n</label>
        <span class="valor"><%= HumanizeHelper.EstadoProducto(Model.EstadoProducto)%>&nbsp;</span>
    </p>
    <% if (Model.EstadoProducto == 2) { %>
        <p>
            <label>A&ntilde;o de aceptaci&oacute;n</label>
            <span class="valor"><%= Html.Encode(Model.FechaAceptacion)%>&nbsp;</span>
            <span>Formato (yyyy)</span>
        </p>        
    <% } if (Model.EstadoProducto == 3){ %>
        <p>
            <label>A&ntilde;o de publicaci&oacute;n</label>
            <span class="valor"><%= Html.Encode(Model.FechaPublicacion)%>&nbsp;</span>
            <span>Formato (yyyy)</span>
        </p>
    <% } %>
    <p>
        <label>Carta de aceptaci&oacute;n</label>
        <span class="valor">
            <% if(Model.ModelId != 0){ %>
                <%if(!String.IsNullOrEmpty(Model.ComprobanteAceptadoNombre)) { %> 
                    <%=Html.ActionLink<ArchivoController>(x => x.Show(Model.ComprobanteAceptadoId), Model.ComprobanteAceptadoNombre, new { target = "_blank" })%> 
                <% }else{ %>
                    &nbsp;
                <% } %>
            <% } else { %>
                &nbsp;
            <% } %>
        </span><br />
    </p>
<% } %>