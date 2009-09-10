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
            <div class="elementodescripcion">
                <p>
	                <label>Idioma</label>
	                <%= Html.Encode(Model.Form.IdiomaNombre) == "" ? "<span>No hay idioma registrado</span>" : Html.Encode(Model.Form.IdiomaNombre) %>
                </p>
                <p>
	                <label>Lengua materna</label>
	                <%= Html.Encode(Model.Form.LenguaMaterna) == "" ? "<span>No hay lengua materna registrada</span>" : Html.Encode(Model.Form.LenguaMaterna) %>
                </p>
                <p>
	                <label>Traductor</label>
	                <%= Html.Encode(Model.Form.Traductor) == "" ? "<span>No hay traductor registrado</span>" : Html.Encode(Model.Form.Traductor) %>
                </p>
                <p>
	                <label>Profesor</label>
	                <%= Html.Encode(Model.Form.Profesor) == "" ? "<span>No hay profesor registrado</span>" : Html.Encode(Model.Form.Profesor) %>
                </p>
                <p>
	                <label>Nivel de conversaci&oacute;n</label>
	                <%= Html.Encode(Model.Form.NivelConversacionNombre) == "" ? "<span>No hay nivel de conversación registrado</span>" : Html.Encode(Model.Form.NivelConversacionNombre) %>
                </p>
                <p>
	                <label>Nivel de lectura</label>
	                <%= Html.Encode(Model.Form.NivelLecturaNombre) == "" ? "<span>No hay nivel de lectura registrado</span>" : Html.Encode(Model.Form.NivelLecturaNombre) %>
                </p>
                <p>
	                <label>Nivel de escritura</label>
	                <%= Html.Encode(Model.Form.NivelEscrituraNombre) == "" ? "<span>No hay nivel de escritura registrado</span>" : Html.Encode(Model.Form.NivelEscrituraNombre) %>
                </p>
                <p>
	                <label>Fecha de evaluaci&oacute;n</label>
	                <%= Html.Encode(Model.Form.FechaEvaluacion) == "" ? "<span>No hay fecha de evaluación registrada</span>" : Html.Encode(Model.Form.FechaEvaluacion) %>
                </p>
                <p>
	                <label>Nombre del documento probatorio</label>
	                <%= Html.Encode(Model.Form.NombreDocumentoProbatorio) == "" ? "<span>No hay documento probatorio registrado</span>" : Html.Encode(Model.Form.NombreDocumentoProbatorio) %>
                </p>
                <p>
	                <label>Puntuaci&oacute;n/porcentaje</label>
	                <%= Html.Encode(Model.Form.Puntuacion) == "" ? "<span>No hay puntuación/porcentaje registrado</span>" : Html.Encode(Model.Form.Puntuacion) %>
                </p>                
                
                <p class="submit">
                    <%=Html.ActionLink<IdiomasInvestigadorController>(x => x.Index(), "Regresar") %>
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
