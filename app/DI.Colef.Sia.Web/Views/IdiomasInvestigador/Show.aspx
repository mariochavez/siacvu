<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true"
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<IdiomasInvestigadorForm>>" %>
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
	                <strong><%= Html.Encode(Model.Form.IdiomaNombre)%>&nbsp;</strong>
                </p>
                <p>
	                <label>Lengua materna</label>
	                <strong><%= Html.Encode(Model.Form.LenguaMaterna)%>&nbsp;</strong>
                </p>
                <p>
	                <label>Traductor</label>
	                <strong><%= Html.Encode(Model.Form.Traductor)%>&nbsp;</strong>
                </p>
                <p>
	                <label>Profesor</label>
	                <strong><%= Html.Encode(Model.Form.Profesor)%>&nbsp;</strong>
                </p>
                <p>
	                <label>Nivel de conversaci&oacute;n</label>
	                <strong><%= Html.Encode(Model.Form.NivelConversacionNombre)%>&nbsp;</strong>
                </p>
                <p>
	                <label>Nivel de lectura</label>
	                <strong><%= Html.Encode(Model.Form.NivelLecturaNombre)%>&nbsp;</strong>
                </p>
                <p>
	                <label>Nivel de escritura</label>
	                <strong><%= Html.Encode(Model.Form.NivelEscrituraNombre)%>&nbsp;</strong>
                </p>
                <p>
	                <label>Fecha de evaluaci&oacute;n</label>
	                <strong><%= Html.Encode(Model.Form.FechaEvaluacion)%>&nbsp;</strong>
                </p>
                <p>
	                <label>Nombre del documento probatorio</label>
	                <strong><%= Html.Encode(Model.Form.NombreDocumentoProbatorio)%>&nbsp;</strong>
                </p>
                <p>
	                <label>Puntuaci&oacute;n/porcentaje</label>
	                <strong><%= Html.Encode(Model.Form.Puntuacion)%>&nbsp;</strong>
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
