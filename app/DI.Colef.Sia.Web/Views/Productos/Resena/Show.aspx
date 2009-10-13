<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true"
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<ResenaForm>>" %>
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
            Aqu&iacute; se muestra la informaci&oacute;n detallada de la rese&ntilde;a como est&aacute; en el sistema.
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
                
                <h4>Datos de la publicaci&oacute;n</h4>
                <p>
                    <label>Nombre de la publicaci&oacute;n</label>
                    <strong><%= Html.Encode(Model.Form.NombreProducto)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Tipo de publicaci&oacute;n</label>
                    <strong><%= Html.Encode(Model.Form.TipoResenaNombre)%>&nbsp;</strong>
                </p>
                
                <h4>Coautores</h4>
				<% Html.RenderPartial("_ShowCoautorInterno", new CoautorForm { CoautoresInternos = Model.Form.CoautorInternoResenas, ModelId = Model.Form.Id } ); %>
	            <% Html.RenderPartial("_ShowCoautorExterno", new CoautorForm { CoautoresExternos = Model.Form.CoautorExternoResenas, ModelId = Model.Form.Id }); %>
	            <p>
	                <label>Autores</label>
	                <span id="totalcoautores" class="valor"><%=Html.Encode(Model.Form.TotalAutores) %></span>	          
	            </p>
	            <p>
	                <label>Posici&oacute;n del autor</label>
                    <strong><%= Html.Encode(Model.Form.PosicionAutor) %>&nbsp;</strong>
                </p>
                <h4>Referencia de la obra rese&ntilde;ada</h4>
                <p>
                    <label>Nombre del libro</label>
                    <strong><%= Html.Encode(Model.Form.TituloLibro)%>&nbsp;</strong>
                </p>
                <%--<% Html.RenderPartial("_ShowAutor", new ResenaForm { AutorResenas = Model.Form.AutorResenas, ModelId = Model.Form.Id } ); %>--%>
                <p>
                    <label>A&ntilde;o de edici&oacute;n</label>
                    <strong><%= Html.Encode(Model.Form.FechaEdicion)%>&nbsp;</strong><span>Formato (yyyy)</span>
                </p>
                <p>
                    <label>Instituci&oacute;n</label>
                    <strong><%= Html.Encode(Model.Form.InstitucionNombre)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Editorial</label>
                    <strong><%= Html.Encode(Model.Form.Editorial)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Pa&iacute;s</label>
                    <strong><%= Html.Encode(Model.Form.PaisNombre)%>&nbsp;</strong>
                </p>
                
                <h4>Referencia bibliogr&aacute;fica</h4>
                <p>
                    <label>Revista en que se publica</label>
                    <strong><%= Html.Encode(Model.Form.RevistaPublicacionTitulo)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Instituci&oacute;n</label>
                    <strong><%= Html.Encode(Model.Form.RevistaPublicacionInstitucionNombre)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Pa&iacute;s</label>
                    <strong><%= Html.Encode(Model.Form.RevistaPublicacionPaisNombre)%>&nbsp;</strong>
                </p>
                <p>
                    <label>L&iacute;nea tem&aacute;tica</label>
                    <strong><%= Html.Encode(Model.Form.LineaTematicaNombre)%>&nbsp;</strong>
                </p>
                <p>
                    <label>&Aacute;rea tem&aacute;tica</label>
                    <strong><%= Html.Encode(Model.Form.AreaTematicaNombre)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Estatus de la publicaci&oacute;n</label>
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
                <p>
                    <label>Volumen</label>
                    <strong><%= Html.Encode(Model.Form.Volumen)%>&nbsp;</strong>
                </p>
                <p>
                    <label>N&uacute;mero</label>
                    <strong><%= Html.Encode(Model.Form.Numero)%>&nbsp;</strong>
                </p>
                <p>
                    <label>P&aacute;gina inicial</label> 
                    <strong><%= Html.Encode(Model.Form.PaginaInicial)%>&nbsp;</strong> 
                </p>
                <p>    
                    <label>P&aacute;gina final</label>
                    <strong><%= Html.Encode(Model.Form.PaginaFinal)%>&nbsp;</strong> 
                </p>
                <p>
                    <label>A&ntilde;o de publicaci&oacute;n</label>
                    <strong><%= Html.Encode(Model.Form.AnioPublicacion)%>&nbsp;</strong><span>Formato (yyyy)</span>
                </p>
                <p>
                    <label></label>
                    Rese&ntilde;a traducida a otro idioma?
                    <strong><%= HumanizeHelper.Boolean(Model.Form.ResenaTraducida) %>&nbsp;</strong>
                </p>
                <p>
                    <label>Idioma al que se tradujo</label>
                    <strong><%= Html.Encode(Model.Form.IdiomaNombre)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Periodo de referencia</label>
                    <strong><%= Html.Encode(Model.Form.PeriodoReferenciaPeriodo) %>&nbsp;</strong>
                </p>
                
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
                
                <p class="submit">
                    <%=Html.ActionLink<ResenaController>(x => x.Index(), "Regresar") %>
                </p>
            </div><!--end campos-->
        </div><!--end forma-->

    </div><!--end textos-->
    
<script type="text/javascript">
    $(document).ready(function() {
        setupDocument();
    });
</script>
</asp:Content>