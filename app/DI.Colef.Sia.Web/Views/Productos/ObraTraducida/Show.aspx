<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true"
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<ObraTraducidaForm>>" %>
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
        <%=Html.ProductoShowTitle(TipoProductoEnum.ObraTraducida) %>
    </h2>
</asp:Content>

<asp:Content ID="introductionContent" ContentPlaceHolderID="IntroduccionPlaceHolder" runat="server">
    <div id="introduccion">
        <p>
            <%=Html.ProductoShowMessage(TipoProductoEnum.ObraTraducida) %>
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
                    <span class="valor"><%= Html.Encode(Model.Form.InvestigadorNombre)%>&nbsp;</span>
                </p>
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
                    <label>Título original</label>
                    <span class="valor"><%= Html.Encode(Model.Form.Nombre) %>&nbsp;</span>
                </p>
                <p>
                    <label>Idioma al que se tradujo</label>
                    <span class="valor"><%= Html.Encode(Model.Form.IdiomaNombre) %>&nbsp;</span>
                </p>
                <p>
                    <label>Traductor(a)</label>
                    <span class="valor"><%= Html.Encode(Model.Form.NombreCompleto) %>&nbsp;</span>
                </p>
                <p>
                    <label>Titulo actual</label>
                    <span class="valor"><%= Html.Encode(Model.Form.NombreObraTraducida) %>&nbsp;</span>
                </p>
                <p>
                    <label>Tipo de publicaci&oacute;n</label>
                    <span class="valor"><%= HumanizeHelper.TipoObraTraducida(Model.Form.TipoObraTraducida) %>&nbsp;</span>
                </p>
                
    <!-- Coautores de la publicacion -->            
                <h4>
                    <a href="#coautores_area" class="collapsable <%=Html.CollapsePanelClass(Model.Form.CoautorExternoObraTraducidas.Length + Model.Form.CoautorInternoObraTraducidas.Length) %>">
                        <span class="ui-icon ui-icon-circle-arrow-s"></span>
                        Coautor(es) <!--de la obra traducida-->
                        <span>
                            <%=Html.Encode(Model.Form.CoautorExternoObraTraducidas.Length + Model.Form.CoautorInternoObraTraducidas.Length)%> coautor(es) 
                        </span><span class="cvu"></span>
                     </a>
                </h4>
                <span id="coautores_area">
				<% Html.RenderPartial("_ShowCoautorInterno", new CoautorForm { CoautoresInternos = Model.Form.CoautorInternoObraTraducidas, CoautorSeOrdenaAlfabeticamente = Model.Form.CoautorSeOrdenaAlfabeticamente }); %>
	            <% Html.RenderPartial("_ShowCoautorExterno", new CoautorForm { CoautoresExternos = Model.Form.CoautorExternoObraTraducidas, CoautorSeOrdenaAlfabeticamente = Model.Form.CoautorSeOrdenaAlfabeticamente }); %>
	            <% Html.RenderPartial("_CoautorEmptyListMessage", new CoautorForm { CoautoresExternos = Model.Form.CoautorExternoObraTraducidas, CoautoresInternos = Model.Form.CoautorInternoObraTraducidas }); %>
                </span>
                
    <!-- ESTATUS DE LA PUBLICACION -->
                <% Html.RenderPartial("_ShowEstadoProducto", Model.Form.ShowFields); %>
                
    <!-- REFERENCIA BIBLIOGRAFICA -->
                <% if (Model.Form.TipoObraTraducida == 1){ %>
                    <% Html.RenderPartial("_ShowArticulo", Model.Form); %>
                <% } %>
                
                <% if (Model.Form.TipoObraTraducida == 2){ %>
                    <% Html.RenderPartial("_ShowLibro", Model.Form); %>
                <% } %>
                
                <% if (Model.Form.TipoObraTraducida == 3){ %>
                    <% Html.RenderPartial("_ShowCapitulo", Model.Form); %>
                <% } %>
                <% Html.RenderPartial("_ShowArchivo", Model.Form); %>
                
                <p>
                    <label>
                        L&iacute;nea tem&aacute;tica institucional</label>
                    <span class="valor">
                        <%= Html.Encode(Model.Form.AreaTematica.LineaTematicaNombre) %>&nbsp; </span>
                </p>
                <p>
                    <label>
                        &Aacute;rea tem&aacute;tica institucional</label>
                    <span class="valor">
                        <%= Html.Encode(Model.Form.AreaTematica.Nombre) %>&nbsp; </span>
                </p>
                <% Html.RenderPartial("_ShowPalabrasClave", Model.Form.ShowFields); %>
                
                <p class="submit">
                    <%=Html.ActionLink<ObraTraducidaController>(x => x.Index(), "Regresar") %>
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