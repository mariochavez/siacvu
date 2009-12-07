<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true"
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<CapituloForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Productos"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DI.Colef.Sia.Web.Controllers" %>

<asp:Content ID="titleContent" ContentPlaceHolderID="TituloPlaceHolder" runat="server">
    <h2>
        <%=Html.Encode(Model.Title) %>
    </h2>
</asp:Content>

<asp:Content ID="introductionContent" ContentPlaceHolderID="IntroduccionPlaceHolder" runat="server">
    <div id="introduccion">
        <p>
            Aqu&iacute; se muestra la informaci&oacute;n detallada del cap&iacute;tulo como est&aacute; en el sistema.
		</p>
    </div><!--end introduccion-->
</asp:Content>

<asp:Content ID="sidebarContent" ContentPlaceHolderID="SidebarContentPlaceHolder" runat="server">
    <div id="barra">
        <div id="asistente">
            <h3>Asistente de secci&oacute;n</h3>
            <% Html.RenderPartial("_ShowSidebar"); %>
        </div><!--end asistente-->

    </div><!--end barra-->
</asp:Content>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div id="textos">

        <div id="forma">
            <div id="campos">
            
            <h4>Datos del investigador</h4>
	            <p>
                    <label>Departamento</label>
                    <span class="valor"><%= Html.Encode(Model.Form.DepartamentoNombre)%>&nbsp;</span>
                </p>
                <p>
                    <label>Sede</label>
                    <span class="valor"><%= Html.Encode(Model.Form.SedeNombre)%>&nbsp;</span>
                </p>
                
    <!-- DATOS DE LA PUBLICACION -->            
                <h4>Datos de la publicaci&oacute;n</h4>
                <p>
                    <label>Nombre del cap&iacute;tulo</label>
                    <span class="valor"><%= Html.Encode(Model.Form.NombreCapitulo) %>&nbsp;</span>
                </p>
                <p>
                    <label>Tipo de cap&iacute;tulo</label>
                    <span class="valor"><%= HumanizeHelper.TipoProducto(Model.Form.TipoCapitulo, 2)%>&nbsp;</span>
                </p>
                <p>
                    <label></label>
                    <span class="valor">¿Existe proyecto de investigaci&oacute;n de referencia? <%= HumanizeHelper.Boolean(Model.Form.TieneProyecto) %>&nbsp;</span>
                </p>
                <% if (Model.Form.TieneProyecto) { %>      
	                <% Html.RenderPartial("_ShowProyecto", Model.Form.ShowFields); %>
                <% } %>
                
                <% Html.RenderPartial("_ShowAreaTematica", Model.Form.ShowFields); %>
                
                <% if (Model.Form.SubdisciplinaId != 0) { %>
                	<% Html.RenderPartial("_ShowSubdisciplina", Model.Form.ShowFields); %>
                <% } %>
                
    <!-- Coautores de la publicacion -->            
	            <h4>Coautores de la publicaci&oacute;n</h4>
	            <% Html.RenderPartial("_ShowCoautorInterno", new CoautorForm { CoautoresInternos = Model.Form.CoautorInternoCapitulos, ModelId = Model.Form.Id } ); %>
				<% Html.RenderPartial("_ShowCoautorExterno", new CoautorForm { CoautoresExternos = Model.Form.CoautorExternoCapitulos, ModelId = Model.Form.Id }); %>
	            <p>
	                <label>Total de autores</label>
	                <span id="totalcoautores" class="valor"><%=Html.Encode(Model.Form.TotalAutores) %></span>	          
	            </p>
	            <p>
	                <label>Posici&oacute;n del autor</label>
                    <span class="valor"><%=Html.Encode(Model.Form.PosicionAutor)%>&nbsp;</span>
                </p>
                
    <!-- ESTATUS DE LA PUBLICACION -->
                <h4>Estatus de la publicaci&oacute;n</h4>
                <% Html.RenderPartial("_ShowEstadoProducto", Model.Form.ShowFields); %>
                
    <!-- REFERENCIA BIBLIOGRAFICA -->
                <% if (Model.Form.EstadoProducto == 3){ %>
                <h4>Referencia bibliogr&aacute;fica</h4>
                <p>
                    <label>Nombre del libro</label>
                    <span class="valor"><%= Html.Encode(Model.Form.NombreLibro)%>&nbsp;</span>
                </p>
                
                <h4>Autor(es) del libro</h4>
	            <% Html.RenderPartial("_ShowAutorInterno", new AutorForm { AutoresInternos = Model.Form.AutorInternoCapitulos, ModelId = Model.Form.Id }); %>
				<% Html.RenderPartial("_ShowAutorExterno", new AutorForm { AutoresExternos = Model.Form.AutorExternoCapitulos, ModelId = Model.Form.Id }); %>
				
				<p>
				    <label>Tipo de libro</label>
                    <span class="valor"><%= HumanizeHelper.TipoLibro(Model.Form.TipoLibro)%>&nbsp;</span>
				</p>
				
				<% Html.RenderPartial("_ShowEditorial", new EditorialForm { Editoriales = Model.Form.EditorialCapitulos, ModelId = Model.Form.Id }); %>
				
                <p>
                    <label>Resumen</label>
                    <span class="valor"><%= Html.Encode(Model.Form.Resumen)%>&nbsp;</span>
                </p>
                
                <p>
                    <label>Volumen</label>
                    <span class="valor"><%= Html.Encode(Model.Form.Volumen)%>&nbsp;</span>
                </p>
                <p>
                    <label>N&uacute;mero de p&aacute;ginas</label>
                    <span class="valor"><%= Html.Encode(Model.Form.NoPaginas)%>&nbsp;</span>
                </p>    
                <p>
                    <label>N&uacute;mero de citas</label>
                    <span class="valor"><%= Html.Encode(Model.Form.NoCitas)%>&nbsp;</span>
                </p>
                <% } %>      
                
                <p class="submit">
                    <%=Html.ActionLink<CapituloController>(x => x.Index(), "Regresar") %>
                </p>
            </div><!--end campos-->
        </div><!--end lista-->

    </div><!--end textos-->
    
<script type="text/javascript">
    $(document).ready(function() {
        setupDocument();
    });
</script>
</asp:Content>