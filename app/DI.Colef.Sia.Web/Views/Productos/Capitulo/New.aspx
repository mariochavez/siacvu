<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true"
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<CapituloForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Core"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Productos"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DI.Colef.Sia.Web.Controllers" %>
<asp:Content ID="titleContent" ContentPlaceHolderID="TituloPlaceHolder" runat="server">
    <h2>
        <%=Html.ProductoNewTitle(TipoProductoEnum.Capitulo) %>
    </h2>
</asp:Content>

<asp:Content ID="introductionContent" ContentPlaceHolderID="IntroduccionPlaceHolder" runat="server">
    <div id="introduccion">
        <p>
            <%=Html.ProductoNewMessage(TipoProductoEnum.Capitulo) %>
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
	
	        <% using (Html.BeginForm("Create", "Capitulo", FormMethod.Post, new{ @class = "remote"})) { %>
	            <%=Html.AntiForgeryToken() %>
	            <%=Html.Hidden("Id", Model.Form.Id) %>        
                
                <h4>Datos de la publicaci&oacute;n</h4>
                <% Html.RenderPartial("_DatosPublicacion", Model.Form); %>

	            <h4>Coautores del cap&iacute;tulo<span class="cvu"></span></h4>
                <% Html.RenderPartial("_AddButtons", new ShowFieldsForm { ModelId = Model.Form.Id, CheckboxName = "CoautorSeOrdenaAlfabeticamente", CheckboxValue = Model.Form.CoautorSeOrdenaAlfabeticamente, Rel = "NewCoautorInternoLink, NewCoautorExternoLink", SubFormName = "coautor", UrlActionExterno = "NewCoautorExterno", UrlActionInterno = "NewCoautorInterno", Link1Id = "NewCoautorInternoLink", Link2Id = "NewCoautorExternoLink" }); %>
				<% Html.RenderPartial("_EditCoautorInterno", new CoautorForm { CoautoresInternos = Model.Form.CoautorInternoCapitulos, ModelId = Model.Form.Id, CoautorSeOrdenaAlfabeticamente = Model.Form.CoautorSeOrdenaAlfabeticamente }); %>
	            <% Html.RenderPartial("_EditCoautorExterno", new CoautorForm { CoautoresExternos = Model.Form.CoautorExternoCapitulos, ModelId = Model.Form.Id, CoautorSeOrdenaAlfabeticamente = Model.Form.CoautorSeOrdenaAlfabeticamente }); %>
	            <% Html.RenderPartial("_CoautorEmptyListMessage", new CoautorForm { CoautoresExternos = Model.Form.CoautorExternoCapitulos, CoautoresInternos = Model.Form.CoautorInternoCapitulos }); %>
	            <p>
	                <label>Investigador</label>
	                <span class="valor"><%=Html.Encode(Model.Form.InvestigadorNombre1) %></span>
	            </p>
                <p id="CoautorSeOrdenaAlfabeticamente_field">
	                <label>Posici&oacute;n del coautor</label>
                    <%=Html.TextBox("PosicionCoautor", Model.Form.PosicionCoautor, new { @class = "input100-requerido", maxlength = 2 })%>
                    <span class="cvu"></span>
	                <%=Html.ValidationMessage("PosicionCoautor")%>
                </p>
	            <p>
	                <label>Total de investigadores</label>
	                <span id="totalcoautores" class="valor"><%=Html.Encode(Model.Form.TotalCoautores) %></span>
	                <span class="cvu"></span>
	            </p>
				
	            <% Html.RenderPartial("_ShowEstadoProducto", 
                    new ShowFieldsForm { EstadosProductos = Model.Form.EstadosProductos, FechaAceptacion = Model.Form.FechaAceptacion, 
                        FechaPublicacion = Model.Form.FechaPublicacion, IsShowForm = false, ModelId = Model.Form.Id, 
                        ComprobanteAceptadoId = Model.Form.ComprobanteAceptadoId, ComprobanteAceptadoNombre = Model.Form.ComprobanteAceptadoNombre}); %>
	            
	            <h4><span id="coautores" class="titulovalor">Compiladores</span> del libro</h4>
	            <% Html.RenderPartial("_AddButtons", new ShowFieldsForm { ModelId = Model.Form.Id, CheckboxName = "AutorSeOrdenaAlfabeticamente", CheckboxValue = Model.Form.CoautorSeOrdenaAlfabeticamente, Rel = "NewAutorInternoLink, NewAutorExternoLink", SubFormName = "autor", UrlActionExterno = "NewAutorExterno", UrlActionInterno = "NewAutorInterno", Link1Id = "NewAutorInternoLink", Link2Id = "NewAutorExternoLink" }); %>
                <% Html.RenderPartial("_EditAutorInterno", new AutorForm { AutoresInternos = Model.Form.AutorInternoCapitulos, ModelId = Model.Form.Id, AutorSeOrdenaAlfabeticamente = Model.Form.AutorSeOrdenaAlfabeticamente }); %>
                <% Html.RenderPartial("_EditAutorExterno", new AutorForm { AutoresExternos = Model.Form.AutorExternoCapitulos, ModelId = Model.Form.Id, AutorSeOrdenaAlfabeticamente = Model.Form.AutorSeOrdenaAlfabeticamente }); %>
                <% Html.RenderPartial("_AutorEmptyListMessage", new AutorForm { AutoresExternos = Model.Form.AutorExternoCapitulos, AutoresInternos = Model.Form.AutorInternoCapitulos }); %>
	            <p>
	                <label>Investigador</label>
	                <span class="valor"><%=Html.Encode(Model.Form.InvestigadorNombre1) %></span>
	            </p>
                <p id="AutorSeOrdenaAlfabeticamente_field">
	                <label>Posici&oacute;n del autor</label>
                    <%=Html.TextBox("PosicionAutor", Model.Form.PosicionAutor, new { @class = "input100-requerido", maxlength = 2 })%>
                    <span class="cvu"></span>
	                <%=Html.ValidationMessage("PosicionAutor")%>
                </p>
	            <p>
	                <label>Total de investigadores</label>
	                <span id="totalautores" class="valor"><%=Html.Encode(Model.Form.TotalAutores) %></span>
	                <span class="cvu"></span>
	            </p>

                <% Html.RenderPartial("_EditEditorial", new EditorialForm { Editoriales = Model.Form.EditorialCapitulos, ModelId = Model.Form.Id }); %>
	            
			    <div class="EstatusPublicado">
                    <% Html.RenderPartial("_ReferenciaBibliografica", Model.Form); %>
                </div>
				
                <p>
                    <label>Obra publicada</label>
                    <span id="span_comprobante_documento" class="valor">&nbsp;</span><br />
                </p>
                <div style="padding: 0 0 10px 20px">
                    <input type="file" name="ComprobanteCapitulo_DocumentoProbatorio" id="ComprobanteCapitulo_DocumentoProbatorio" class="fileUpload"/>
                </div>
                <div id="Comprobante_FileQueue" style="display:none;" rel="#span_comprobante_documento"></div>
                
                <% Html.RenderPartial("_DatosFinal", Model.Form); %>
				
				<% Html.RenderPartial("_ProgressBar"); %>
				
	            <p class="submit">
	                <%=Html.SubmitButton("Guardar", "Guardar cambios") %> &oacute; <%=Html.ActionLink<CapituloController>(x => x.Index(), "Regresar", new{id="regresar"})%>
	            </p>
	        <% } %>
	    </div>    <!--end forma-->
    
	</div><!--end textos-->

<script type="text/javascript">
    $(document).ready(function() {
        setupDocument();

        capituloSetup();
        setupOrden();

        var auth = "<% = Request.Cookies[FormsAuthentication.FormsCookieName]==null ? string.Empty : Request.Cookies[FormsAuthentication.FormsCookieName].Value %>";
        var uploader = '<%=ResolveUrl("~/Scripts/uploadify.swf") %>';
        var cancelImg = '<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>';
        var action = '<%=Url.Action("AddFile") %>';

        UploadFile.setup('#Aceptado_DocumentoProbatorio', 'Aceptado_FileQueue',
            uploader, cancelImg, action, auth);
        UploadFile.setup('#ComprobanteCapitulo_DocumentoProbatorio', 'Comprobante_FileQueue',
            uploader, cancelImg, action, auth);
    });
</script>

</asp:Content>
