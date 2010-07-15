<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true" 
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<InvestigadorForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

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
			        <span>(Formato dd/mm/aaaa)</span>
		        </p>
	            <p>
		            <label>Fecha de contrato indeterminado</label>
		            <span class="valor"><%=Html.Encode(Model.Form.FechaContrato) %>&nbsp;</span>
		            <span>(Formato dd/mm/aaaa)</span>
	            </p>
	            
	            <h4>Grado Acad&eacute;mico del Investigador</h4>
			    <% Html.RenderPartial("_ShowGrado", Model.Form); %>
	            
	            <h4>Perfil ac&aacute;demico del investigador</h4>
	            <p>
                    <label>L&iacute;nea tem&aacute;tica Institucional</label>
                    <span class="valor"><%=Html.Encode(Model.Form.AreaTematicaLineaTematicaNombre)%>&nbsp;</span>
                </p>
                <p>
                    <label>&Aacute;rea tem&aacute;tica Institucional</label>
                    <span class="valor"><%=Html.Encode(Model.Form.AreaTematicaNombre)%>&nbsp;</span>
                </p>
                <p>
                    <label>Area tem&aacute;tica 1</label>
                    <span class="valor"><%=Html.Encode(Model.Form.AreaTematica1)%>&nbsp;</span>
                </p>
                <p>
                    <label>Area tem&aacute;tica 2</label>
                    <span class="valor"><%=Html.Encode(Model.Form.AreaTematica2)%>&nbsp;</span>
                </p>
                <p>
                    <label>Area tem&aacute;tica 3</label>
                    <span class="valor"><%=Html.Encode(Model.Form.AreaTematica3)%>&nbsp;</span>
                </p>
                <p>
                    <label>Expediente producci&oacute;n</label>
                    <span class="valor"><%=Html.Encode(Model.Form.ExpedienteProduccion)%>&nbsp;</span>
                </p> 
                <p>
                    <label>Expediente acad&eacute;mico</label>
                    <span class="valor"><%=Html.Encode(Model.Form.ExpedienteAcademico)%>&nbsp;</span>
                </p>                         
                <p>
                    <label>Clave de CVU-CONACyT</label>
                    <span class="valor"><%=Html.Encode(Model.Form.ClaveCVU)%>&nbsp;</span>
                </p>
                <p>
                    <label>Clave CVU</label>
                    <span class="valor"><%=Html.Encode(Model.Form.ClaveCVU)%>&nbsp;</span>
                </p>
		        <h4>Estatus del Investigador</h4>
			    <% Html.RenderPartial("_ShowEstado", Model.Form); %>
		        
		        <h4>Adscripci&oacute;n en El Colef</h4>
			    <% Html.RenderPartial("_ShowCargo", Model.Form); %>
			    
		        <h4>Categor&iacute;a del investigador</h4>
			    <% Html.RenderPartial("_ShowCategoria", Model.Form); %>
		        
		        <h4>Sistema nacional de investigadores (SNI)</h4>
		        <p>
                    <label>Expediente SNI</label>
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
