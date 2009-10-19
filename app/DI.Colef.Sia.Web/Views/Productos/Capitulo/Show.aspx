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
                    <strong><%= Html.Encode(Model.Form.DepartamentoNombre)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Sede</label>
                    <strong><%= Html.Encode(Model.Form.SedeNombre)%>&nbsp;</strong>
                </p>
                
    <!-- DATOS DE LA PUBLICACION -->            
                <h4>Datos de la publicaci&oacute;n</h4>
                <p>
                    <label>Nombre del cap&iacute;tulo</label>
                    <strong><%= Html.Encode(Model.Form.NombreCapitulo) %>&nbsp;</strong>
                </p>
                <p>
                    <label>Tipo de cap&iacute;tulo</label>
                    <strong><%= Html.Encode(Model.Form.TipoCapituloNombre)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Idioma al que se tradujo</label>
                    <strong><%= Html.Encode(Model.Form.IdiomaNombre)%>&nbsp;</strong>
                </p>
	            <h4>Coautores</h4>
	            <% Html.RenderPartial("_ShowCoautorInterno", new CoautorForm { CoautoresInternos = Model.Form.CoautorInternoCapitulos, ModelId = Model.Form.Id } ); %>
				<% Html.RenderPartial("_ShowCoautorExterno", new CoautorForm { CoautoresExternos = Model.Form.CoautorExternoCapitulos, ModelId = Model.Form.Id }); %>
	            <p>
	                <label>Autores</label>
	                <span id="totalcoautores" class="valor"><%=Html.Encode(Model.Form.TotalAutores) %></span>	          
	            </p>
	            <p>
	                <label>Posici&oacute;n del autor</label>
                    <strong><%=Html.Encode(Model.Form.PosicionAutor)%>&nbsp;</strong>
                </p>
                <p>
                    <label></label>
                    Tiene proyecto de investigaci&oacute;n de referencia? <strong><%= HumanizeHelper.Boolean(Model.Form.TieneProyecto) %>&nbsp;</strong>
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
                
    <!-- REFERENCIA BIBLIOGRAFICA -->                
                <h4>Referencia bibliogr&aacute;fica</h4>
                <p>
                    <label>Nombre del libro</label>
                    <strong><%= Html.Encode(Model.Form.NombreLibro)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Autor del libro</label>
                    <strong><%= Html.Encode(Model.Form.AutorLibro)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Resumen</label>
                    <strong><%= Html.Encode(Model.Form.Resumen)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Editorial</label>
                    <strong><%= Html.Encode(Model.Form.Editorial)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Volumen</label>
                    <strong><%= Html.Encode(Model.Form.Volumen)%>&nbsp;</strong>
                </p>
                <p>
                    <label>A&ntilde;o de edici&oacute;n</label>
                    <strong><%= Html.Encode(Model.Form.FechaEdicion)%>&nbsp;</strong><span>Formato (yyyy)</span>
                </p>
                <p>
                    <label>Pa&iacute;s</label>
                    <strong><%= Html.Encode(Model.Form.PaisNombre)%>&nbsp;</strong>
                </p>
                <p>
                    <label>N&uacute;mero de p&aacute;ginas</label>
                    <strong><%= Html.Encode(Model.Form.NoPaginas)%>&nbsp;</strong>
                </p>                

    <!-- RESPONSABLES DEL LIBRO -->                
                <h4>Responsables del libro</h4>
	            <% Html.RenderPartial("_ShowResponsableInterno", new ResponsableForm { ResponsablesInternos = Model.Form.ResponsableInternoCapitulos, ModelId = Model.Form.Id }); %>
				<% Html.RenderPartial("_ShowResponsableExterno", new ResponsableForm { ResponsablesExternos = Model.Form.ResponsableExternoCapitulos, ModelId = Model.Form.Id }); %>
	            <p>
	                <label>Editores</label>
	                <span id="totaleditores" class="valor"><%=Html.Encode(Model.Form.TotalEditores) %></span>	          
	            </p>
                
    <!-- COMPLEMENTARIA CVU -->                
                <h4>Complementaria CVU</h4>
                <p>
                    <label>Tipo de participaci&oacute;n</label>
                    <strong><%= Html.Encode(Model.Form.TipoParticipacionNombre)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Tipo de participante</label>
                    <strong><%= Html.Encode(Model.Form.TipoParticipanteNombre)%>&nbsp;</strong>
                </p>
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
                    <label>Traductor/Co-Traductor</label>
                    <strong><%= HumanizeHelper.Boolean(Model.Form.Traductor)%>&nbsp;</strong>
                </p>
                
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
