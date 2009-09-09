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
            <div class="elementodescripcion">
                <p>
                    <label>T&iacute;tulo</label>
                    <%= Html.Encode(Model.Form.Titulo) %>
                </p>
                <p>
                    <label>Nombre</label>
                    <%= Html.Encode(Model.Form.Nombre) == "" ? "<span>No hay nombre registrado</span>" : Html.Encode(Model.Form.Nombre)%>
                </p>
                <p>
                    <label>Medio impreso</label>
                    <%= Html.Encode(Model.Form.MedioImpresoNombre) == "" ? "<span>No hay medio impreso registrado</span>" : Html.Encode(Model.Form.MedioImpresoNombre)%>
                </p>
                <p>
                    <label>Especificaci&oacute;n de medio impreso</label>
                    <%= Html.Encode(Model.Form.EspecificacionMedioImpreso) == "" ? "<span>No hay especificación de medio impreso registrado</span>" : Html.Encode(Model.Form.EspecificacionMedioImpreso)%>
                </p>
                <p>
                    <label>Medio electr&oacute;nico</label>
                    <%= Html.Encode(Model.Form.MedioElectronicoNombre) == "" ? "<span>No hay medio electrónico registrado</span>" : Html.Encode(Model.Form.MedioElectronicoNombre)%>
                </p>
                <p>
                    <label>Especificaci&oacute;n de medio electr&oacute;nico</label>
                    <%= Html.Encode(Model.Form.EspecificacionMedioElectronico) == "" ? "<span>No hay especificación de medio electrónico registrado</span>" : Html.Encode(Model.Form.EspecificacionMedioElectronico)%>
                </p>
                <p>
                    <label>G&eacute;nero</label>
                    <%= Html.Encode(Model.Form.GeneroNombre) == "" ? "<span>No hay género registrado</span>" : Html.Encode(Model.Form.GeneroNombre)%>
                </p>
                <p>
                    <label>Tema</label>
                    <%= Html.Encode(Model.Form.Tema) == "" ? "<span>No hay tema registrado</span>" : Html.Encode(Model.Form.Tema)%>
                </p>
                <p>
                    <label>Periodo de referencia</label>
                    <%= Html.Encode(Model.Form.PeriodoReferenciaPeriodo) %>
                </p>
                <p>
                    <label>Proyecto</label>
                    <%= Html.Encode(Model.Form.ProyectoNombre) == "" ? "<span>No hay proyecto registrado</span>" : Html.Encode(Model.Form.ProyectoNombre) %>
                </p>
                <p>
                    <label>L&iacute;nea tem&aacute;tica</label>
                    <%= Html.Encode(Model.Form.LineaTematicaNombre) == "" ? "<span>No hay línea temática registrada</span>" : Html.Encode(Model.Form.LineaTematicaNombre) %>
                </p>
                <p>
                    <label>&Aacute;mbito</label>
                    <%= Html.Encode(Model.Form.Ambito) == "" ? "<span>No hay ámbito registrado</span>" : Html.Encode(Model.Form.Ambito)%>
                </p>
                <p>
                    <label>Fecha de difusi&oacute;n</label>
                    <%= Html.Encode(Model.Form.FechaDifusion) == "" ? "<span>No hay fecha de difusión registrada</span>" : Html.Encode(Model.Form.FechaDifusion)%>
                </p>                
                <p>
                    <label>Pa&iacute;s</label>
                    <%= Html.Encode(Model.Form.PaisNombre) == "" ? "<span>No hay país registrado</span>" : Html.Encode(Model.Form.PaisNombre)%>
                </p>
                <p>
                    <label>Estado</label>
                    <%= Html.Encode(Model.Form.EstadoPaisNombre) == "" ? "<span>No hay estado registrado</span>" : Html.Encode(Model.Form.EstadoPaisNombre)%>
                </p>
                <p>
                    <label>Ciudad</label>
                    <%= Html.Encode(Model.Form.Ciudad) == "" ? "<span>No hay ciudad registrada</span>" : Html.Encode(Model.Form.Ciudad)%>
                </p>
                <p>
                    <label>Nota period&iacute;stica</label>
                    <%= Html.Encode(Model.Form.NotaPeriodistica) == "" ? "<span>No hay nota periodística registrada</span>" : Html.Encode(Model.Form.NotaPeriodistica)%>
                </p>
                <p>
	                <label>Palabra clave 1</label>
	                <%= Html.Encode(Model.Form.PalabraClave1) == "" ? "<span>No hay palabra clave 1 registrada</span>" : Html.Encode(Model.Form.PalabraClave1)%>    
                </p>
                <p>
	                <label>Palabra clave 2</label>
	                <%= Html.Encode(Model.Form.PalabraClave2) == "" ? "<span>No hay palabra clave 2 registrada</span>" : Html.Encode(Model.Form.PalabraClave2)%>    
                </p>
                <p>
	                <label>Palabra clave 3</label>
                    <%= Html.Encode(Model.Form.PalabraClave3) == "" ? "<span>No hay palabra clave 3 registrada</span>" : Html.Encode(Model.Form.PalabraClave3)%>    
                </p>
                
                <p class="submit">
                    <%=Html.ActionLink<ParticipacionMedioController>(x => x.Index(), "Regresar") %>
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
