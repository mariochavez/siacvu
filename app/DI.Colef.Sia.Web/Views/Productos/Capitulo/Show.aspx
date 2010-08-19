<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true"
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<CapituloForm>>" %>
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
        <%=Html.ProductoShowTitle(TipoProductoEnum.Capitulo) %>
    </h2>
</asp:Content>

<asp:Content ID="introductionContent" ContentPlaceHolderID="IntroduccionPlaceHolder" runat="server">
    <div id="introduccion">
        <p>
            <%=Html.ProductoShowMessage(TipoProductoEnum.Capitulo) %>
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
            
            <!--<h4>Datos del investigador</h4>
                <p>
                    <label>Nombre</label>
                    <span class="valor"><%=Html.Encode(Model.Form.InvestigadorNombre) %>&nbsp;</span>
                </p>
	            <p>
                    <label>Departamento</label>
                    <span class="valor"><%= Html.Encode(Model.Form.DepartamentoNombre)%>&nbsp;</span>
                </p>
                <p>
                    <label>Sede</label>
                    <span class="valor"><%= Html.Encode(Model.Form.SedeNombre)%>&nbsp;</span>
                </p>
                -->
    <!-- DATOS DE LA PUBLICACION -->            
                <h4>Datos de la publicaci&oacute;n</h4>
                <p>
                    <label>T&iacute;tulo del cap&iacute;tulo</label>
                    <span class="valor"><%= Html.Encode(Model.Form.NombreCapitulo) %>&nbsp;</span>
                </p>
                <p>
                    <label>T&iacute;tulo del libro</label>
                    <span class="valor"><%= Html.Encode(Model.Form.NombreLibro)%>&nbsp;</span>
                </p>
                <p>
				    <label>Tipo de libro</label>
                    <span class="valor"><%= HumanizeHelper.TipoLibro(Model.Form.TipoLibro)%>&nbsp;</span>
				</p>
                <p>
                    <label>Tipo de producto</label>
                    <span class="valor"><%= HumanizeHelper.TipoProducto(Model.Form.TipoCapitulo, 2)%>&nbsp;</span>
                </p>
                
    <!-- Coautores de la publicacion -->            
	            
                <h4>
                    <a href="#coautores_area" class="collapsable <%=Html.CollapsePanelClass(Model.Form.CoautorExternoCapitulos.Length + Model.Form.CoautorInternoCapitulos.Length) %>">
                        <span class="ui-icon ui-icon-circle-arrow-s"></span>
                        Coautor(es)  <!--del cap&iacute;tulo-->
                        <span>
                            <%=Html.Encode(Model.Form.CoautorExternoCapitulos.Length + Model.Form.CoautorInternoCapitulos.Length)%>
                            coautor(es) </span><span class="cvu"></span></a>
                </h4>
                <span id="coautores_area">
				<% Html.RenderPartial("_ShowCoautorInterno", new CoautorForm { CoautoresInternos = Model.Form.CoautorInternoCapitulos, CoautorSeOrdenaAlfabeticamente = Model.Form.CoautorSeOrdenaAlfabeticamente }); %>
	            <% Html.RenderPartial("_ShowCoautorExterno", new CoautorForm { CoautoresExternos = Model.Form.CoautorExternoCapitulos, CoautorSeOrdenaAlfabeticamente = Model.Form.CoautorSeOrdenaAlfabeticamente }); %>
	            <% Html.RenderPartial("_CoautorEmptyListMessage", new CoautorForm { CoautoresExternos = Model.Form.CoautorExternoCapitulos, CoautoresInternos = Model.Form.CoautorInternoCapitulos }); %>
	            <p>
                    <label>Investigador(a)</label>
                    <span class="valor"><%=Html.Encode(Model.Form.InvestigadorNombre) %></span>
                    <label class="right">Posici&oacute;n</label>
                    <span class="valor"><%=Html.Encode(Model.Form.PosicionCoautor)%>&nbsp;</span>
	            </p>
                </span>
    <!-- ESTATUS DE LA PUBLICACION -->
                <% Html.RenderPartial("_ShowEstadoProducto", Model.Form.ShowFields); %>
                
    <!-- REFERENCIA BIBLIOGRAFICA -->                
                <h4><%=Model.Form.TipoLibro == 1 ? "Coodinador(es)" : Model.Form.TipoLibro == 2 ? "Compilador(es)" : "Coautor(es)" %> del libro</h4>
				<% Html.RenderPartial("_ShowAutorInterno", new AutorForm { AutoresInternos = Model.Form.AutorInternoCapitulos, AutorSeOrdenaAlfabeticamente = Model.Form.AutorSeOrdenaAlfabeticamente }); %>
	            <% Html.RenderPartial("_ShowAutorExterno", new AutorForm { AutoresExternos = Model.Form.AutorExternoCapitulos, AutorSeOrdenaAlfabeticamente = Model.Form.AutorSeOrdenaAlfabeticamente }); %>
	            <% Html.RenderPartial("_AutorEmptyListMessage", new AutorForm { AutoresExternos = Model.Form.AutorExternoCapitulos, AutoresInternos = Model.Form.AutorInternoCapitulos }); %>
               <%-- <p>
                    <label>Investigador(a)</label>
                    <span class="valor"><%=Html.Encode(Model.Form.InvestigadorNombre) %></span>
                </p>
                <p>
	                <label>Posici&oacute;n del autor</label>
                    <span class="valor"><%=Html.Encode(Model.Form.PosicionAutor)%>&nbsp;</span>
                </p>--%>
	            <p>
	                <label>Total de investigadores</label>
	                <span id="totalautores" class="valor"><%=Html.Encode(Model.Form.TotalAutores) %></span>	          
	            </p>
	           
				
				<% Html.RenderPartial("_ShowEditorial", new EditorialForm { Editoriales = Model.Form.EditorialCapitulos, ModelId = Model.Form.Id }); %>
				
				<% if (Model.Form.EstadoProducto == 3){ %>
                    <p>
                        <label>Resumen</label>
                        <span class="valor"><%= Html.Encode(Model.Form.Resumen)%>&nbsp;</span>
                    </p>
                    
                    <p>
                        <label>Volumen</label>
                        <span class="valor"><%= Html.Encode(Model.Form.Volumen)%>&nbsp;</span>
                    </p>
                    <p>
                        <label>De la p&aacute;gina</label>
                        <span class="valor"><%= Html.Encode(Model.Form.PaginaInicial)%>&nbsp;</span>
                    </p>
                    <p>
                        <label>A la p&aacute;gina</label>
                        <span class="valor"><%= Html.Encode(Model.Form.PaginaFinal)%>&nbsp;</span>
                    </p>
                    <p>
                        <label>N&uacute;mero de citas</label>
                        <span class="valor"><%= Html.Encode(Model.Form.NoCitas)%>&nbsp;</span>
                    </p>
                <% } %>
               
                <h4>&aacute;rea del conocimiento</h4>
                <h5>El Colef</h5>
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

                <% Html.RenderPartial("_ShowSubdisciplina", Model.Form.ShowFields); %>
                 <% Html.RenderPartial("_ShowArchivo", Model.Form); %>
                <p class="submit">
                    <%= Html.ActionLink<CapituloController>(x => x.Index(), "Regresar") %>
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