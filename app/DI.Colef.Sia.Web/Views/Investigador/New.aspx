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
		<p>Favor de llenar los siguientes campos para dar de alta un nuevo investigador dentro del sistema.</p>
	</div><!--end introduccion-->	
</asp:Content>

<asp:Content ID="sidebarContent" ContentPlaceHolderID="SidebarContentPlaceHolder" runat="server">
    <div id="barra">
        <div id="asistente">
            <h3>Asistente de secci&oacute;n</h3>
            <% Html.RenderPartial("_NewSidebar"); %>
        </div><!--end asistente-->
    </div><!--end barra-->
</asp:Content>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div id="textos">

        <% Html.RenderPartial("_Message"); %>    
	    <div id="forma">
	    
            <% using (Html.BeginForm("Create", "Investigador")) { %>
                    <%=Html.AntiForgeryToken() %>
                    <%=Html.Hidden("Id", Model.Form.Id) %>
                    
                    <h4>Informacion&oacute;n personal</h4>
                    <p>
                        <label>Usuario</label>
                        <%=Html.DropDownList("Usuario", Model.Form.Usuarios.CreateSelectList<UsuarioForm>("Id", "NombreCompleto"),
                                                        "Seleccione ...", new { @class = "requerido cascade", rel = Url.Action("changeuser") })%>
                        <%=Html.ValidationMessage("Usuario") %>
                    </p>
                    
                    <% Html.RenderPartial("_InformacionPersonal", Model.Form); %>
                    
		            <h4>Perfil del investigador</h4>	            
                    <p>
                        <label>Ingreso como investigador</label>

                        <%=Html.TextBox("FechaIngreso", Model.Form.FechaIngreso, new { @class = "datetime input100-requerido", maxlength = 10 })%>
                        <span>(Formato dd/mm/yyyy)</span>
                        <span class="cvu"></span>
                        <%=Html.ValidationMessage("FechaIngreso")%>
                    </p>
                    <p>
                        <label>Fecha de contrato</label>

                        <%=Html.TextBox("FechaContrato", Model.Form.FechaContrato, new { @class = "datetime input100-requerido", maxlength = 10 })%>
                        <span>(Formato dd/mm/yyyy)</span>
                        <span class="cvu"></span>
                        <%=Html.ValidationMessage("FechaContrato")%>
                    </p>                                      
		            <p>
                        <label>Expediente SNI</label>
                        <%=Html.TextBox("ExpedienteSNI", Model.Form.ExpedienteSNI, new { @class = "input250", maxlength = 40 })%>
                    </p>
                    <p>
                        <label>Expediente producci&oacute;n</label>
                        <%=Html.TextBox("ExpedienteProduccion", Model.Form.ExpedienteProduccion, new { @class = "input250", maxlength = 40 })%>
                    </p> 
                    <p>
                        <label>Expediente acad&eacute;mico</label>
                        <%=Html.TextBox("ExpedienteAcademico", Model.Form.ExpedienteAcademico, new { @class = "input250", maxlength = 40 })%>
                    </p>                         
                    <p>
                        <label>Clave CVU</label>
                        <%=Html.TextBox("ClaveCVU", Model.Form.ClaveCVU, new { @class = "input250", maxlength = 40 })%>
                    </p>
                
                    <h4>Estado</h4>
                    <% Html.RenderPartial("_NewEstado", Model.Form); %>

                    <h4>Grados</h4>
                    <% Html.RenderPartial("_NewGrado", Model.Form); %>

                    <h4>Categorias</h4>
                    <% Html.RenderPartial("_NewCategoria", Model.Form); %>
                    
                    <h4>Cargos</h4>
                    <% Html.RenderPartial("_NewCargo", Model.Form); %>
                    
                    <h4>SNIs</h4>
                    <% Html.RenderPartial("_NewSni", Model.Form); %>
                    
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
