<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true"
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<ParticipacionMedioForm>>" %>
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
            Aqu&iacute; se muestra la informaci&oacute;n detallada de la participaci&oacute;n en medios como est&aacute; en el sistema.
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
                    <span class="valor"><%= Html.Encode(Model.Form.DepartamentoNombre)%>&nbsp;</span>
                </p>
                <p>
                    <label>Sede</label>
                    <span class="valor"><%= Html.Encode(Model.Form.SedeNombre)%>&nbsp;</span>
                </p>
                <p>
                    <label>Tipo de participaci&oacuten</label>
                    <span class="valor"><%= Html.Encode(Model.Form.TipoParticipacionNombre)%>&nbsp;</span>
                </p>
                <p>
                    <label>T&iacute;tulo</label>
                    <span class="valor"><%= Html.Encode(Model.Form.Titulo) %>&nbsp;</span>
                </p>
                <p>
	                <label>Palabra clave 1</label>
	                <span class="valor"><%= Html.Encode(Model.Form.PalabraClave1)%>&nbsp;</span>
                </p>
                <p>
	                <label>Palabra clave 2</label>
	                <span class="valor"><%= Html.Encode(Model.Form.PalabraClave2)%>&nbsp;</span>
                </p>
                <p>
	                <label>Palabra clave 3</label>
                    <span class="valor"><%= Html.Encode(Model.Form.PalabraClave3)%>&nbsp;</span>
                </p>
                
                <% Html.RenderPartial("_ShowAreaTematica", Model.Form.ShowFields); %>
                
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
                    <span>Formato (dd/mm/yyyy)</span>
                </p>
                
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