<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true"
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<ExperienciaProfesionalForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Core" %>

<asp:Content ID="titleContent" ContentPlaceHolderID="TituloPlaceHolder" runat="server">
    <h2>
         <%=Html.ProductoShowTitle(TipoProductoEnum.ExperienciaProfesional) %>
    </h2>
</asp:Content>

<asp:Content ID="introductionContent" ContentPlaceHolderID="IntroduccionPlaceHolder" runat="server">
    <div id="introduccion">
        <p>
           <%=Html.ProductoShowMessage(TipoProductoEnum.ExperienciaProfesional) %>
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
                    <label>Nombramiento</label>
                    <span class="valor"><%= Html.Encode(Model.Form.Nombramiento)%>&nbsp;</span>
                </p>
                <p>
                    <label>Entidad</label>
                    <span class="valor"><%= HumanizeHelper.EntidadExperienciaProfesional(Model.Form.Entidad)%>&nbsp;</span>
                </p>
                <p>
                    <label>Fecha inicial</label>
                    <span class="valor"><%= Html.Encode(Model.Form.FechaInicial)%>&nbsp;</span>
                    <span>Formato (dd/mm/yyyy)</span>
                </p>
                <p>
                    <label>Fecha final</label>
                    <span class="valor"><%= Html.Encode(Model.Form.FechaFinal)%>&nbsp;</span>
                    <span>Formato (dd/mm/yyyy)</span>
                </p>
                <p>
                    <label>Pa&iacute;s</label>
                    <span class="valor"><%= Html.Encode(Model.Form.PaisNombre)%>&nbsp;</span>
                </p>
                
            	<% Html.RenderPartial("_Show2doNivel", Model.Form.ShowFields); %>
            	<% Html.RenderPartial("_ShowSubdisciplina", Model.Form.ShowFields); %>
            	<% Html.RenderPartial("_ShowClase", Model.Form.ShowFields); %>
                
                <p>
                    <label>L&iacute;nea de investigaci&oacute;n 1</label>
                    <span class="valor"><%= Html.Encode(Model.Form.LineaInvestigacion1)%>&nbsp;</span>
                </p>
                <p>
                    <label>L&iacute;nea de investigaci&oacute;n 2</label>
                    <span class="valor"><%= Html.Encode(Model.Form.LineaInvestigacion2)%>&nbsp;</span>
                </p>
                <p>
                    <label>L&iacute;nea de investigaci&oacute;n 3</label>
                    <span class="valor"><%= Html.Encode(Model.Form.LineaInvestigacion3)%>&nbsp;</span>
                </p>
                <p>
                    <label>Principales logros</label>
                    <span class="valor"><%= Html.Encode(Model.Form.PrincipalesLogros)%>&nbsp;</span>
                </p>
                
                <p class="submit">
                    <%=Html.ActionLink<ExperienciaProfesionalController>(x => x.Index(), "Regresar") %>
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