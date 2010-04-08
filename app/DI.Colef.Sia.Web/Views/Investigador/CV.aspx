<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true" 
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<InvestigadorForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DI.Colef.Sia.Web.Controllers" %>
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
			        <span class="titulovalor"><%=Html.Encode(Model.Form.NombreCompleto)%></span><br />
			        <span class="valor"><%=Html.Encode(Model.Form.GradosAcademicosInvestigador[0].GradoAcademicoNombre)%> en <%=Html.Encode(Model.Form.GradosAcademicosInvestigador[0].Programa)%></span><br />
			        <span class="valor"><%=Html.Encode(Model.Form.GradosAcademicosInvestigador[0].InstitucionNombre)%>, <%=Html.Encode(Model.Form.GradosAcademicosInvestigador[0].InstitucionPaisNombre)%></span><br />
			        <span class="valor">Profesor/Investigador <%=Html.Encode(Model.Form.CategoriasInvestigador[0].CategoriaNombre)%></span><br />
			        <span class="valor">Sistema Nacional de Investigadores <%=Html.Encode(Model.Form.SNIsInvestigador[0].SNINombre)%></span><br />
                    <br />
			        <span class="titulovalor">El Colegio de la Frontera Norte</span><br/>
			        <span class="titulovalor"><%=Html.Encode(Model.Form.CargosInvestigador[0].DepartamentoNombre)%></span><br/>
			        <span class="titulovalor"><%=Html.Encode(Model.Form.CargosInvestigador[0].SedeDireccionRegionalNombre)%></span><br/>
			        <span class="titulovalor">Sede: <%=Html.Encode(Model.Form.CargosInvestigador[0].SedeNombre)%></span><br/>
			        
                    <%=Html.InvestigadorSede(Model.Form.CargosInvestigador[0].SedeNombre)%><br />

                    <span class="titulovalor">&Aacute;reas de t&eacute;matica: </span><span class="valor"><%=Html.Encode(Model.Form.AreaTematicaNombre)%></span><br />
                    <span class="titulovalor">Temas de inter&eacute;s: </span><span class="valor"></span><br />
                    <br />
                 </p>

                <% if ((Model.Form.ListaProductos[0] as CurriculumDTO[]).Length > 0){ %>
                    <span class="titulovalor">Publicaciones</span><br />
                    <% Html.RenderPartial("_Productos", Model.Form.ListaProductos[0]);%><br />
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
