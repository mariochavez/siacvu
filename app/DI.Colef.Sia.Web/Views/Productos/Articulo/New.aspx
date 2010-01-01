<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true"
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<ArticuloForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Productos"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DI.Colef.Sia.Web.Controllers" %>

<asp:Content ID="titleContent" ContentPlaceHolderID="TituloPlaceHolder" runat="server">
    <h2><%=Html.Encode(Model.Title) %></h2>
</asp:Content>

<asp:Content ID="introductionContent" ContentPlaceHolderID="IntroduccionPlaceHolder" runat="server">
	<div id="introduccion">
	    <p>
	        Favor de llenar los siguientes campos para dar de alta un nuevo art&iacute;culo en revistas de investigaci&oacute;n dentro del sistema.
	    </p>
	</div><!--end introduccion-->
</asp:Content>

<asp:Content ID="sidebarContent" ContentPlaceHolderID="SidebarContentPlaceHolder" runat="server">
	<div id="barra">
	    <div id="asistente">
	        <h3>Asistente de secci&oacute;n</h3>
	        <% Html.RenderPartial("_NewSidebar"); %>
	    </div><!--end asistente-->

	</div><!--end barra-->
</asp:Content>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
	<div id="textos">
	
	    <% Html.RenderPartial("_Message"); %>    
	    <div id="forma">
	
	        <% using (Html.BeginForm("Create", "Articulo", FormMethod.Post, new { @class = "remote" })){ %>
	            <%=Html.AntiForgeryToken() %>
	            <%=Html.Hidden("Id", Model.Form.Id) %>
                
                <h4>Datos de la publicaci&oacute;n</h4>
                <% Html.RenderPartial("_DatosPublicacion", Model.Form); %>                

                <h4>Coautores del art&iacute;culo<span class="cvu"></span></h4>
                <% Html.RenderPartial("_AddCoautoresButtons", new CoautorForm { ModelId = Model.Form.Id, EsAlfabeticamente = Model.Form.EsAlfabeticamente}); %>
				<% Html.RenderPartial("_EditCoautorInterno", new CoautorForm { CoautoresInternos = Model.Form.CoautorInternoArticulos }); %>
	            <% Html.RenderPartial("_EditCoautorExterno", new CoautorForm { CoautoresExternos = Model.Form.CoautorExternoArticulos }); %>
	            <% Html.RenderPartial("_CoautorEmptyListMessage", new CoautorForm { CoautoresExternos = Model.Form.CoautorExternoArticulos, CoautoresInternos = Model.Form.CoautorInternoArticulos }); %>
	            <p>
	                <label>Due&ntilde;o del producto</label>
	                <span class="valor"><%=Html.Encode(Model.Form.InvestigadorNombre1) %></span>
	            </p>
                <p id="EsAlfabeticamente_field">
	                <label>Posici&oacute;n del investigador</label>
                    <%=Html.TextBox("PosicionAutor", Model.Form.PosicionAutor, new { @class = "input100-requerido", maxlength = 2 })%>
                    <span class="cvu"></span>
	                <%=Html.ValidationMessage("PosicionAutor")%>
                </p>
	            <p>
	                <label>Total de investigadores</label>
	                <span id="totalcoautores" class="valor"><%=Html.Encode(Model.Form.TotalAutores) %></span>
	                <span class="cvu"></span>
	            </p>
	            
	            <% Html.RenderPartial("_ShowEstadoProducto", 
                    new ShowFieldsForm { EstadosProductos = Model.Form.EstadosProductos, FechaAceptacion = Model.Form.FechaAceptacion, 
                        FechaPublicacion = Model.Form.FechaPublicacion, IsShowForm = false, ModelId = Model.Form.Id, 
                        ComprobanteAceptadoId = Model.Form.ComprobanteAceptadoId, ComprobanteAceptadoNombre = Model.Form.ComprobanteAceptadoNombre}); %>
                
                <% Html.RenderPartial("_ShowRevista", new ShowFieldsForm { RevistaPublicacionId = Model.Form.RevistaPublicacionId, RevistaPublicacionTitulo = Model.Form.RevistaPublicacionTitulo, RevistaLabel = "Nombre de la revista", IsShowForm = false, UrlAction = "SearchFilteredRevista", Rel = "#TipoArticulo" }); %>
                
                <div class="EstatusPublicado">
                    <% Html.RenderPartial("_ReferenciaBibliografica", Model.Form); %>
                </div>
                
                <p>
                    <label>Obra publicada</label>
                    <span id="span_comprobante_documento" class="valor">&nbsp;</span><br />
                </p>
                <div style="padding: 0 0 10px 20px">
                    <input type="file" name="ComprobanteArticulo_DocumentoProbatorio" id="ComprobanteArticulo_DocumentoProbatorio" class="fileUpload"/>
                </div>
                <div id="Comprobante_FileQueue" style="display:none;" rel="#span_comprobante_documento"></div>
                
                <% Html.RenderPartial("_DatosFinal", Model.Form); %>
				
				<% Html.RenderPartial("_ProgressBar"); %>
            
	            <p class="submit">
	                <%=Html.SubmitButton("Guardar", "Guardar cambios") %> &oacute; <%=Html.ActionLink<ArticuloController>(x => x.Index(), "Regresar", new { id = "regresar" })%>
	            </p>
	        <% } %>
	    </div><!--end forma-->
    
	</div><!--end textos-->

<script type="text/javascript">
    $(document).ready(function() {
        setupDocument();

        articuloSetup();
        setupOrdenCoautores();

        var auth = "<% = Request.Cookies[FormsAuthentication.FormsCookieName]==null ? string.Empty : Request.Cookies[FormsAuthentication.FormsCookieName].Value %>";
        var uploader = '<%=ResolveUrl("~/Scripts/uploadify.swf") %>';
        var cancelImg = '<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>';
        var action = '<%=Url.Action("AddFile") %>';

        UploadFile.setup('#Aceptado_DocumentoProbatorio', 'Aceptado_FileQueue',
            uploader, cancelImg, action, auth);
        UploadFile.setup('#ComprobanteArticulo_DocumentoProbatorio', 'Comprobante_FileQueue',
            uploader, cancelImg, action, auth);
    });
</script>

</asp:Content>
