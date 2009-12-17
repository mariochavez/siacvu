<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true" 
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<InvestigadorForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DI.Colef.Sia.Web.Controllers" %>

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
    
        <% Html.RenderPartial("_Message"); %>
	    <div id="forma">
	    
            <div id="campos">

                <h4>Informaci&oacute;n personal</h4>
		        <p>
			        <span class="valor"><%=Html.Encode(Model.Form.NombreCompleto) %></span><br/>
			        <span class="valor"><%=Html.Encode(Model.Form.GradosAcademicosInvestigador[0].GradoAcademicoNombre) %> en <%=Html.Encode(Model.Form.GradosAcademicosInvestigador[0].Programa) %></span><br/>
			        <span class="valor"><%=Html.Encode(Model.Form.GradosAcademicosInvestigador[0].InstitucionNombre)%>, <%=Html.Encode(Model.Form.GradosAcademicosInvestigador[0].InstitucionPaisNombre)%></span><br/>
			        <span class="valor">Profesor/Investigador <%=Html.Encode(Model.Form.CategoriasInvestigador[0].CategoriaNombre) %></span><br/>
			        <span class="valor">Sistema Nacional de Investigadores <%=Html.Encode(Model.Form.SNIsInvestigador[0].SNINombre) %></span><br/>
			        <span class="valor">El Colegio de la Frontera Norte</span><br/>
			        <span class="valor"><%=Html.Encode(Model.Form.CargosInvestigador[0].DepartamentoNombre) %></span><br/>
			        <span class="valor"><%=Html.Encode(Model.Form.CargosInvestigador[0].SedeDireccionRegionalNombre) %></span><br/>
			        <span class="valor">Sede: <%=Html.Encode(Model.Form.CargosInvestigador[0].SedeNombre) %></span><br/>
			        <%if (Model.Form.CargosInvestigador[0].SedeNombre.Contains("Tijuana")) {%>
			            <span class="valor">Km 18.5 Carretera Escénica Tijuana - Ensenada, San Antonio del Mar,</span><br/>
			            <span class="valor">Tijuana, Baja California, México. C.P. 22560</span><br/>
			            <span class="valor">P.O. Box "L", Chula Vista, CA. 91912-1257, USA</span><br/>
			        <% } %>
			        <%if (Model.Form.CargosInvestigador[0].SedeNombre.Contains("Ciudad Juárez")) {%>
			            <span class="valor">Av. Insurgentes No. 3708, Col. Los Nogales. Ciudad Juárez, Chihuahua,</span><br/>
			            <span class="valor">México. C.P. 32350</span><br/>
			            <span class="valor">PMB 6248, Edgemere 761 El Paso Texas 79925. USA</span><br/>
			        <% } %>
			        
			        
			        
			        
			        
			        <%if (Model.Form.CargosInvestigador[0].SedeNombre.Contains("")) {%>
			            <span class="valor"></span><br/>
			            <span class="valor"></span><br/>
			            <span class="valor"></span><br/>
			        <% } %>
			        
		        </p>
	            
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
