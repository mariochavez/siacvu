<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true"
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<FormacionAcademicaForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
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
            Aqu&iacute; se muestra la informaci&oacute;n detallada de la formaci&oacute;n acad&eacute;mica como est&aacute; en el sistema.
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
                    <label>Nivel de estudio</label>
                    <span class="valor"><%= Html.Encode(Model.Form.NivelEstudioNombre)%>&nbsp;</span>
                </p>
                <p>
                    <label>N&uacute;mero de c&eacute;dula</label>
                    <span class="valor"><%= Html.Encode(Model.Form.NumeroCedula)%>&nbsp;</span>
                </p>
                <p>
                    <label>T&iacute;tulo de grado</label>
                    <span class="valor"><%= Html.Encode(Model.Form.TituloGrado)%>&nbsp;</span>
                </p>
                <p>
                    <label>Fecha de obtenci&oacute;n</label>
                    <span class="valor"><%= Html.Encode(Model.Form.FechaObtencion)%>&nbsp;</span><span>Formato (dd/mm/yyyy)</span>
                </p>
                <p>
                    <label>Instituci&oacute;n</label>
                    <span class="valor"><%= Html.Encode(Model.Form.InstitucionNombre)%>&nbsp;</span>
                </p>
                <p>
                    <label>T&iacute;tulo de tesis</label>
                    <span class="valor"><%= Html.Encode(Model.Form.TituloTesis)%>&nbsp;</span>
                </p>
                <p>
                    <label>L&iacute;nea tem&aacute;tica</label>
                    <span class="valor"><%= Html.Encode(Model.Form.LineaTematicaNombre)%>&nbsp;</span>
                </p>
                <p>
                    <label>Pa&iacute;s</label>
                    <span class="valor"><%= Html.Encode(Model.Form.PaisNombre)%>&nbsp;</span>
                </p>
                <p>
                    <label>Estado</label>
                    <span class="valor"><%= Html.Encode(Model.Form.EstadoPaisNombre)%>&nbsp;</span>
                </p>
                <p>
                    <label>Ciudad</label>
                    <span class="valor"><%= Html.Encode(Model.Form.Ciudad)%>&nbsp;</span>
                </p>
                <p>
                    <label>Estatus</label>
                    <span class="valor"><%= Html.Encode(Model.Form.EstatusNombre)%>&nbsp;</span>
                </p>
                
                <% if (Model.Form.Nivel2Id != 0) { %>
                	<h4>Estructura funcional</h4>
                	<% Html.RenderPartial("_Show2doNivel", Model.Form.ShowFields); %>
                <% } %>
                
                <% if (Model.Form.SubdisciplinaId != 0) { %>
                	<h4>&Aacute;rea de conocimiento</h4>
                	<% Html.RenderPartial("_ShowSubdisciplina", Model.Form.ShowFields); %>
                <% } %>
                
                <p class="submit">
                    <%=Html.ActionLink<FormacionAcademicaController>(x => x.Index(), "Regresar") %>
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