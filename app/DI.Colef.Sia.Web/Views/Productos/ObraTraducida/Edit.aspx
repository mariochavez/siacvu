<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true" 
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<ObraTraducidaForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Productos"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<%@ Import Namespace="DI.Colef.Sia.Web.Controllers" %>

<asp:Content ID="titleContent" ContentPlaceHolderID="TituloPlaceHolder" runat="server">
    <h2><%=Html.Encode(Model.Title) %></h2>
</asp:Content>

<asp:Content ID="introductionContent" ContentPlaceHolderID="IntroduccionPlaceHolder" runat="server">
    <div id="introduccion">
        <p>
            Para modificar la obra traducida utilice los siguientes campos para realizar cambios dentro del sistema.
		</p>
    </div><!--end introduccion-->
</asp:Content>

<asp:Content ID="sidebarContent" ContentPlaceHolderID="SidebarContentPlaceHolder" runat="server">
    <div id="barra">
        <div id="asistente">
            <% if(User.IsInRole("Investigadores")){ %>
                <% if(Model.Form.FirmaAceptacion2 == 2){ %>
                    <h3>&Aacute;rea de validaci&oacute;n de producto</h3>
                    <p>Motivo del rechazo: <%=Html.Encode(Model.Form.FirmaDescripcion)%></p>
                <% } %>
            <% } %>
	        <% if(User.IsInRole("DGAA")){ %>
	            <h3>&Aacute;rea de validaci&oacute;n de producto</h3>
	            <% Html.RenderPartial("_FirmaForm", new FirmaForm { Id = Model.Form.Id, IdName = "ObraTraducidaId", Controller = "ObraTraducida", TipoProducto = 20 }); %>
	        <% } %>
            <h3>Asistente de secci&oacute;n</h3>
            <% Html.RenderPartial("_EditSidebar"); %>
        </div><!--end asistente-->
    </div><!--end barra-->
</asp:Content>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
	<div id="textos">
	
	    <% Html.RenderPartial("_Message"); %>    
	    
	    <div id="forma">
	        <% using (Html.BeginForm("Update", "ObraTraducida", FormMethod.Post, new { @class = "remote" })){ %>
	            <%=Html.AntiForgeryToken() %>
				<%=Html.Hidden("Id", Model.Form.Id) %>
				
                <h4>Datos de la publicaci&oacute;n</h4>
                <% Html.RenderPartial("_DatosPublicacion", Model.Form); %>

	            <h4>Coautores de la publicaci&oacute;n<span class="cvu"></span></h4>
	            <% Html.RenderPartial("_EditCoautorInterno", new CoautorForm { CoautoresInternos = Model.Form.CoautorInternoObraTraducidas, ModelId = Model.Form.Id } ); %>
				<% Html.RenderPartial("_EditCoautorExterno", new CoautorForm { CoautoresExternos = Model.Form.CoautorExternoObraTraducidas, ModelId = Model.Form.Id }); %>
	            <p>
	                <label>Total de autores</label>
	                <span id="totalcoautores" class="valor"><%=Html.Encode(Model.Form.TotalAutores) %></span>
	                <span class="cvu"></span>
	            </p>
                <p>
	                <label>Posici&oacute;n del autor</label>
                    <%=Html.TextBox("PosicionAutor", Model.Form.PosicionAutor, new { @class = "input100-requerido", maxlength = 2 })%>
                    <span class="cvu"></span>
	                <%=Html.ValidationMessage("PosicionAutor")%>
                </p>
				
				<h4>Estatus de la publicaci&oacute;n</h4>
	            <% Html.RenderPartial("_ShowEstadoProducto", 
                    new ShowFieldsForm { EstadosProductos = Model.Form.EstadosProductos, FechaAceptacion = Model.Form.FechaAceptacion, 
                        FechaPublicacion = Model.Form.FechaPublicacion, IsShowForm = false, ModelId = Model.Form.Id, 
                        ComprobanteAceptadoId = Model.Form.ComprobanteAceptadoId, ComprobanteAceptadoNombre = Model.Form.ComprobanteAceptadoNombre,
                        ComprobantePublicadoId = Model.Form.ComprobantePublicadoId, ComprobantePublicadoNombre = Model.Form.ComprobantePublicadoNombre}); %>
	            
	            <div id="TipoObraTraducida_fields">
	                <h4>Referencia bibliogr&aacute;fica</h4>
				    <% Html.RenderPartial("_ReferenciaBibliografica", Model.Form); %>
                </div>
	            
                <p>
                    <label>Documento probatorio</label>
                    <span id="span_comprobante_documento" class="valor">
                        <%if(!String.IsNullOrEmpty(Model.Form.ComprobanteObraTraducidaNombre)) { %> 
    	                    <%=Html.ActionLink<ArchivoController>(x => x.Show(Model.Form.ComprobanteObraTraducidaId), Model.Form.ComprobanteObraTraducidaNombre, new { target = "_blank" })%> 
    	                <% } else { %>
    	                    &nbsp;
    	                <% } %>
                    </span><br />
                </p>
                <div style="padding: 0 0 10px 20px">
                    <input type="file" name="ComprobanteObraTraducida_DocumentoProbatorio" id="ComprobanteObraTraducida_DocumentoProbatorio" class="fileUpload"/>
                </div>
                <div id="Comprobante_FileQueue" style="display:none;" rel="#span_comprobante_documento"></div>
                
                <% Html.RenderPartial("_ProgressBar"); %>
	            
	            <p class="submit">
	                <%=Html.SubmitButton("Guardar", "Guardar Cambios") %> &oacute; <%=Html.ActionLink<ObraTraducidaController>(x => x.Index(), "Regresar", new { id = "regresar" })%>
	            </p>
	        <% } %>
	    </div><!--end forma-->
    
	</div><!--end textos-->
    
<script type="text/javascript">
    $(document).ready(function() {
        setupDocument();
        obraTraducidaSetup();

        var auth = "<% = Request.Cookies[FormsAuthentication.FormsCookieName]==null ? string.Empty : Request.Cookies[FormsAuthentication.FormsCookieName].Value %>";
        var uploader = '<%=ResolveUrl("~/Scripts/uploadify.swf") %>';
        var cancelImg = '<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>';
        var action = '<%=Url.Action("AddFile") %>';

        UploadFile.setup('#Aceptado_DocumentoProbatorio', 'Aceptado_FileQueue',
            uploader, cancelImg, action, auth);
        UploadFile.setup('#Publicado_DocumentoProbatorio', 'Publicado_FileQueue',
            uploader, cancelImg, action, auth);
        UploadFile.setup('#ComprobanteObraTraducida_DocumentoProbatorio', 'Comprobante_FileQueue',
            uploader, cancelImg, action, auth);
    });
</script>
</asp:Content>