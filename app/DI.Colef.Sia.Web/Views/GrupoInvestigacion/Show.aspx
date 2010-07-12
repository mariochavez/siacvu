<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true"
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<GrupoInvestigacionForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>

<asp:Content ID="titleContent" ContentPlaceHolderID="TituloPlaceHolder" runat="server">
    <h2>
        <%=Html.Encode(Model.Title) %>
    </h2>
</asp:Content>

<asp:Content ID="introductionContent" ContentPlaceHolderID="IntroduccionPlaceHolder" runat="server">
    <div id="introduccion">
        <p>
            Aqu&iacute; se muestra la informaci&oacute;n detallada del grupo de investigaci&oacute;n como est&aacute; en el sistema.
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
                    <label>Nombre del grupo de investigaci&oacute;n</label>
                    <span class="valor"><%=Html.Encode(Model.Form.NombreGrupoInvestigacion)%>&nbsp;</span>
                </p>
                <p>
                    <label>Fecha de creaci&oacute;n</label>
                    <span class="valor"><%=Html.Encode(Model.Form.FechaCreacion)%>&nbsp;</span><span>Formato (dd/mm/aaaa)</span>
                </p>
                
                <% Html.RenderPartial("_Show2doNivel", Model.Form.ShowFields);%>
                
                <h4>&nbsp;</h4>
                <p>
                    <label>L&iacute;der</label>
                    <span class="valor"><%=HumanizeHelper.Boolean(Model.Form.Lider)%>&nbsp;</span>
                </p>
                <% if (Model.Form.Lider) { %>
                    <p>
                        <label>Nombre</label>
                        <span class="valor"><%= Html.Encode(Model.Form.InvestigadorNombre)%></span>
                    </p>
                <% } %>
               
               <h4>
                    <a href="#coautores_area" class="collapsable <%=Html.CollapsePanelClass(Model.Form.MiembroExternoGrupoInvestigaciones.Length + Model.Form.MiembroInternoGrupoInvestigaciones.Length) %>">
                        <span class="ui-icon ui-icon-circle-arrow-s"></span>
                        Miembros del Grupo de investigaci&oacute;n 
                        <span>
                        <%=Html.Encode(Model.Form.MiembroExternoGrupoInvestigaciones.Length + Model.Form.MiembroInternoGrupoInvestigaciones.Length)%> miembro(s)
                        </span> 
                        <span class="cvu"></span>
                    </a>
                </h4>
                <span id="coautores_area">
                <% Html.RenderPartial("_ShowCoautorInterno", new CoautorForm { CoautoresInternos = Model.Form.MiembroInternoGrupoInvestigaciones, CoautorSeOrdenaAlfabeticamente = Model.Form.CoautorSeOrdenaAlfabeticamente }); %>
	            <% Html.RenderPartial("_ShowCoautorExterno", new CoautorForm { CoautoresExternos = Model.Form.MiembroExternoGrupoInvestigaciones, CoautorSeOrdenaAlfabeticamente = Model.Form.CoautorSeOrdenaAlfabeticamente }); %>
	            <% Html.RenderPartial("_CoautorEmptyListMessage", new CoautorForm { CoautoresExternos = Model.Form.MiembroExternoGrupoInvestigaciones, CoautoresInternos = Model.Form.MiembroInternoGrupoInvestigaciones }); %>
                <p>
                    <label>Investigador</label>
                    <span class="valor"><%=Html.Encode(Model.Form.InvestigadorNombre) %></span>
                    <label class="right">Posici&oacute;n</label>
                    <span class="valor"><%=Html.Encode(Model.Form.PosicionCoautor)%>&nbsp;</span>
                </p>
	            </span> 
               
                <h4>&nbsp;</h4>
                <p>
                    <label>Impacto / Productividad</label>
                    <span class="valor"><%= Html.Encode(Model.Form.Impacto)%>&nbsp;</span>
                </p>
                <p>
	                <label>Vinculaci&oacute;n con el Sector Productivo</label>
	                <span class="valor"><%= Html.Encode(Model.Form.VinculacionSectorProductivo)%>&nbsp;</span>
                </p>
                <p>
	                <label>Vinculaci&oacute;n con el Sector Social</label>
	                <span class="valor"><%= Html.Encode(Model.Form.VinculacionSectorSocial)%>&nbsp;</span>
                </p>
                <p>
	                <label>Colaboraci&oacute;n</label>
                    <span class="valor"><%= Html.Encode(Model.Form.Colaboracion)%>&nbsp;</span>
                </p>
                <p>
                    <label>Administraci&oacute;n</label>
                    <span class="valor"><%= Html.Encode(Model.Form.Administracion)%>&nbsp;</span>
                </p>
                <p>
                    <label>Programa registrado</label>
                    <span class="valor"><%= Html.Encode(Model.Form.ProgramaRegistrado)%>&nbsp;</span>
                </p>
                
                <p class="submit">
                    <%=Html.ActionLink<GrupoInvestigacionController>(x => x.Index(), "Regresar") %>
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