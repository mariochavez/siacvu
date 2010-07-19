<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true" 
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<ObraTraducidaForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Core"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Productos"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<%@ Import Namespace="DI.Colef.Sia.Web.Controllers" %>

<asp:Content ID="titleContent" ContentPlaceHolderID="TituloPlaceHolder" runat="server">
    <h2>
        <%=Html.ProductoEditTitle(TipoProductoEnum.ObraTraducida) %>
    </h2>
</asp:Content>

<asp:Content ID="introductionContent" ContentPlaceHolderID="IntroduccionPlaceHolder" runat="server">
    <div id="introduccion">
        <p>
            <%=Html.ProductoEditMessage(TipoProductoEnum.ObraTraducida) %>
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
	        <% using (Html.BeginForm("Update", "ObraTraducida", FormMethod.Post, new { @class = "remote" })){ %>
	            <%=Html.AntiForgeryToken() %>
				<%=Html.Hidden("Id", Model.Form.Id) %>
                <%=Html.Hidden("Contexto", "obraTraducida", new { url = Url.Action("Glosario") })%>
				
                <h4>Datos de la publicaci&oacute;n</h4>
                <% Html.RenderPartial("_DatosPublicacion", Model.Form); %>

            <h4>
                <a href="#coautores_area" class="collapsable <%=Html.CollapsePanelClass(Model.Form.CoautorExternoObraTraducidas.Length + Model.Form.CoautorInternoObraTraducidas.Length) %>">
                    <span class="ui-icon ui-icon-circle-arrow-s"></span>Coautor(es)<!-- de la obra traducida-->
                    <span>
                        <%=Html.Encode(Model.Form.CoautorExternoObraTraducidas.Length + Model.Form.CoautorInternoObraTraducidas.Length)%>
                        coautor(es) </span><span class="cvu"></span></a>
            </h4>
            <span id="coautores_area" class="titulovalor">
                <% Html.RenderPartial("_AddButtons", new ShowFieldsForm { ModelId = Model.Form.Id, CheckboxName = "CoautorSeOrdenaAlfabeticamente", CheckboxValue = Model.Form.CoautorSeOrdenaAlfabeticamente, Rel = "NewCoautorInternoLink, NewCoautorExternoLink", SubFormName = "coautor", UrlActionExterno = "NewCoautorExterno", UrlActionInterno = "NewCoautorInterno", Link1Id = "NewCoautorInternoLink", Link2Id = "NewCoautorExternoLink" }); %>
                <% Html.RenderPartial("_EditCoautorInterno", new CoautorForm { CoautoresInternos = Model.Form.CoautorInternoObraTraducidas, ModelId = Model.Form.Id, CoautorSeOrdenaAlfabeticamente = Model.Form.CoautorSeOrdenaAlfabeticamente }); %>
                <% Html.RenderPartial("_EditCoautorExterno", new CoautorForm { CoautoresExternos = Model.Form.CoautorExternoObraTraducidas, ModelId = Model.Form.Id, CoautorSeOrdenaAlfabeticamente = Model.Form.CoautorSeOrdenaAlfabeticamente }); %>
                <% Html.RenderPartial("_CoautorEmptyListMessage", new CoautorForm { CoautoresExternos = Model.Form.CoautorExternoObraTraducidas, CoautoresInternos = Model.Form.CoautorInternoObraTraducidas }); %>
            </span>
				
	            <% Html.RenderPartial("_ShowEstadoProducto", 
                    new ShowFieldsForm { EstadosProductos = Model.Form.EstadosProductos, FechaAceptacion = Model.Form.FechaAceptacion, 
                        FechaPublicacion = Model.Form.FechaPublicacion, IsShowForm = false, ModelId = Model.Form.Id}); %>
	            
	            <div id="TipoObraTraducida_fields">	                
				    <% Html.RenderPartial("_ReferenciaBibliografica", Model.Form); %>
                </div>
                
              
                <h4>&aacute;rea del conocimiento</h4>
                
                <% Html.RenderPartial("_LineaAreaTematica", Model.Form); %>
                <% Html.RenderPartial("_ShowPalabrasClave", new ShowFieldsForm { PalabraClave1 = Model.Form.PalabraClave1, PalabraClave2 = Model.Form.PalabraClave2, PalabraClave3 = Model.Form.PalabraClave3, IsShowForm = false }); %>
                  <% Html.RenderPartial("_EditArchivo", Model.Form); %>
                <% Html.RenderPartial("_ProgressBar"); %>
	            
	            <p class="submit">
	                <%=Html.SubmitButton("Guardar", "Guardar Cambios") %> &oacute; <%=Html.ActionLink<ObraTraducidaController>(x => x.Index(), "Regresar", new { id = "regresar" })%>
	            </p>
	        <% } %>
	    </div><!--end forma-->

	        <% if(User.IsInRole("DGAA")){ %>    
            	<% Html.RenderPartial("_FirmaForm", new FirmaForm{Id = Model.Form.Id, IdName = "ArticuloId", Controller = "Articulo", TipoProducto = 1}); %>
            <% } %>
                
	</div><!--end textos-->
    
<script type="text/javascript">
    $(document).ready(function() {
        setupDocument();
        obraTraducidaSetup();
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