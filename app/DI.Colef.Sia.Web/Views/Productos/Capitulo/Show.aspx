<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true"
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<CapituloForm>>" %>
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
            Aqu&iacute; se muestra la informaci&oacute;n detallada del cap&iacute;tulo en libro como est&aacute; en el sistema.
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
                
    <!-- DATOS DE LA PUBLICACION -->            
                <h4>Datos de la publicaci&oacute;n</h4>
                <p>
                    <label>Nombre del cap&iacute;tulo</label>
                    <span class="valor"><%= Html.Encode(Model.Form.NombreCapitulo) %>&nbsp;</span>
                </p>
                <p>
                    <label>Nombre del libro</label>
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
	            <h4>Coautores del cap&iacute;tulo</h4>
				<% Html.RenderPartial("_ShowCoautorInterno", new CoautorForm { CoautoresInternos = Model.Form.CoautorInternoCapitulos, CoautorSeOrdenaAlfabeticamente = Model.Form.CoautorSeOrdenaAlfabeticamente }); %>
	            <% Html.RenderPartial("_ShowCoautorExterno", new CoautorForm { CoautoresExternos = Model.Form.CoautorExternoCapitulos, CoautorSeOrdenaAlfabeticamente = Model.Form.CoautorSeOrdenaAlfabeticamente }); %>
	            <% Html.RenderPartial("_CoautorEmptyListMessage", new CoautorForm { CoautoresExternos = Model.Form.CoautorExternoCapitulos, CoautoresInternos = Model.Form.CoautorInternoCapitulos }); %>
                <p>
                    <label>Investigador</label>
                    <span class="valor"><%=Html.Encode(Model.Form.InvestigadorNombre) %></span>
                </p>
	            <p>
	                <label>Total de investigadores</label>
	                <span id="totalcoautores" class="valor"><%=Html.Encode(Model.Form.TotalCoautores) %></span>	          
	            </p>
	            <p>
	                <label>Posici&oacute;n del coautor</label>
                    <span class="valor"><%=Html.Encode(Model.Form.PosicionCoautor)%>&nbsp;</span>
                </p>
                
    <!-- ESTATUS DE LA PUBLICACION -->
                <% Html.RenderPartial("_ShowEstadoProducto", Model.Form.ShowFields); %>
                
    <!-- REFERENCIA BIBLIOGRAFICA -->                
                <h4>Autor(es) del libro</h4>
				<% Html.RenderPartial("_ShowAutorInterno", new AutorForm { AutoresInternos = Model.Form.AutorInternoCapitulos, AutorSeOrdenaAlfabeticamente = Model.Form.AutorSeOrdenaAlfabeticamente }); %>
	            <% Html.RenderPartial("_ShowAutorExterno", new AutorForm { AutoresExternos = Model.Form.AutorExternoCapitulos, AutorSeOrdenaAlfabeticamente = Model.Form.AutorSeOrdenaAlfabeticamente }); %>
	            <% Html.RenderPartial("_AutorEmptyListMessage", new AutorForm { AutoresExternos = Model.Form.AutorExternoCapitulos, AutoresInternos = Model.Form.AutorInternoCapitulos }); %>
                <p>
                    <label>Investigador</label>
                    <span class="valor"><%=Html.Encode(Model.Form.InvestigadorNombre) %></span>
                </p>
	            <p>
	                <label>Total de investigadores</label>
	                <span id="totalautores" class="valor"><%=Html.Encode(Model.Form.TotalAutores) %></span>	          
	            </p>
	            <p>
	                <label>Posici&oacute;n del autor</label>
                    <span class="valor"><%=Html.Encode(Model.Form.PosicionAutor)%>&nbsp;</span>
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
                <p>
                    <label>Obra publicada</label>
                    <span class="valor">
                        <%if(!String.IsNullOrEmpty(Model.Form.ComprobanteCapituloNombre)) { %> 
    	                    <%=Html.ActionLink<ArchivoController>(x => x.Show(Model.Form.ComprobanteCapituloId), Model.Form.ComprobanteCapituloNombre, new { target = "_blank" })%> 
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
                <% Html.RenderPartial("_ShowSubdisciplina", Model.Form.ShowFields); %>
                
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