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
                    <span class="valor"><%= Html.Encode(Model.Form.TipoCapitulo)%>&nbsp;</span>
                </p>
                
	            <h4>Coautores</h4>
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
                <p>
                    <label></label>
                    <span class="valor">Tiene proyecto de investigaci&oacute;n de referencia? <%= HumanizeHelper.Boolean(Model.Form.TieneProyecto) %>&nbsp;</span>
                </p>
                <% if (Model.Form.TieneProyecto) { %>      
	                <p>
	                    <label>Nombre del proyecto de investigaci&oacute;n</label>
	                    <span class="valor"><%=Html.Encode(Model.Form.ProyectoNombre) %></span>	          
	                </p>
                <% } %>
                
                <% Html.RenderPartial("_ShowAreaTematica", Model.Form.ShowFields); %>
                
                <p>
                    <label>Estatus de la publicaci&oacute;n</label>
                    <span class="valor"><%= HumanizeHelper.EstadoProducto(Model.Form.EstadoProducto)%>&nbsp;</span>
                </p>
                <% if (Model.Form.EstadoProducto == 1){ %>
                    <p>
                        <label>Fecha de aceptaci&oacute;n</label>
                        <span class="valor"><%= Html.Encode(Model.Form.FechaAceptacion)%>&nbsp;</span>
                        <span>Formato (dd/mm/yyyy)</span>
                    </p>
                <% } if (Model.Form.EstadoProducto == 2) { %>
                    <p>
                        <label>Fecha de publicaci&oacute;n</label>
                        <span class="valor"><%= Html.Encode(Model.Form.FechaPublicacion)%>&nbsp;</span>
                        <span>Formato (dd/mm/yyyy)</span>
                    </p>
                <% } %>
                
    <!-- REFERENCIA BIBLIOGRAFICA -->                
                <h4>Referencia bibliogr&aacute;fica</h4>
                <p>
                    <label>Nombre del libro</label>
                    <span class="valor"><%= Html.Encode(Model.Form.NombreLibro)%>&nbsp;</span>
                </p>
                <p>
                    <label>Autor del libro</label>
                    <span class="valor"><%= Html.Encode(Model.Form.AutorLibro)%>&nbsp;</span>
                </p>
                <p>
                    <label>Resumen</label>
                    <span class="valor"><%= Html.Encode(Model.Form.Resumen)%>&nbsp;</span>
                </p>
                <p>
                    <label>Editorial</label>
                    <span class="valor"><%= Html.Encode(Model.Form.EditorialNombre)%>&nbsp;</span>
                </p>
                <p>
                    <label>Volumen</label>
                    <span class="valor"><%= HumanizeHelper.Volumen(Model.Form.Volumen)%>&nbsp;</span>
                </p>
                <p>
                    <label>N&uacute;mero de p&aacute;ginas</label>
                    <span class="valor"><%= Html.Encode(Model.Form.NoPaginas)%>&nbsp;</span>
                </p>    
                <p>
                    <label>N&uacute;mero de citas</label>
                    <span class="valor"><%= Html.Encode(Model.Form.NoCitas)%>&nbsp;</span>
                </p>             

    <!-- RESPONSABLES DEL LIBRO -->                
                <h4>Responsables del libro</h4>
	            <% Html.RenderPartial("_ShowAutorInterno", new AutorForm { AutoresInternos = Model.Form.AutorInternoCapitulos, ModelId = Model.Form.Id }); %>
				<% Html.RenderPartial("_ShowAutorExterno", new AutorForm { AutoresExternos = Model.Form.AutorExternoCapitulos, ModelId = Model.Form.Id }); %>
                
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