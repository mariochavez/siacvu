<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true"
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<LibroForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Core"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Productos"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers" %>

<asp:Content ID="titleContent" ContentPlaceHolderID="TituloPlaceHolder" runat="server">
    <h2>
        <%=Html.ProductoShowTitle(TipoProductoEnum.Libro) %>
    </h2>
</asp:Content>

<asp:Content ID="introductionContent" ContentPlaceHolderID="IntroduccionPlaceHolder" runat="server">
    <div id="introduccion">
        <p>
            <%=Html.ProductoShowMessage(TipoProductoEnum.Libro) %>
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
               <!-- <h4>Datos del investigador</h4>
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
    <!--DATOS PUBLICACION-->
                <h4>Datos de la publicaci&oacute;n</h4>
                <p>
                    <label>
                        T&iacute;tulo del libro</label>
                    <span class="valor"><%= Html.Encode(Model.Form.Nombre) %>&nbsp;</span>
                </p>
                <p>
                    <label>Forma de autor&iacute;a</label>
                    <span class="valor"><%= HumanizeHelper.FormatoPublicacion(Model.Form.FormatoPublicacion)%>&nbsp;</span>
                </p>
                <p>
                    <label>Idioma</label>
                    <span class="valor"><%= Html.Encode(Model.Form.IdiomaNombre) %>&nbsp;</span>
                </p>
                <p>
                    <label>Tipo de producto</label>
                    <span class="valor"><%= HumanizeHelper.TipoProducto(Model.Form.TipoProducto, 7)%>&nbsp;</span>
                </p>
                <p>
                    <label>Tipo de obra</label>
                    <span class="valor"><%= HumanizeHelper.ContenidoLibro(Model.Form.ContenidoLibro)%>&nbsp;</span>
                </p>
                <% if (Model.Form.ContenidoLibro == 2){ %>
                    <p>
                        <label>Nombre del evento</label>
                        <span class="valor"><%= Html.Encode(Model.Form.EventoNombre)%>&nbsp;</span>
                    </p>
                    <p>
                        <label>Fecha del evento</label>
                        <span class="valor"><%= Html.Encode(Model.Form.EventoFechaEvento)%>&nbsp;</span>
                    </p>
                <% } %>
                <% if (Model.Form.ContenidoLibro == 3){ %>
                    <% Html.RenderPartial("_ShowRevista", Model.Form.ShowFields); %>
                    <p>
                        <label>N&uacute;mero</label>
                        <span class="valor"><%= Html.Encode(Model.Form.Numero)%>&nbsp;</span>
                    </p>
                <% } %>
                
    <!--COAUTORES DE LA PUBLICACION-->
                
                <h4>
                    <a href="#coautores_area" class="collapsable <%=Html.CollapsePanelClass(Model.Form.CoautorExternoLibros.Length + Model.Form.CoautorInternoLibros.Length) %>">
                        <span class="ui-icon ui-icon-circle-arrow-s"></span>
                            <%=Model.Form.TipoProducto == 2 ? "Coodinador(es)" : Model.Form.TipoProducto == 3 ? "Compilador(es)" : "Coautor(es)" %> <!-- del libro -->
                        <span>
                            <%=Html.Encode(Model.Form.CoautorExternoLibros.Length + Model.Form.CoautorInternoLibros.Length)%> 
                        </span>
                        <span>
                            <%=Model.Form.TipoProducto == 2 ? "coodinador(es)" : Model.Form.TipoProducto == 3 ? "compilador(es)" : "coautor(es)" %>
                        </span>
                        <span class="cvu"></span>
                    </a>
                </h4>
                <span id="coautores_area">
				<% Html.RenderPartial("_ShowCoautorInterno", new CoautorForm { CoautoresInternos = Model.Form.CoautorInternoLibros, CoautorSeOrdenaAlfabeticamente = Model.Form.CoautorSeOrdenaAlfabeticamente }); %>
	            <% Html.RenderPartial("_ShowCoautorExterno", new CoautorForm { CoautoresExternos = Model.Form.CoautorExternoLibros, CoautorSeOrdenaAlfabeticamente = Model.Form.CoautorSeOrdenaAlfabeticamente }); %>
	            <% Html.RenderPartial("_CoautorEmptyListMessage", new CoautorForm { CoautoresExternos = Model.Form.CoautorExternoLibros, CoautoresInternos = Model.Form.CoautorInternoLibros }); %>
                <p>
                    <label>Investigador(a)</label>
                    <span class="valor"><%=Html.Encode(Model.Form.InvestigadorNombre) %></span>
                    <label class="right">Posici&oacute;n</label>
                    <span class="valor"><%=Html.Encode(Model.Form.PosicionCoautor)%>&nbsp;</span>
                </p>
                </span>
                
    <!-- ESTATUS DE LA PUBLICACION -->            
                <% Html.RenderPartial("_ShowEstadoProducto", Model.Form.ShowFields); %>
                
			    <% Html.RenderPartial("_ShowEditorial", new EditorialForm { Editoriales = Model.Form.EditorialLibros, ModelId = Model.Form.Id }); %>
			    
			    <% if (Model.Form.EstadoProducto == 3){ %>
                    <p>
                        <label>ISBN</label>
                        <span class="valor"><%= Html.Encode(Model.Form.ISBN)%>&nbsp;</span>
                    </p>
                    <p>
                        <label>Edici&oacute;n</label>
                        <span class="valor"><%= HumanizeHelper.Edicion(Model.Form.Edicion)%>&nbsp;</span>
                    </p>
                    <p>
                        <label>Reimpresi&oacute;n</label>
                        <span class="valor"><%= HumanizeHelper.Reimpresion(Model.Form.Reimpresion)%>&nbsp;</span>
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
                        <label>Tiraje</label>
                        <span class="valor"><%= Html.Encode(Model.Form.Tiraje)%>&nbsp;</span>
                    </p>
                <% } %>
                
                
                <p>
                    <label></label>
                    <span class="valor">¿Existe proyecto de investigaci&oacute;n de referencia? <%= HumanizeHelper.Boolean(Model.Form.TieneProyecto) %>&nbsp;</span>
                </p>
                
                <% if (Model.Form.TieneProyecto) { %>                    
                    <% Html.RenderPartial("_ShowProyecto", Model.Form.ShowFields); %>
                <% } %>
                <h4>&aacute;rea del conocimiento</h4>
                <h5>El Colef</h5>
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
                <% Html.RenderPartial("_ShowPalabrasClave", Model.Form.ShowFields); %>
                <% Html.RenderPartial("_ShowArchivo", Model.Form); %>

                <p class="submit">
                    <%=Html.ActionLink<LibroController>(x => x.Index(), "Regresar") %>
                </p>
            </div><!--end elementodescripcion-->
        </div><!--end lista-->

    </div><!--end textos-->
    
<script type="text/javascript">
    $(document).ready(function() {
        setupDocument();
    });
</script>
</asp:Content>