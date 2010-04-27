<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true" 
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<InvestigadorForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Core.DataInterfaces" %>

<asp:Content ID="titleContent" ContentPlaceHolderID="TituloPlaceHolder" runat="server">
    <h2><%=Html.Encode(Model.Title) %></h2>
</asp:Content>

<asp:Content ID="introductionContent" ContentPlaceHolderID="IntroduccionPlaceHolder" runat="server">
	<div id="introduccion">
		<p>Curriculum Vitae del Investigador.</p>
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
    
        <%
            Html.RenderPartial("_Message");%>
	    <div id="curriculum">
	    
            <div id="campos">

                <h4><center>CURRICULUM VITAE</center></h4>
		        <p>
			        <span class="encabezadoValor"><%=Html.Encode(Model.Form.NombreCompleto)%></span><br />
			        <span class="valor"><%=Html.Encode(Model.Form.GradosAcademicosInvestigador[0].GradoAcademicoNombre)%> en <%=Html.Encode(Model.Form.GradosAcademicosInvestigador[0].Programa)%></span><br />
			        <span class="valor"><%=Html.Encode(Model.Form.GradosAcademicosInvestigador[0].InstitucionNombre)%>, <%=Html.Encode(Model.Form.GradosAcademicosInvestigador[0].InstitucionPaisNombre)%></span><br />
			        <span class="valor">Profesor/Investigador <%=Html.Encode(Model.Form.CategoriasInvestigador[0].CategoriaNombre)%></span><br />
			        <span class="valor">Sistema Nacional de Investigadores <%=Html.Encode(Model.Form.SNIsInvestigador[0].SNINombre)%></span><br />
                    <br />
			        <span class="tituloValor">El Colegio de la Frontera Norte</span><br/>
			        <span class="tituloValor"><%=Html.Encode(Model.Form.CargosInvestigador[0].DepartamentoNombre)%></span><br/>
			        <span class="tituloValor"><%=Html.Encode(Model.Form.CargosInvestigador[0].SedeDireccionRegionalNombre)%></span><br/>
			        <span class="tituloValor">Sede: <%=Html.Encode(Model.Form.CargosInvestigador[0].SedeNombre)%></span><br/>
			        
                    <%=Html.InvestigadorSede(Model.Form.CargosInvestigador[0].SedeNombre)%><br />

                    <span class="tituloValor">&Aacute;reas de t&eacute;matica: </span><span class="valor"><%=Html.Encode(Model.Form.AreaTematicaNombre)%></span><br />
                    <span class="tituloValor">Temas de inter&eacute;s: </span><span class="valor"></span><br />
                    <br />
                 </p>

                 <!-- Produccion Academica -->
                <% if ((Model.Form.ListaProductos[0] as CurriculumDTO[]).Length > 0) { %>
                    <span class="encabezadoValor">Producci&oacute;n Academica</span><br />

                    <!-- Articulos Cientificos -->
                    <% if (Html.ListaProductoTipo((CurriculumDTO[])Model.Form.ListaProductos[0], 1).Length > 0) { %>
                        <br />
                        <span class="tituloValor">Articulos cient&iacute;ficos</span><br />
                        <% Html.RenderPartial("_ProducccionAcademica", Html.ListaProductoTipo((CurriculumDTO[])Model.Form.ListaProductos[0], 1));%><br />
                    <% } %>

                    <!-- Articulos Difusion -->
                    <% if (Html.ListaProductoTipo((CurriculumDTO[])Model.Form.ListaProductos[0], 16).Length > 0) { %>
                         <br />
                         <span class="tituloValor">Articulos de difusi&oacute;n</span><br />
                         <% Html.RenderPartial("_ProducccionAcademica", Html.ListaProductoTipo((CurriculumDTO[])Model.Form.ListaProductos[0], 16));%><br />
                    <% } %>

                    <!-- Capitulos -->
                    <% if (Html.ListaProductoTipo((CurriculumDTO[])Model.Form.ListaProductos[0], 2).Length > 0) { %>
                        <br />
                        <span class="tituloValor">Capitulo</span><br />
                        <% Html.RenderPartial("_ProducccionAcademica", Html.ListaProductoTipo((CurriculumDTO[])Model.Form.ListaProductos[0], 2));%><br />
                    <% } %>

                <% } %>
                
                <br />
                <% if ((Model.Form.ListaProductos[1] as CurriculumDTO[]).Length > 0) {%>
                    <span class="encabezadoValor">Formaci&oacute;n de recursos humanos</span><br />
                    
                    <% if (Html.ListaProductoTipo((CurriculumDTO[])Model.Form.ListaProductos[1], 3).Length > 0) { %>
                        <br />
                        <span class="tituloValor">Cursos</span><br />
                        <% Html.RenderPartial("_FormacionRecursosHumanos", Html.ListaProductoTipo((CurriculumDTO[])Model.Form.ListaProductos[1], 3));%><br />
                    <% } %>
                    
                    <% if (Html.ListaProductoTipo((CurriculumDTO[])Model.Form.ListaProductos[1], 13).Length > 0) { %>
                        <br />
                        <span class="tituloValor">Tesis Dirigidas</span><br />
                        <% Html.RenderPartial("_FormacionRecursosHumanos", Html.ListaProductoTipo((CurriculumDTO[])Model.Form.ListaProductos[1], 13));%><br />
                    <% } %>
                <% } %>
                
                <br />
                <% if ((Model.Form.ListaProductos[2] as CurriculumDTO[]).Length > 0) {%>
                    <span class="encabezadoValor">Proyectos</span><br />
                    <br />
                    <% Html.RenderPartial("_Proyectos", Html.ListaProductoTipo((CurriculumDTO[])Model.Form.ListaProductos[2], 15));%><br />
                <% } %>
                
                <br />
                <% if ((Model.Form.ListaProductos[3] as CurriculumDTO[]).Length > 0) {%>
                    <span class="encabezadoValor">Vinculaci&oacute;n y Difusi&oacute;n</span><br />

                    <% if (Html.ListaProductoTipo((CurriculumDTO[])Model.Form.ListaProductos[3], 4).Length > 0) {%>
                        <br />
                        <span class="tituloValor">Dictamenes</span><br />
                        <% Html.RenderPartial("_VinculacionDifusion", Html.ListaProductoTipo((CurriculumDTO[])Model.Form.ListaProductos[3], 4));%><br />
                    <% } %>

                    <% if (Html.ListaProductoTipo((CurriculumDTO[])Model.Form.ListaProductos[3], 8).Length > 0) {%>
                        <br />
                        <span class="tituloValor">Organo Externo</span><br />
                        <% Html.RenderPartial("_VinculacionDifusion", Html.ListaProductoTipo((CurriculumDTO[])Model.Form.ListaProductos[3], 8));%><br />
                    <% } %>
                
                    <% if (Html.ListaProductoTipo((CurriculumDTO[])Model.Form.ListaProductos[3], 10).Length > 0) {%>
                        <br />
                        <span class="tituloValor">Participaci&oacute;n en Medio</span><br />
                        <% Html.RenderPartial("_VinculacionDifusion", Html.ListaProductoTipo((CurriculumDTO[])Model.Form.ListaProductos[3], 10));%><br />
                    <% } %>
                <% } %>
                
                <br />
                <% if ((Model.Form.ListaProductos[4] as CurriculumDTO[]).Length > 0) {%>
                    <br />
                    <span class="tituloValor">Eventos</span><br />
                    <% Html.RenderPartial("_Evento", Html.ListaProductoTipo((CurriculumDTO[])Model.Form.ListaProductos[4], 6));%><br />
                <% } %>

                <p class="submit">
                    <%=Html.ActionLink<InvestigadorController>(x => x.Index(), "Regresar")%>
                </p>
                            
            </div><!--end campos-->
            
	    </div><!--end forma-->	
    		
    </div><!--end textos-->
        
<script type="text/javascript">
    $(document).ready(function() {
        setupDocument();
    });
</script>
</asp:Content>
