<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true"
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<ObraTraducidaForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
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
            Aqu&iacute; se muestra la informaci&oacute;n detallada de la obra traducida como est&aacute; en el sistema.
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
                    <label>Nombre original de la obra</label>
                    <span class="valor"><%= Html.Encode(Model.Form.Nombre) %>&nbsp;</span>
                </p>
                <p>
                    <label>Idioma al que se tradujo</label>
                    <span class="valor"><%= Html.Encode(Model.Form.IdiomaNombre) %>&nbsp;</span>
                </p>
                <p>
                    <label>Nombre del traductor (co-traductor)</label>
                    <span class="valor"><%= Html.Encode(Model.Form.NombreCompleto) %>&nbsp;</span>
                </p>
                <p>
                    <label>Nombre de la obra en el idioma traducido</label>
                    <span class="valor"><%= Html.Encode(Model.Form.NombreObraTraducida) %>&nbsp;</span>
                </p>
                <p>
                    <label>Tipo de publicaci&oacute;n</label>
                    <span class="valor"><%= HumanizeHelper.TipoObraTraducida(Model.Form.TipoObraTraducida) %>&nbsp;</span>
                </p>
                
    <!-- Coautores de la publicacion -->            
	            <h4>Coautores de la publicaci&oacute;n</h4>
	            <% Html.RenderPartial("_ShowCoautorInterno", new CoautorForm { CoautoresInternos = Model.Form.CoautorInternoObraTraducidas, ModelId = Model.Form.Id } ); %>
				<% Html.RenderPartial("_ShowCoautorExterno", new CoautorForm { CoautoresExternos = Model.Form.CoautorExternoObraTraducidas, ModelId = Model.Form.Id }); %>
	            <p>
	                <label>Total de autores</label>
	                <span id="totalcoautores" class="valor"><%=Html.Encode(Model.Form.TotalAutores) %></span>	          
	            </p>
	            <p>
	                <label>Posici&oacute;n del autor</label>
                    <span class="valor"><%=Html.Encode(Model.Form.PosicionAutor)%>&nbsp;</span>
                </p>
                
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
                <p>
                    <label>Obra publicada</label>
                    <span class="valor">
                        <%if(!String.IsNullOrEmpty(Model.Form.ComprobanteObraTraducidaNombre)) { %> 
    	                    <%=Html.ActionLink<ArchivoController>(x => x.Show(Model.Form.ComprobanteObraTraducidaId), Model.Form.ComprobanteObraTraducidaNombre, new { target = "_blank" })%> 
    	                <% } else { %>
    	                    &nbsp;
    	                <% } %>
                    </span><br />
                </p>
                
                <% Html.RenderPartial("_ShowAreaTematica", Model.Form.ShowFields); %>
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