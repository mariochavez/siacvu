<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true"
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<EventoForm>>" %>
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
            Aqu&iacute; se muestra la informaci&oacute;n detallada del evento como est&aacute; en el sistema.
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
                    <label>Tipo de evento</label>
                    <%= Html.Encode(Model.Form.TipoEventoNombre) == "" ? "<span>No hay tipo de evento registrado</span>" : Html.Encode(Model.Form.TipoEventoNombre)%>
                </p>
                <p>
                    <label>Nombre del evento</label>
                    <%= Html.Encode(Model.Form.Nombre) %>
                </p>
                <p>
                    <label>Con invitaci&oacute;n</label>
                    <%= Html.Encode(Model.Form.Invitacion) == "" ? "<span>No hay invitación registrada</span>" : Html.Encode(Model.Form.Invitacion)%>
                </p>
                <p>
                    <label>&Aacute;mbito</label>
                    <%= Html.Encode(Model.Form.AmbitoNombre) == "" ? "<span>No hay ámbito registrado</span>" : Html.Encode(Model.Form.AmbitoNombre)%>
                </p>
                <p>
                    <label>T&iacute;tulo del trabajo</label>
                    <%= Html.Encode(Model.Form.Titulo) == "" ? "<span>No hay título del trabajo registrado</span>" : Html.Encode(Model.Form.Titulo)%>
                </p>
                
                <h4>Coautores</h4>
                <p>
                    <label>Tipo de participaci&oacute;n</label>
                    <%= Html.Encode(Model.Form.TipoParticipacionNombre) == "" ? "<span>No hay tipo de participación registrada</span>" : Html.Encode(Model.Form.TipoParticipacionNombre)%>
                </p>
                <div class="minilista" id="coautorinternoList">
                    <h5>Investigador Interno</h5>

                    <% if (Model.Form.CoautorInternoEventos != null && Model.Form.CoautorInternoEventos.Length > 0) { %>
                        <% foreach (var coautorInterno in Model.Form.CoautorInternoEventos){ %>
                        <div class="sublista" id="coautorinterno_<%=Html.Encode(coautorInterno.InvestigadorId) %>">
                            <h6>
                                <%=Html.Encode(coautorInterno.NombreCoautor)%>
                            </h6>
                        </div><!--end sublista-->
                        <% } %>
                    <% } else { %>
                        <div class="sublista" id="coautorinternoEmptyList_form">
                            <h6><span>No hay coautores internos registrados</span></h6>
                        </div><!--end elementodescripcion-->
                    <% } %>
                </div>
                
                <div class="minilista" id="coautorexternoList">
                    <h5>Investigador Externo</h5>

                    <% if (Model.Form.CoautorExternoEventos != null && Model.Form.CoautorExternoEventos.Length > 0) { %>
                        <% foreach (var coautorExterno in Model.Form.CoautorExternoEventos){ %>
	                        <div class="sublista" id="coautorexterno_<%=Html.Encode(coautorExterno.InvestigadorExternoId) %>">
	                            <h6>
	                                <%=Html.Encode(coautorExterno.InvestigadorExternoNombre)%>
                                </h6>
			                </div><!--end sublista-->
                        <% } %>
                    <% } else { %>
                        <div class="sublista" id="coautorexternoEmptyList_form">
                            <h6><span>No hay coautores externos registrados</span></h6>
		                </div><!--end elementodescripcion-->
                    <% } %>
                </div>
                
                <h4>Referencia</h4>
                <p>
                    <label>Instituci&oacute;n organizadora</label>
                    <%= Html.Encode(Model.Form.InstitucionNombre) == "" ? "<span>No hay institución registrada</span>" : Html.Encode(Model.Form.InstitucionNombre)%>
                </p>
                <p>
                    <label>Pa&iacute;s</label>
                    <%= Html.Encode(Model.Form.PaisNombre) == "" ? "<span>No hay país registrado</span>" : Html.Encode(Model.Form.PaisNombre)%>
                </p>
                <p>
                    <label>Estado del pa&iacute;s</label>
                    <%= Html.Encode(Model.Form.EstadoPaisNombre) == "" ? "<span>No hay estado del país registrado</span>" : Html.Encode(Model.Form.EstadoPaisNombre)%>
                </p>
                <p>
                    <label>Ciudad</label>
                    <%= Html.Encode(Model.Form.Ciudad) == "" ? "<span>No hay ciudad registrada</span>" : Html.Encode(Model.Form.Ciudad)%>
                </p>
                <p>
                    <label>Fecha inicial</label>
                    <%= Html.Encode(Model.Form.FechaInicial) == "" ? "<span>No hay fecha inicial registrada</span>" : Html.Encode(Model.Form.FechaInicial)%>
                </p>
                <p>
                    <label>Fecha final</label>
                    <%= Html.Encode(Model.Form.FechaFinal) == "" ? "<span>No hay fecha final registrada</span>" : Html.Encode(Model.Form.FechaFinal)%>
                 </p>
                 <p>
                    <label>Tipo de financiamiento</label>
                    <%= Html.Encode(Model.Form.TipoFinanciamientoNombre) == "" ? "<span>No hay tipo de financiamiento registrado</span>" : Html.Encode(Model.Form.TipoFinanciamientoNombre)%>
                </p>
                <p>
                    <label>L&iacute;nea tem&aacute;tica</label>
                    <%= Html.Encode(Model.Form.LineaTematicaNombre) == "" ? "<span>No hay línea temática registrada</span>" : Html.Encode(Model.Form.LineaTematicaNombre)%>
                </p>
                <p>
                    <label>Periodo de referencia</label>
                    <%=Html.Encode(Model.Form.PeriodoReferenciaPeriodo)%>
                </p>
                
                <h4>Opcionales</h4>
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
                    <%=Html.ActionLink<EventoController>(x => x.Index(), "Regresar") %>
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
