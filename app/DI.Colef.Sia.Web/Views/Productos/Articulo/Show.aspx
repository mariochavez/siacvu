<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true"
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<ArticuloForm>>" %>
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
            Aqu&iacute; se muestra la informaci&oacute;n detallada del art&iacute;culo como est&aacute; en el sistema.
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
                    <span class="valor"><%=Html.Encode(Model.Form.DepartamentoNombre)%>&nbsp;</span>
                </p>
                <p>
                    <label>Sede</label>
                    <span class="valor"><%=Html.Encode(Model.Form.SedeNombre)%>&nbsp;</span>
                </p>
            
                <h4>Datos de la publicaci&oacute;n</h4>
                <p>
                    <label>Nombre del art&iacute;culo</label>
                    <span class="valor"><%=Html.Encode(Model.Form.Titulo)%>&nbsp;</span>
                </p>
                <p>
                    <label>Tipo de art&iacute;culo</label>
                    <span class="valor"><%= HumanizeHelper.TipoProducto(Model.Form.TipoArticulo, 1)%>&nbsp;</span>
                </p>
                <p>
                    <label></label>
                    <span class="valor">¿Existe proyecto de investigaci&oacute;n de referencia? <%= HumanizeHelper.Boolean(Model.Form.TieneProyecto) %>&nbsp;</span>
                </p>
                
                <% if (Model.Form.TieneProyecto) { %>                    
                    <% Html.RenderPartial("_ShowProyecto", Model.Form.ShowFields); %>
                <% } %>
                
                <% Html.RenderPartial("_ShowAreaTematica", Model.Form.ShowFields); %>
                
                <% Html.RenderPartial("_ShowPalabrasClave", Model.Form.ShowFields); %>
                
                <% if (Model.Form.SubdisciplinaId != 0) { %>
                	<% Html.RenderPartial("_ShowSubdisciplina", Model.Form.ShowFields); %>
                <% } %>
                
                <h4>Coautores de la publicaci&oacute;n</h4>
				<%
				    Html.RenderPartial("_ShowCoautorInterno",
				                       new CoautorForm
				                           {CoautoresInternos = Model.Form.CoautorInternoArticulos, ModelId = Model.Form.Id});%>
	            <%
				    Html.RenderPartial("_ShowCoautorExterno",
				                       new CoautorForm
				                           {CoautoresExternos = Model.Form.CoautorExternoArticulos, ModelId = Model.Form.Id});%>
	            <p>
	                <label>Total de autores</label>
	                <span id="totalcoautores" class="valor"><%=Html.Encode(Model.Form.TotalAutores)%></span>	          
	            </p>
	            
	            <p>
	                <label>Posici&oacute;n del autor</label>
                    <span class="valor"><%=Html.Encode(Model.Form.PosicionAutor)%>&nbsp;</span>
                </p>
                
                <h4>Estatus de la publicaci&oacute;n</h4>
                <% Html.RenderPartial("_ShowEstadoProducto", Model.Form.ShowFields); %>
                
                <% if (Model.Form.EstadoProducto == 3){ %>
                    
                    <h4>Referencia bibliogr&aacute;fica</h4>
                    <% if(Model.Form.RevistaPublicacionTitulo != ""){ %>
                        <% Html.RenderPartial("_ShowRevista", Model.Form.ShowFields); %>
                    <% } %>
                    <p>
                        <label>Volumen</label>
                        <span class="valor"><%= Html.Encode(Model.Form.Volumen)%>&nbsp;</span>
                    </p>
                    <p>
                        <label>N&uacute;mero</label>
                        <span class="valor"><%= Html.Encode(Model.Form.Numero)%>&nbsp;</span>
                    </p>
                    <p>
                        <label>De la p&aacute;gina</label>
                        <span class="valor"><%= Html.Encode(Model.Form.PaginaInicial)%>&nbsp;</span>
                    </p>
                    <p>    
                        <label>A la p&aacute;gina</label>
                        <span class="valor"><%= Html.Encode(Model.Form.PaginaFinal)%>&nbsp;</span>
                    </p>
                <% } %>
                
                <p class="submit">                    
                    <%= Html.ActionLink<ArticuloController>(x => x.Index(), "Regresar") %>
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