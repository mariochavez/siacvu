<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true" 
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<HomeForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<%@ Import Namespace="DI.Colef.Sia.Web.Controllers" %>

<asp:Content ID="titleContent" ContentPlaceHolderID="TituloPlaceHolder" runat="server">
    <div id="tituloseccion"></div>
</asp:Content>

<asp:Content ID="introductionContent" ContentPlaceHolderID="IntroduccionPlaceHolder" runat="server">
</asp:Content>

<asp:Content ID="sidebarContent" ContentPlaceHolderID="SidebarContentPlaceHolder" runat="server">
</asp:Content>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">				
    <% Html.RenderPartial("_Message"); %>
    <% Html.RenderPartial("_Menu"); %>
					    
    <%--<div class="FondoMenuLadoA" id="ColumnaA">

                        <div class="modulo left">
                            <h1>Produccion Academica</h1>
                            <ul>
                                <li><a href="#">Dictamenes</a></li>
                                <li><a href="#">Articulos Cientificos</a></li>
                                <li><a href="#">Articulos de Difusion</a></li>
                                <li><a href="#">Distinciones Academicas</a></li>
                                <li><a href="#">Proyectos</a></li>
                                <li><a href="#">Capitulos</a></li>
                                <li><a href="#">Libros</a></li>
                                <li><a href="#">Reportes tecnicos</a></li>
                                <li><a href="#">Reseñas</a></li>
                             </ul>
                        </div>
                    
                    
                    
                    
                    
                        <div class="modulo left">
                            <h1>Docencia</h1>
                            <ul>
                                <li><a href="#">Cursos</a></li>
                                <li><a href="#">Tesis Dirigidas</a></li>
                             </ul>
                        </div>
                        
                        
                        
                        
                        
                        <div class="modulo left">
                            <h1>Movilidad  Academica</h1>
                            <ul>
                                <li><a href="#">Estancias en Instituciones Externas</a></li>
                                <li><a href="#">Estancias Academicas Externas</a></li>
                             </ul>
                             <br><br>
                        </div>
		
        </div>
        <div class="FondoMenuLadoB" id="ColumnaB">
        
                <div class="modulo left">
                    <h1>Eventos Academicos</h1>
                    <ul>
                        <li><a href="#">Participacion y organizacion de eventos</a></li>
                        <li><a href="#">Otras participaciones</a></li>
                     </ul>
                </div>
                
                
                      <div class="modulo left">
                    <h1>Vinvulacion y Difusion</h1>
                    <ul>
                        <li><a href="#">Participacion en medios</a></li>
                        <li><a href="#">Grupos de Investigacion</a></li>
                     </ul>
                </div>
                
                
                      <div class="modulo left">
                    <h1>Participacion en organos</h1>
                    <ul>
                        <li><a href="#">Internos</a></li>
                        <li><a href="#">Externos</a></li>
                        
                        <li>&nbsp;</li>
                        <li>&nbsp;</li>
                        
                        <br>
                        <li><a href="#">Otras actividades</a></li>
                        <li><a href="#">Consultorias</a></li>
                     </ul>
                     <br>
                     <br>
                     <br>
                     <br>
<br>
                     <br>

                </div>
		
            
		</div>--%>
<script type="text/javascript">
    $(document).ready(function() {
        setupDocument();
    });
</script>    
</asp:Content>
