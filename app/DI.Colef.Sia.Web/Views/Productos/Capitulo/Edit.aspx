<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true" 
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<CapituloForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Core"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Productos" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>

<asp:Content ID="titleContent" ContentPlaceHolderID="TituloPlaceHolder" runat="server">
    <h2>
        <%=Html.ProductoEditTitle(TipoProductoEnum.Capitulo) %>
    </h2>
</asp:Content>

<asp:Content ID="introductionContent" ContentPlaceHolderID="IntroduccionPlaceHolder" runat="server">
    <div id="introduccion">
        <p>
            <%=Html.ProductoEditMessage(TipoProductoEnum.Capitulo) %>
        </p>
    </div><!--end introduccion-->
</asp:Content>

<asp:Content ID="sidebarContent" ContentPlaceHolderID="SidebarContentPlaceHolder" runat="server">
</asp:Content>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
	<div id="textos">
	
	    <% Html.RenderPartial("_Message"); %>

        <% if(User.IsInRole("Investigadores")){ %>
			<% Html.RenderPartial("_FirmaMessage", Model.Form); %>
        <% } %>
	      
	    <div id="forma">

	        <% using (Html.BeginForm("Update", "Capitulo", FormMethod.Post, new{ @class = "remote"})) { %>
	            <%=Html.AntiForgeryToken() %>
	            <%=Html.Hidden("Id", Model.Form.Id) %>
                <%=Html.Hidden("Contexto", "capitulo", new { url = Url.Action("Glosario") })%>

	            <h4>Datos de la publicaci&oacute;n</h4>
                <% Html.RenderPartial("_DatosPublicacion", Model.Form); %>
	            
            <h4>
                <a href="#coautores_area" class="collapsable <%=Html.CollapsePanelClass(Model.Form.CoautorExternoCapitulos.Length + Model.Form.CoautorInternoCapitulos.Length) %>">
                    <span class="ui-icon ui-icon-circle-arrow-s"></span>
                    Coautor(es) del cap&iacute;tulo
                    <span>
                        <%=Html.Encode(Model.Form.CoautorExternoCapitulos.Length + Model.Form.CoautorInternoCapitulos.Length)%> coautor(es) 
                    </span>
                    <span class="cvu"></span>
                </a>
            </h4>
            <span id="coautores_area" >
                <% Html.RenderPartial("_AddButtons", new ShowFieldsForm { ModelId = Model.Form.Id, CheckboxName = "CoautorSeOrdenaAlfabeticamente", CheckboxValue = Model.Form.CoautorSeOrdenaAlfabeticamente, Rel = "NewCoautorInternoLink, NewCoautorExternoLink", SubFormName = "coautor", UrlActionExterno = "NewCoautorExterno", UrlActionInterno = "NewCoautorInterno", Link1Id = "NewCoautorInternoLink", Link2Id = "NewCoautorExternoLink" }); %>
                <% Html.RenderPartial("_EditCoautorInterno", new CoautorForm { CoautoresInternos = Model.Form.CoautorInternoCapitulos, ModelId = Model.Form.Id, CoautorSeOrdenaAlfabeticamente = Model.Form.CoautorSeOrdenaAlfabeticamente }); %>
                <% Html.RenderPartial("_EditCoautorExterno", new CoautorForm { CoautoresExternos = Model.Form.CoautorExternoCapitulos, ModelId = Model.Form.Id, CoautorSeOrdenaAlfabeticamente = Model.Form.CoautorSeOrdenaAlfabeticamente }); %>
                <% Html.RenderPartial("_CoautorEmptyListMessage", new CoautorForm { CoautoresExternos = Model.Form.CoautorExternoCapitulos, CoautoresInternos = Model.Form.CoautorInternoCapitulos }); %>
                <% Html.RenderPartial("_AutorEntry", Model.Form); %>
            </span>
				
	            <% Html.RenderPartial("_ShowEstadoProducto", 
                    new ShowFieldsForm { EstadosProductos = Model.Form.EstadosProductos, FechaAceptacion = Model.Form.FechaAceptacion, 
                        FechaPublicacion = Model.Form.FechaPublicacion, IsShowForm = false, ModelId = Model.Form.Id}); %>
	            
	            <h4><span id="coautores" class="titulovalor">Compiladores</span> del libro</h4>
	            <% Html.RenderPartial("_AddButtons", new ShowFieldsForm { ModelId = Model.Form.Id, CheckboxName = "AutorSeOrdenaAlfabeticamente", CheckboxValue = Model.Form.CoautorSeOrdenaAlfabeticamente, Rel = "NewAutorInternoLink, NewAutorExternoLink", SubFormName = "autor", UrlActionExterno = "NewAutorExterno", UrlActionInterno = "NewAutorInterno", Link1Id = "NewAutorInternoLink", Link2Id = "NewAutorExternoLink" }); %>
                <% Html.RenderPartial("_EditAutorInterno", new AutorForm { AutoresInternos = Model.Form.AutorInternoCapitulos, ModelId = Model.Form.Id, AutorSeOrdenaAlfabeticamente = Model.Form.AutorSeOrdenaAlfabeticamente }); %>
                <% Html.RenderPartial("_EditAutorExterno", new AutorForm { AutoresExternos = Model.Form.AutorExternoCapitulos, ModelId = Model.Form.Id, AutorSeOrdenaAlfabeticamente = Model.Form.AutorSeOrdenaAlfabeticamente }); %>
                <% Html.RenderPartial("_AutorEmptyListMessage", new AutorForm { AutoresExternos = Model.Form.AutorExternoCapitulos, AutoresInternos = Model.Form.AutorInternoCapitulos }); %>

                <% Html.RenderPartial("_EditEditorial", Model.Form); %> 
	            
	            <div class="EstatusPublicado">
                    <% Html.RenderPartial("_ReferenciaBibliografica", Model.Form); %>
                </div>
                <h4>&aacute;rea del conocimiento</h4>
                <% Html.RenderPartial("_DatosFinal", Model.Form); %>
                <% Html.RenderPartial("_EditArchivo", Model.Form); %>
                <% Html.RenderPartial("_ProgressBar"); %>
            
	            <p class="submit">
	                <%=Html.SubmitButton("Guardar", "Guardar cambios") %> &oacute; <%=Html.ActionLink<CapituloController>(x => x.Index(), "Regresar", new{id="regresar"})%>
	            </p>
	        <% } %>
	    </div><!--end forma-->
    
    	<% if(User.IsInRole("DGAA")){ %>    
        	<% Html.RenderPartial("_FirmaForm", new FirmaForm{Id = Model.Form.Id, IdName = "ArticuloId", Controller = "Articulo", TipoProducto = 1}); %>
        <% } %>Compiladores
            
	</div><!--end textos-->
    
<script type="text/javascript">
    $(document).ready(function() {
        setupDocument();

        capituloSetup();
        setupOrden();

        var auth = "<% = Request.Cookies[FormsAuthentication.FormsCookieName]==null ? string.Empty : Request.Cookies[FormsAuthentication.FormsCookieName].Value %>";
        var uploader = '<%=ResolveUrl("~/Scripts/uploadify.swf") %>';
        var cancelImg = '<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>';
        var uploadImg = '<%=ResolveUrl("~/Content/Images/adjuntar.png") %>';
        var action = '<%=Url.Action("AddFile") %>';

        UploadMulti.setup('#uploadify', 'fileQueue', uploader, cancelImg, uploadImg, action, auth);
    });
</script>
</asp:Content>
