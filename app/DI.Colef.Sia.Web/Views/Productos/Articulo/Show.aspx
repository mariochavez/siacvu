<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true"
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<ArticuloForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Core"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Productos"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DI.Colef.Sia.Web.Controllers" %>

<asp:Content ID="titleContent" ContentPlaceHolderID="TituloPlaceHolder" runat="server">
    <h2>
        <%=Html.ProductoShowTitle(TipoProductoEnum.Articulo) %>
    </h2>
</asp:Content>

<asp:Content ID="introductionContent" ContentPlaceHolderID="IntroduccionPlaceHolder" runat="server">
    <div id="introduccion">
        <p>
            <%=Html.ProductoShowMessage(TipoProductoEnum.Articulo) %>
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
                    <label>Nombre</label>
                    <span class="valor"><%=Html.Encode(Model.Form.InvestigadorNombre) %>&nbsp;</span>
                </p>
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
                    <label>T&iacute;tulo del art&iacute;culo</label>
                    <span class="valor"><%=Html.Encode(Model.Form.Titulo)%>&nbsp;</span>
                </p>
                <p>
                    <label>Tipo de producto</label>
                    <span class="valor"><%= HumanizeHelper.TipoProducto(Model.Form.TipoArticulo, 1)%>&nbsp;</span>
                </p>
                
                <h4>
                    <a href="#coautores_area" class="collapsable <%=Html.CollapsePanelClass(Model.Form.CoautorExternoArticulos.Length + Model.Form.CoautorInternoArticulos.Length) %>">
                        <span class="ui-icon ui-icon-circle-arrow-s"></span>
                        Coautores del art&iacute;culo de investigaci&oacute;n 
                        <span>
                        <%=Html.Encode(Model.Form.CoautorExternoArticulos.Length + Model.Form.CoautorInternoArticulos.Length)%> coautor(es)
                        </span> 
                        <span class="cvu"></span>
                    </a>
                </h4>
                <span id="coautores_area">
                <% Html.RenderPartial("_ShowCoautorInterno", new CoautorForm { CoautoresInternos = Model.Form.CoautorInternoArticulos, CoautorSeOrdenaAlfabeticamente = Model.Form.CoautorSeOrdenaAlfabeticamente }); %>
	            <% Html.RenderPartial("_ShowCoautorExterno", new CoautorForm { CoautoresExternos = Model.Form.CoautorExternoArticulos, CoautorSeOrdenaAlfabeticamente = Model.Form.CoautorSeOrdenaAlfabeticamente }); %>
	            <% Html.RenderPartial("_CoautorEmptyListMessage", new CoautorForm { CoautoresExternos = Model.Form.CoautorExternoArticulos, CoautoresInternos = Model.Form.CoautorInternoArticulos }); %>
                <p>
                    <label>Investigador</label>
                    <span class="valor"><%=Html.Encode(Model.Form.InvestigadorNombre) %></span>
                    <label class="right">Posici&oacute;n</label>
                    <span class="valor"><%=Html.Encode(Model.Form.PosicionCoautor)%>&nbsp;</span>
                </p>
	            </span>
                                
                <% Html.RenderPartial("_ShowEstadoProducto", Model.Form.ShowFields); %>
                    
                <% Html.RenderPartial("_ShowRevista", Model.Form.ShowFields); %>
                   
                <% if (Model.Form.EstadoProducto == 3){ %> 
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
                <p>
                    <label>Obra publicada</label>
                    <span class="valor">
                        <%if(!String.IsNullOrEmpty(Model.Form.ComprobanteArticuloNombre)) { %> 
	                        <%=Html.ActionLink<ArchivoController>(x => x.Show(Model.Form.ComprobanteArticuloId), Model.Form.ComprobanteArticuloNombre, new { target = "_blank" })%> 
	                    <% } else { %>
	                        &nbsp;
	                    <% } %>
                    </span><br />
                </p>
                
                <p>
                    <label></label>
                    <span class="valor">¿Existe proyecto de investigaci&oacute;n de referencia? <%= HumanizeHelper.Boolean(Model.Form.TieneProyecto) %>&nbsp;</span>
                </p>
                
                <% if (Model.Form.TieneProyecto) { %>                    
                    <% Html.RenderPartial("_ShowProyecto", Model.Form.ShowFields); %>
                <% } %>
                
                <p>
                    <label>L&iacute;nea tem&aacute;tica institucional</label>
                    <span class="valor">
                        <%= Html.Encode(Model.Form.AreaTematica.LineaTematicaNombre) %>&nbsp;
                    </span>
                </p>
                <p>
                    <label>&Aacute;rea tem&aacute;tica institucional</label>
                    <span class="valor">
                        <%= Html.Encode(Model.Form.AreaTematica.Nombre) %>&nbsp;
                    </span>
                </p>
                <% Html.RenderPartial("_ShowPalabrasClave", Model.Form.ShowFields); %>
                <% Html.RenderPartial("_ShowSubdisciplina", Model.Form.ShowFields); %>
                
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