<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true"
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<ReporteForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Core"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Productos"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DI.Colef.Sia.Web.Controllers" %>

<asp:Content ID="titleContent" ContentPlaceHolderID="TituloPlaceHolder" runat="server">
    <h2>
        <%=Html.ProductoShowTitle(TipoProductoEnum.Reporte) %>
    </h2>
</asp:Content>

<asp:Content ID="introductionContent" ContentPlaceHolderID="IntroduccionPlaceHolder" runat="server">
    <div id="introduccion">
        <p>
            <%=Html.ProductoShowMessage(TipoProductoEnum.Reporte) %>
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
                
    <!-- DATOS DEL REPORTE TECNICO-->
                <h4>Datos de la publicaci&oacute;n</h4>
                <p>
                    <label>Nombre de la publicaci&oacute;n</label>
                    <span class="valor"><%= Html.Encode(Model.Form.Titulo) %>&nbsp;</span>
                </p>
                
                <p>
                    <label>Tipo de publicaci&oacute;n</label>
                    <span class="valor"><%= HumanizeHelper.TipoReporte(Model.Form.TipoReporte)%>&nbsp;</span>
                </p>

                <h4>
                    <a href="#coautores_area" class="collapsable <%=Html.CollapsePanelClass(Model.Form.CoautorExternoReportes.Length + Model.Form.CoautorInternoReportes.Length) %>">
                        <span class="ui-icon ui-icon-circle-arrow-s"></span>
                        Coautores del <span id="coautores" class="titulovalor"><%=Model.Form.TipoReporte == 1 ? "Documento de Trabajo" : "Reporte T&eacute;cnico" %></span> 
                        <span><%=Html.Encode(Model.Form.CoautorExternoReportes.Length + Model.Form.CoautorInternoReportes.Length)%> coautor(es) </span>
                        <span class="cvu"></span>
                    </a>
                </h4>
                <span id="coautores_area">
				<% Html.RenderPartial("_ShowCoautorInterno", new CoautorForm { CoautoresInternos = Model.Form.CoautorInternoReportes, CoautorSeOrdenaAlfabeticamente = Model.Form.CoautorSeOrdenaAlfabeticamente }); %>
	            <% Html.RenderPartial("_ShowCoautorExterno", new CoautorForm { CoautoresExternos = Model.Form.CoautorExternoReportes, CoautorSeOrdenaAlfabeticamente = Model.Form.CoautorSeOrdenaAlfabeticamente }); %>
	            <% Html.RenderPartial("_CoautorEmptyListMessage", new CoautorForm { CoautoresExternos = Model.Form.CoautorExternoReportes, CoautoresInternos = Model.Form.CoautorInternoReportes }); %>
                <p>
                    <label>Investigador</label>
                    <span class="valor"><%=Html.Encode(Model.Form.InvestigadorNombre) %></span>
					<label class="right">Posici&oacute;n</label>
                    <span class="valor"><%=Html.Encode(Model.Form.PosicionCoautor)%>&nbsp;</span>
                </p>
                </span>
                
                <% Html.RenderPartial("_ShowEstadoProducto", Model.Form.ShowFields); %>
                
                <% if (Model.Form.TipoReporte == 1){ %>
                    <h4>Contenido del documento de trabajo</h4>
                    <% Html.RenderPartial("_ShowDocumentoTrabajo", Model.Form); %>
                <% } if (Model.Form.TipoReporte == 2){%>
                    <h4>Contenido del reporte t&eacute;cnico</h4>
                    <% Html.RenderPartial("_ShowReporteTecnico", Model.Form); %>
                <% } %>
                
                
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
                <% Html.RenderPartial("_ShowArchivo", Model.Form); %>
                <p class="submit">
                    <%=Html.ActionLink<ReporteController>(x => x.Index(), "Regresar") %>
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