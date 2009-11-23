<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true"
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<IdiomasInvestigadorForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
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
            Aqu&iacute; se muestra la informaci&oacute;n detallada del idioma del investigador como est&aacute; en el sistema.
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
                <p>
	                <label>Idioma</label>
	                <span class="valor"><%= Html.Encode(Model.Form.IdiomaNombre)%>&nbsp;</span>
                </p>
                <p>
	                <label>Lengua materna</label>
	                <span class="valor"><%= Html.Encode(Model.Form.LenguaMaterna)%>&nbsp;</span>
                </p>
                <p>
	                <label>Traductor</label>
	                <span class="valor"><%= Html.Encode(Model.Form.Traductor)%>&nbsp;</span>
                </p>
                <p>
	                <label>Profesor</label>
	                <span class="valor"><%= Html.Encode(Model.Form.Profesor)%>&nbsp;</span>
                </p>
                <p>
	                <label>Nivel de conversaci&oacute;n</label>
	                <span class="valor"><%= HumanizeHelper.NivelIdioma(Model.Form.NivelConversacion)%>&nbsp;</span>
                </p>
                <p>
	                <label>Nivel de lectura</label>
	                <span class="valor"><%= HumanizeHelper.NivelIdioma(Model.Form.NivelLectura)%>&nbsp;</span>
                </p>
                <p>
	                <label>Nivel de escritura</label>
	                <span class="valor"><%= HumanizeHelper.NivelIdioma(Model.Form.NivelEscritura)%>&nbsp;</span>
                </p>
                <p>
	                <label>Fecha de evaluaci&oacute;n</label>
	                <span class="valor"><%= Html.Encode(Model.Form.FechaEvaluacion)%>&nbsp;</span>
                </p>
                <p>
	                <label>Nombre del documento probatorio</label>
	                <span class="valor"><%= Html.Encode(Model.Form.NombreDocumentoProbatorio)%>&nbsp;</span>
                </p>
                <p>
	                <label>Puntuaci&oacute;n/porcentaje</label>
	                <span class="valor"><%= Html.Encode(Model.Form.Puntuacion)%>&nbsp;</span>
                </p>                
                
                <p class="submit">
                    <%=Html.ActionLink<IdiomasInvestigadorController>(x => x.Index(), "Regresar") %>
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
