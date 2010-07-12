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
	    
            <% using (Html.BeginForm("Create", "Investigador", FormMethod.Post, new{ @class = "remote"})) { %>
                    <%=Html.AntiForgeryToken() %>
                    <%=Html.Hidden("Id", Model.Form.Id) %>
                    
                    <h4>Informaci&oacute;n personal</h4>
                    <p>
                        <label>Usuario</label>
                        <%=Html.DropDownList("Usuario", Model.Form.Usuarios.CreateSelectList<UsuarioForm>("Id", "NombreCompleto"),
                                                        "Seleccione ...", new { @class = "requerido cascade", rel = Url.Action("changeuser") })%>
                        <%=Html.ValidationMessage("Usuario") %>
                    </p>
                    
                    <% Html.RenderPartial("_InformacionPersonal", Model.Form); %>
                    
		            <h4>Perfil ac&aacute;demico del Investigador</h4>	            
                    <p>
                        <label>Ingreso como investigador</label>

                        <%=Html.TextBox("FechaIngreso", Model.Form.FechaIngreso, new { @class = "datetime input100-requerido", maxlength = 10 })%>
                        <span>(Formato dd/mm/aaaa)</span>
                        <span class="cvu"></span>
                        <%=Html.ValidationMessage("FechaIngreso")%>
                    </p>
                    <p>
                        <label>Fecha de contrato indeterminado</label>

                        <%=Html.TextBox("FechaContrato", Model.Form.FechaContrato, new { @class = "datetime input100", maxlength = 10 })%>
                        <span>(Formato dd/mm/aaaa)</span>
                    </p>
                    
                    <h4>Grado Acad&eacute;mico del Investigador</h4>
                    <% Html.RenderPartial("_NewGrado", Model.Form); %>
                    
                    <h4>Perfil acad&eacute;mico del Investigador</h4>
                    <% Html.RenderPartial("_PerfilAcademico", Model.Form); %>
                    
                    <h4>Estatus del Investigador</h4>
                    <% Html.RenderPartial("_NewEstado", Model.Form); %>

                    <h4>Adscripci&oacute;n en El Colef</h4>
                    <% Html.RenderPartial("_NewCargo", Model.Form); %>
                    
                    <h4>Categor&iacute;a del investigador</h4>
                    <% Html.RenderPartial("_NewCategoria", Model.Form); %>
                    
                    <h4>Sistema nacional de investigadores</h4>
                    <p>
                        <label>Expediente SNI</label>
                        <%=Html.TextBox("ExpedienteSNI", Model.Form.ExpedienteSNI, new { @class = "input250", maxlength = 40 })%>
                        <span class="cvu"></span> 
                    </p>
                    <% Html.RenderPartial("_NewSni", Model.Form); %>
                    
                    <% Html.RenderPartial("_ProgressBar"); %>
                                     
                    <p class="submit">
                        <%=Html.SubmitButton("Guardar", "Guardar cambios") %> &oacute; <%=Html.ActionLink<InvestigadorController>(x => x.Index(), "Regresar", new{id="regresar"})%>
                    </p>
            <% } %>
	    </div><!--end forma-->	
    		
    </div><!--end textos-->
			    
<script type="text/javascript">
    $(document).ready(function() {
        setupDocument();

        investigadorSetup();

        var auth = "<% = Request.Cookies[FormsAuthentication.FormsCookieName]==null ? string.Empty : Request.Cookies[FormsAuthentication.FormsCookieName].Value %>";
        var uploader = '<%=ResolveUrl("~/Scripts/uploadify.swf") %>';
        var cancelImg = '<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>';
        var action = '<%=Url.Action("AddFile") %>';
        
        UploadFile.setup('#GradoAcademicoInvestigador_DocumentoProbatorio', 'GradoAcademico_FileQueue',
            uploader, cancelImg, action, auth);
        UploadFile.setup('#EstadoInvestigador_DocumentoProbatorio', 'Estado_FileQueue',
            uploader, cancelImg, action, auth);
        UploadFile.setup('#CargoInvestigador_DocumentoProbatorio', 'Cargo_FileQueue',
            uploader, cancelImg, action, auth);
        UploadFile.setup('#CategoriaInvestigador_DocumentoProbatorio', 'Categoria_FileQueue',
            uploader, cancelImg, action, auth);
        UploadFile.setup('#SniInvestigador_DocumentoProbatorio', 'Sni_FileQueue',
            uploader, cancelImg, action, auth);
    });
</script>
</asp:Content>
