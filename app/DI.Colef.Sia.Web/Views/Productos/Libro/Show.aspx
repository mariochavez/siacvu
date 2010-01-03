<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true"
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<LibroForm>>" %>
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
            Aqu&iacute; se muestra la informaci&oacute;n detallada del libro como est&aacute; en el sistema.
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
                    <span class="valor"><%= Html.Encode(Model.Form.DepartamentoNombre)%>&nbsp;</span>
                </p>
                <p>
                    <label>Sede</label>
                    <span class="valor"><%= Html.Encode(Model.Form.SedeNombre)%>&nbsp;</span>
                </p>
                
    <!--DATOS PUBLICACION-->
                <h4>Datos de la publicaci&oacute;n</h4>
                <p>
                    <label>Nombre del libro</label>
                    <span class="valor"><%= Html.Encode(Model.Form.Nombre) %>&nbsp;</span>
                </p>
                <p>
                    <label>Tipo de publicaci&oacute;n</label>
                    <span class="valor"><%= HumanizeHelper.FormatoPublicacion(Model.Form.FormatoPublicacion)%>&nbsp;</span>
                </p>
                <p>
                    <label>Tipo de producto</label>
                    <span class="valor"><%= HumanizeHelper.TipoProducto(Model.Form.TipoProducto, 7)%>&nbsp;</span>
                </p>
                <p>
                    <label>Contenido del libro</label>
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
                <h4><%=Model.Form.TipoProducto == 2 ? "Coodinadores" : Model.Form.TipoProducto == 3 ? "Compiladores" : "Coautores" %> del libro</h4>
				<% Html.RenderPartial("_ShowCoautorInterno", new CoautorForm { CoautoresInternos = Model.Form.CoautorInternoLibros, CoautorSeOrdenaAlfabeticamente = Model.Form.CoautorSeOrdenaAlfabeticamente }); %>
	            <% Html.RenderPartial("_ShowCoautorExterno", new CoautorForm { CoautoresExternos = Model.Form.CoautorExternoLibros, CoautorSeOrdenaAlfabeticamente = Model.Form.CoautorSeOrdenaAlfabeticamente }); %>
	            <% Html.RenderPartial("_CoautorEmptyListMessage", new CoautorForm { CoautoresExternos = Model.Form.CoautorExternoLibros, CoautoresInternos = Model.Form.CoautorInternoLibros }); %>
                <p>
                    <label>Due&ntilde;o del producto</label>
                    <span class="valor"><%=Html.Encode(Model.Form.InvestigadorNombre) %></span>
                </p>
	            <p>
	                <label>Total de investigadores</label>
	                <span id="totalcoautores" class="valor"><%=Html.Encode(Model.Form.TotalCoautores)%></span>	          
	            </p>
                <p>
	                <label>Posici&oacute;n del coautor</label>
                    <span class="valor"><%=Html.Encode(Model.Form.PosicionCoautor)%>&nbsp;</span>
                </p>
                
    <!--ESTAUS DE LA PUBLICACION-->            
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
                    <label>Obra publicada</label>
                    <span class="valor">
                        <%if(!String.IsNullOrEmpty(Model.Form.ComprobanteLibroNombre)) { %> 
                            <%=Html.ActionLink<ArchivoController>(x => x.Show(Model.Form.ComprobanteLibroId), Model.Form.ComprobanteLibroNombre, new { target = "_blank" })%> 
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
                
                <% Html.RenderPartial("_ShowAreaTematica", Model.Form.ShowFields); %>
                <% Html.RenderPartial("_ShowPalabrasClave", Model.Form.ShowFields); %>
                <% Html.RenderPartial("_ShowSubdisciplina", Model.Form.ShowFields); %>
                
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