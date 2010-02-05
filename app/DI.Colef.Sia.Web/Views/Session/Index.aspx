<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Login.Master" AutoEventWireup="true" 
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<HomeForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<%@ Import Namespace="DI.Colef.Sia.Web.Controllers" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers" %>

<asp:Content ID="introductionContent" ContentPlaceHolderID="IntroduccionPlaceHolder" runat="server">
    <div id="subcontenido">
	    <h3>Inicio de sesi&oacute;n</h3>
		<p>Para iniciar una sesi&oacute;n en el <strong>sistema de administraci&oacute;n acad&eacute;mica</strong>, utilice la forma
		    de abajo e introduzca la informaci&oacute;n que se le solicita.</p>
		
		
		<div class="asistentelogo">
		    <h1><img alt="Colegio de la Frontera Norte" src="<%=ResolveUrl("~/Content/Images/colef-logo.gif") %>" /></h1>
		</div>
	</div><!--end subcontenido-->
</asp:Content>

<asp:Content ID="sidebarContent" ContentPlaceHolderID="SidebarContentPlaceHolder" runat="server">
    <div id="barra">
        <div id="asistente">
            <h3>Asistente de inicio de sesi&oacute;n</h3>
            <p>Introduzca el <strong>usuario</strong> y <strong>clave secreta</strong> que le fu&eacute; asignado por el &aacute;rea de sistemas.</p>
        </div><!--end asistente-->
        
    </div><!--end barra-->
</asp:Content>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
<div id="textos">

    <div id="forma">
	    <%if(!String.IsNullOrEmpty(Html.ValidationMessage("_FORM"))) { %>
	        <div class="mensaje-error">			
                <%=Html.ValidationMessage("_FORM") %>
            </div>
        <% } %>
        <% using (Html.BeginForm("Create", "Session")) { %>
                <p>
                    <label>Usuario</label>
                    <%=Html.TextBox("username", ViewData["Username"], new { @class = "input250-requerido", maxlength = 20 })%>
                    <%=Html.ValidationMessage("Username")%>
                </p>
                <p>
                    <label>Clave</label>

                    <%=Html.Password("password", ViewData["Password"], new { @class = "input250-requerido", maxlength = 20 })%>
                    <%=Html.ValidationMessage("Password")%>
                </p>
                <p>
                    <label>Recu&eacute;rdame</label>
                    <%=Html.CheckBox("rememberMe", ViewData["RememberMe"])%>
                </p>
                <p class="submit">
                    <%=Html.SubmitButton("Login", "Iniciar sesión") %>
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
