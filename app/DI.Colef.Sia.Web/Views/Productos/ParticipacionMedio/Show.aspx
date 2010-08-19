<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true"
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<ParticipacionMedioForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Core"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Productos"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>

<asp:Content ID="titleContent" ContentPlaceHolderID="TituloPlaceHolder" runat="server">
    <h2>
        <%=Html.ProductoShowTitle(TipoProductoEnum.ParticipacionMedio) %>
    </h2>
</asp:Content>

<asp:Content ID="introductionContent" ContentPlaceHolderID="IntroduccionPlaceHolder" runat="server">
    <div id="introduccion">
        <p>
            <%=Html.ProductoShowMessage(TipoProductoEnum.ParticipacionMedio) %>
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
               <%-- <h4>Datos del investigador</h4>
	            <p>
                    <label>Nombre</label>
                    <span class="valor"><%= Html.Encode(Model.Form.InvestigadorNombre)%>&nbsp;</span>
                </p>
	            <p>
                    <label>Departamento</label>
                    <span class="valor"><%= Html.Encode(Model.Form.DepartamentoNombre)%>&nbsp;</span>
                </p>
                <p>
                    <label>Sede</label>
                    <span class="valor"><%= Html.Encode(Model.Form.SedeNombre)%>&nbsp;</span>
                </p>--%>
                
                <h4>Datos de la participaci&oacute;n en medio</h4>
                <p>
                    <label>Tipo de participaci&oacute;n</label>
                    <span class="valor"><%= Html.Encode(Model.Form.TipoParticipacionNombre)%>&nbsp;</span>
                    <%= Html.OtraParticipacion(Model.Form) %>
                </p>



                <p>
                    <% if (Model.Form.TipoParticipacionNombre.Contains("Presentación de libro")){ %>
                        <label>Nombre del libro</label>
                    <% } else if (Model.Form.TipoParticipacionNombre.Contains("Presentación resultados de investigación")){ %>
                        <label>Nombre del proyecto de investigaci&oacute;n</label>
                    <% } else if(Model.Form.TipoParticipacionNombre.Contains("Periódico/Diario")){ %>
                        <label>Nota period&iacute;stica</label>
                    <% } else { %>
                        <label>T&iacute;tulo/Tema presentado</label>
                    <% } %>
                    <span class="valor"><%= Html.Encode(Model.Form.Titulo) %>&nbsp;</span>
                </p>
                
                
                
                
                <p>
                    <label>Instituci&oacute;n responsable/Nombre del medio</label>
                    <span class="valor"><%= Html.Encode(Model.Form.Institucion)%>&nbsp;</span>
                </p>
                <p>
                    <label>&Aacute;mbito</label>
                    <span class="valor"><%= Html.Encode(Model.Form.AmbitoNombre)%>&nbsp;</span>
                </p>
                <p>
                    <label>Dirigido a</label>
                    <span class="valor"><%= Html.Encode(Model.Form.DirigidoANombre)%>&nbsp;</span>
                </p>
                <p>
                    <label>Lugar de la presentaci&oacute;n</label>
                    <span class="valor"><%= Html.Encode(Model.Form.LugarPresentacion)%>&nbsp;</span>
                </p>
                <p>
                    <label>Fecha de la presentaci&oacute;n</label>
                    <span class="valor"><%= Html.Encode(Model.Form.FechaPresentacion)%>&nbsp;</span>
                    <span>Formato (dd/mm/aaaa)</span>
                </p>
                <h4>&aacute;rea del conocimiento</h4>
                <h5>El Colef</h5>
                <p>
                    <label>
                        L&iacute;nea tem&aacute;tica institucional</label>
                    <span class="valor">
                        <%= Html.Encode(Model.Form.AreaTematica.LineaTematicaNombre) %>&nbsp; </span>
                </p>
                <p>
                    <label>
                        &Aacute;rea tem&aacute;tica institucional</label>
                    <span class="valor">
                        <%= Html.Encode(Model.Form.AreaTematica.Nombre) %>&nbsp; </span>
                </p>
                <% Html.RenderPartial("_ShowPalabrasClave", Model.Form.ShowFields); %>
                <p class="submit">
                    <%=Html.ActionLink<ParticipacionMedioController>(x => x.Index(), "Regresar") %>
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