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
	    
            <% using (Html.BeginForm("Update", "Investigador")) { %>
                <%=Html.AntiForgeryToken() %>
                <%=Html.Hidden("Id", Model.Form.Id) %>

                <h4>Informaci&oacute;n personal</h4>
		        <p>
			        <label>Usuario</label>
			        <%=Html.Encode(Model.Form.Nombre) %>
		        </p>
		        
		        <% Html.RenderPartial("_InformacionPersonal", Model.Form); %>
		        
		        <h4>Perfil ac&aacute;demico del investigador</h4>
		        <p>
			        <label>Ingreso  como investigador</label>
			        <%=Html.TextBox("FechaIngreso", Model.Form.FechaIngreso, new { @class="datetime input100-requerido", maxlength = 10 })%>
			        <span>(Formato dd/mm/yyyy)</span>
			        <%=Html.ValidationMessage("FechaIngreso")%>
		        </p>
	            <p>
		            <label>Fecha de contrato indeterminado</label>
		            <%=Html.TextBox("FechaContrato", Model.Form.FechaContrato, new { @class = "datetime input100-requerido", maxlength = 10 })%>
		            <span>(Formato dd/mm/yyyy)</span>
		            <%=Html.ValidationMessage("FechaContrato")%>
	            </p>
	            
	            <h4>Grado Acad&eacute;mico del Investigador</h4>
			    <% Html.RenderPartial("_EditGrado", Model.Form); %>
	            
	            <h4>Perfil ac&aacute;demico del investigador</h4> 		        
                <% Html.RenderPartial("_PerfilAcademico", Model.Form); %>
                
		        <h4>Estatus del Investigador</h4>
			    <% Html.RenderPartial("_EditEstado", Model.Form); %>
		        
		        <h4>Adscripci&oacute;n en El Colef</h4>
			    <% Html.RenderPartial("_EditCargo", Model.Form); %>
			    
		        <h4>Categor&iacute;a del investigador</h4>
			    <% Html.RenderPartial("_EditCategoria", Model.Form); %>
		        
		        <h4>Sistema nacional de investigadores</h4>
		        <p>
                    <label>Expediente SNI</label>
                    <%=Html.TextBox("ExpedienteSNI", Model.Form.ExpedienteSNI, new { @class = "input250", maxlength = 40 })%>
                    <span class="cvu"></span> 
                </p>
			    <% Html.RenderPartial("_EditSni", Model.Form); %>                                  

                <p class="submit">
                    <%=Html.SubmitButton("Guardar", "Guardar cambios") %> &oacute; <%=Html.ActionLink<InvestigadorController>(x => x.Index(), "Regresar")%>
                </p>
                            
            <% } %>
            
	    </div><!--end forma-->	
    		
    </div><!--end textos-->
        
<script type="text/javascript">
    $(document).ready(function() {
        setupDocument();
    });
</script>
</asp:Content>
