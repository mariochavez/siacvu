<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true"
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<ArticuloForm>>" %>
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
	        Favor de llenar los siguientes campos para dar de alta un nuevo art&iacute;culo dentro del sistema.
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
	
	        <% using (Html.BeginForm("Create", "Articulo")){ %>
	            <%=Html.AntiForgeryToken() %>
	            <%=Html.Hidden("Id", Model.Form.Id) %>
                
                <h4>Datos de la publicaci&oacute;n</h4>
                <p>
                    <label>Nombre del art&iacute;culo</label>
                    <%=Html.TextBox("Titulo", Model.Form.Titulo, new { @class = "input420-bold-requerido", maxlength = 100 })%>
                    <span class="cvu"></span>
                    <%=Html.ValidationMessage("Titulo")%>
                </p>
                <p>
                    <label>Tipo de art&iacute;culo</label>
                    <%=Html.DropDownList("TipoArticulo", Model.Form.TiposArticulos.CreateSelectList<TipoArticuloForm>("Id", "Nombre"),
                                        "Seleccione ...", new { @class = "tipo requerido" })%>
                    <span class="cvu"></span>
                    <%=Html.ValidationMessage("TipoArticulo") %>
                </p>
                
                <h4>Coautores<span class="cvu"></span></h4>
				<% Html.RenderPartial("_EditCoautorInterno", new CoautorForm { CoautoresInternos = Model.Form.CoautorInternoArticulos, ModelId = Model.Form.Id }); %>
	            <% Html.RenderPartial("_EditCoautorExterno", new CoautorForm { CoautoresExternos = Model.Form.CoautorExternoArticulos, ModelId = Model.Form.Id }); %>
	            <p>
	                <label>Autores</label>
	                <span id="totalcoautores" class="valor"><%=Html.Encode(Model.Form.TotalAutores) %></span>
	                <span class="cvu"></span>
	            </p>
	            
	            <% Html.RenderPartial("_DatosArticulo", Model.Form); %>
            
	            <h4 class="EstatusPublicado">Referencia bibliogr&aacute;fica</h4>
	            <% Html.RenderPartial("_ReferenciaBibliografica", Model.Form); %>
				
				<h4>Archivos</h4>
				<% Html.RenderPartial("_EditArchivo", new ArchivoForm { Archivos = Model.Form.ArchivoArticulos, ModelId = Model.Form.Id }); %>
            
	            <p class="submit">
	                <%=Html.SubmitButton("Guardar", "Guardar cambios") %> &oacute; <%=Html.ActionLink<ArticuloController>(x => x.Index(), "Regresar") %>
	            </p>
	        <% } %>
	    </div><!--end forma-->
    
	</div><!--end textos-->

<script type="text/javascript">
    $(document).ready(function() {
        setupDocument();

        articuloSetup();
    });
</script>

</asp:Content>
