<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true"
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<LibroForm>>" %>
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
                    <label>Departamento</label>
                    <strong><%= Html.Encode(Model.Form.DepartamentoNombre)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Sede</label>
                    <strong><%= Html.Encode(Model.Form.SedeNombre)%>&nbsp;</strong>
                </p>
    <!--DATOS PUBLICACION-->
                <h4>Datos de la publicaci&oacute;n</h4>
                <p>
                    <label>Nombre del libro</label>
                    <strong><%= Html.Encode(Model.Form.Nombre) %>&nbsp;</strong>
                </p>
                <p>
                    <label>Tipo de publicaci&oacute;n</label>
                    <strong><%= Html.Encode(Model.Form.TipoPublicacionNombre)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Tipo de producto</label>
                    <strong><%= Html.Encode(Model.Form.TipoProductoNombre)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Formato de publicaci&oacute;n</label>
                    <strong><%= Html.Encode(Model.Form.FormatoPublicacionNombre)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Idioma</label>
                    <strong><%= Html.Encode(Model.Form.IdiomaNombre)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Nombre del traductor</label>
                    <strong><%= Html.Encode(Model.Form.NombreTraductor)%>&nbsp;</strong>
                </p>
                <p>    
                    <label>Nombre del evento</label>
                    <strong><%= Html.Encode(Model.Form.EventoNombre)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Fecha del evento</label>
                    <strong><%= Html.Encode(Model.Form.EventoFechaInicial)%> - <%= Html.Encode(Model.Form.EventoFechaFinal)%> &nbsp;</strong>
                </p>
                <p>    
                    <label>Nombre de la revista</label>
                    <strong><%= Html.Encode(Model.Form.NombreRevistaTitulo)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Instituci&oacute;n</label>
                    <strong><%= Html.Encode(Model.Form.NombreRevistaInstitucionNombre)%>&nbsp;</strong>
                </p>
                <p>
                    <label>N&uacute;mero</label>
                    <strong><%= Html.Encode(Model.Form.Numero)%>&nbsp;</strong>
                </p>
                
                
                <h4>Coautores</h4>
				<% Html.RenderPartial("_ShowCoautorInterno", new CoautorForm { CoautoresInternos = Model.Form.CoautorInternoLibros, ModelId = Model.Form.Id } ); %>
	            <% Html.RenderPartial("_ShowCoautorExterno", new CoautorForm { CoautoresExternos = Model.Form.CoautorExternoLibros, ModelId = Model.Form.Id } ); %>
	            <p>
	                <label>Autores</label>
	                <span id="totalcoautores" class="valor"><%=Html.Encode(Model.Form.TotalAutores) %></span>	          
	            </p>
                <p>
                    <label>Posici&oacute;n del autor</label>
                    <strong><%= Html.Encode(Model.Form.PosicionAutor)%>&nbsp;</strong>
                </p>
                <p>
                    <label></label>
                    Tiene proyecto de investigaci&oacute;n de referencia?
                    <strong><%= HumanizeHelper.Boolean(Model.Form.TieneProyecto)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Nombre del proyecto de investigaci&oacute;n</label>
                    <strong><%= Html.Encode(Model.Form.ProyectoNombre)%>&nbsp;</strong>
                </p>
               <p>
                    <label>L&iacute;nea tem&aacute;tica</label>
                    <strong><%= Html.Encode(Model.Form.ProyectoLineaTematicaNombre)%>&nbsp;</strong>
                </p>
                <p>
                    <label>&Aacute;rea tem&aacute;tica</label>
                    <strong><%= Html.Encode(Model.Form.ProyectoAreaTematicaNombre)%>&nbsp;</strong>
                </p>
                <p>
	                <label>Palabra clave 1</label>
	                <strong><%= Html.Encode(Model.Form.PalabraClave1)%>&nbsp;</strong>
                </p>
                <p>
	                <label>Palabra clave 2</label>
	                <strong><%= Html.Encode(Model.Form.PalabraClave2)%>&nbsp;</strong>
                </p>
                <p>
	                <label>Palabra clave 3</label>
                    <strong><%= Html.Encode(Model.Form.PalabraClave3)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Estado actual</label>
                    <strong><%= Html.Encode(Model.Form.EstadoProductoNombre)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Fecha de aceptaci&oacute;n</label>
                    <strong><%= Html.Encode(Model.Form.FechaAceptacion)%>&nbsp;</strong><span>Formato (dd/mm/yyyy)</span>
                </p>
                <p>
                    <label>Fecha de publicaci&oacute;n</label>
                    <strong><%= Html.Encode(Model.Form.FechaPublicacion)%>&nbsp;</strong><span>Formato (dd/mm/yyyy)</span>
                </p>
                
    <!--DATOS REFERENCIA BIBLIOGRAFICA-->
                <h4>Referencia bibliogr&aacute;fica</h4>
                <p>
                    <label>Edici&oacute;n</label>
                    <strong><%= Html.Encode(Model.Form.EdicionNombre)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Reimpresi&oacute;n</label>
                    <strong><%= Html.Encode(Model.Form.ReimpresionNombre)%>&nbsp;</strong>
                </p>
                
                <% Html.RenderPartial("_ShowEditorial", Model.Form); %>
                
                <p>
                    <label>ISBN</label>
                    <strong><%= Html.Encode(Model.Form.ISBN)%>&nbsp;</strong>
                </p>
                <p>
                    <label>A&ntilde;o de edici&oacute;n</label>
                    <strong><%= Html.Encode(Model.Form.FechaEdicion)%>&nbsp;</strong><span>Formato (yyyy)</span>
                </p>
                <p>
                    <label>Volumen</label>
                    <strong><%= Html.Encode(Model.Form.Volumen)%>&nbsp;</strong>
                </p>
                <p>
                    <label>No. de p&aacute;ginas</label>
                    <strong><%= Html.Encode(Model.Form.NoPaginas)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Tiraje</label>
                    <strong><%= Html.Encode(Model.Form.Tiraje)%>&nbsp;</strong>
                </p>

    <!--COMPLEMENTARIA CVU-->
                <h4>Complementaria CVU</h4>
                <p>
                    <label>&Aacute;rea</label>
                    <strong><%= Html.Encode(Model.Form.AreaNombre)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Disciplina</label>
                    <strong><%= Html.Encode(Model.Form.DisciplinaNombre)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Subdisciplina</label>
                    <strong><%= Html.Encode(Model.Form.SubdisciplinaNombre)%>&nbsp;</strong>
                </p>
                
                
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
