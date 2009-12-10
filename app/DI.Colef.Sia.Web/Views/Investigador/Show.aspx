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
		<p>Para modificar el investigador utilice los siguientes campos para realizar cambios dentro del sistema.</p>
	</div><!--end introduccion-->	
</asp:Content>

<asp:Content ID="sidebarContent" ContentPlaceHolderID="SidebarContentPlaceHolder" runat="server">
    <div id="barra">
        <div id="asistente">
            <h3>Asistente de secci&oacute;n</h3>
            <% Html.RenderPartial("_EditSidebar"); %>
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
			        <label>Usuario</label>
			        <span class="valor"><%=Html.Encode(Model.Form.Nombre) %></span>
		        </p>
		        
		        <% Html.RenderPartial("_InformacionPersonal", Model.Form); %>
		        
		        <h4>Perfil ac&aacute;demico del investigador</h4>
		        <p>
			        <label>Ingreso  como investigador</label>
			        <span class="valor"><%=Html.Encode(Model.Form.FechaIngreso) %></span>
			        <span>(Formato dd/mm/yyyy)</span>
		        </p>
	            <p>
		            <label>Fecha de contrato</label>
		            <span class="valor"><%=Html.Encode(Model.Form.FechaContrato) %>&nbsp;</span>
		            <span>(Formato dd/mm/yyyy)</span>
	            </p>
	            
	            <h4>Grados</h4>
			    <% Html.RenderPartial("_ShowGrado", Model.Form); %>
	            
	            <h4>Perfil ac&aacute;demico del investigador</h4> 		        
                <p>
                    <label>Expediente producci&oacute;n</label>
                    <span class="valor"><%=Html.Encode(Model.Form.ExpedienteProduccion)%>&nbsp;</span>
                </p> 
                <p>
                    <label>Expediente acad&eacute;mico</label>
                    <span class="valor"><%=Html.Encode(Model.Form.ExpedienteAcademico)%>&nbsp;</span>
                </p>                         
                <p>
                    <label>Clave CVU</label>
                    <span class="valor"><%=Html.Encode(Model.Form.ClaveCVU)%>&nbsp;</span>
                </p>
		        <h4>Estatus</h4>
			    <% Html.RenderPartial("_ShowEstado", Model.Form); %>
		        
		        <h4>Cargos</h4>
			    <% Html.RenderPartial("_ShowCargo", Model.Form); %>
			    
		        <h4>Categor&iacute;as</h4>
			    <% Html.RenderPartial("_ShowCategoria", Model.Form); %>
		        
		        <h4>Sistema nacional de investigadores (SNI)</h4>
		        <p>
                    <label>Expediente</label>
                    <span class="valor"><%=Html.Encode(Model.Form.ExpedienteSNI)%>&nbsp;</span>
                </p>
			    <% Html.RenderPartial("_ShowSni", Model.Form); %>                                  

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
