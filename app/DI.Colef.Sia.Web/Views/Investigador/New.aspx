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
                        <span>(Formato dd/mm/yyyy)</span>
                        <span class="cvu"></span>
                        <%=Html.ValidationMessage("FechaIngreso")%>
                    </p>
                    <p>
                        <label>Fecha de contrato indeterminado</label>

                        <%=Html.TextBox("FechaContrato", Model.Form.FechaContrato, new { @class = "datetime input100", maxlength = 10 })%>
                        <span>(Formato dd/mm/yyyy)</span>
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
                    
                    <div class="progress_container">
	                    <div class="status_message"></div>
	                    <div class="progress_bar">
		                    <div class="progress" style="width: 0px;"></div>
	                    </div>
                    </div>
                                     
                    <p class="submit">
                        <%=Html.SubmitButton("Guardar", "Guardar cambios") %> &oacute; <%=Html.ActionLink<InvestigadorController>(x => x.Index(), "Regresar", new{id="regresar"})%>
                    </p>
                    <p class="waiting">
                        <img src='<%=ResolveUrl("~/Content/Images/ajax-loader.gif") %>' /> <span>Guardando informaci&oacute;n ...</span>
                    </p>
            <% } %>
	    </div><!--end forma-->	
    		
    </div><!--end textos-->
			    
<script type="text/javascript">
    $(document).ready(function() {
        setupDocument();

        investigadorSetup();

        var auth = "<% = Request.Cookies[FormsAuthentication.FormsCookieName]==null ? string.Empty : Request.Cookies[FormsAuthentication.FormsCookieName].Value %>";

        $('#GradoAcademicoInvestigador_DocumentoProbatorio').uploadify({
            'uploader': '<%=ResolveUrl("~/Scripts/uploadify.swf") %>',
            'script': '<%=Url.Action("AddFile") %>',
            'cancelImg': '<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>',
            'folder': '<%=Url.Action("AddFile") %>',
            'queueID': 'GradoAcademico_FileQueue',
            'auto': false,
            'multi': false,
            'buttonText': 'Adjuntar',
            'onSelect': Upload.onSelect,
            'onSelectOnce': Upload.onSelectOnce,
            'onProgress': Upload.onProgress,
            'onAllComplete': Upload.onAllComplete,
            'onCancel': Upload.onCancel,
            'onError': error,
            'scriptData': { token: auth }
        });

        $('#EstadoInvestigador_DocumentoProbatorio').uploadify({
            'uploader': '<%=ResolveUrl("~/Scripts/uploadify.swf") %>',
            'script': '<%=Url.Action("AddFile") %>',
            'cancelImg': '<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>',
            'folder': '<%=Url.Action("AddFile") %>',
            'queueID': 'Estado_FileQueue',
            'auto': false,
            'multi': false,
            'buttonText': 'Adjuntar',
            'onSelect': Upload.onSelect,
            'onSelectOnce': Upload.onSelectOnce,
            'onProgress': Upload.onProgress,
            'onAllComplete': Upload.onAllComplete,
            'onCancel': Upload.onCancel,
            'onError': error,
            'scriptData': { token: auth }
        });

        $('#CargoInvestigador_DocumentoProbatorio').uploadify({
            'uploader': '<%=ResolveUrl("~/Scripts/uploadify.swf") %>',
            'script': '<%=Url.Action("AddFile") %>',
            'cancelImg': '<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>',
            'folder': '<%=Url.Action("AddFile") %>',
            'queueID': 'Cargo_FileQueue',
            'auto': false,
            'multi': false,
            'buttonText': 'Adjuntar',
            'onSelect': Upload.onSelect,
            'onSelectOnce': Upload.onSelectOnce,
            'onProgress': Upload.onProgress,
            'onAllComplete': Upload.onAllComplete,
            'onCancel': Upload.onCancel,
            'onError': error,
            'scriptData': { token: auth }
        });

        $('#CategoriaInvestigador_DocumentoProbatorio').uploadify({
            'uploader': '<%=ResolveUrl("~/Scripts/uploadify.swf") %>',
            'script': '<%=Url.Action("AddFile") %>',
            'cancelImg': '<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>',
            'folder': '<%=Url.Action("AddFile") %>',
            'queueID': 'Categoria_FileQueue',
            'auto': false,
            'multi': false,
            'buttonText': 'Adjuntar',
            'onSelect': Upload.onSelect,
            'onSelectOnce': Upload.onSelectOnce,
            'onProgress': Upload.onProgress,
            'onAllComplete': Upload.onAllComplete,
            'onCancel': Upload.onCancel,
            'onError': error,
            'scriptData': { token: auth }
        });

        $('#SniInvestigador_DocumentoProbatorio').uploadify({
            'uploader': '<%=ResolveUrl("~/Scripts/uploadify.swf") %>',
            'script': '<%=Url.Action("AddFile") %>',
            'cancelImg': '<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>',
            'folder': '<%=Url.Action("AddFile") %>',
            'queueID': 'Sni_FileQueue',
            'auto': false,
            'multi': false,
            'buttonText': 'Adjuntar',
            'onSelect': Upload.onSelect,
            'onSelectOnce': Upload.onSelectOnce,
            'onProgress': Upload.onProgress,
            'onAllComplete': Upload.onAllComplete,
            'onCancel': Upload.onCancel,
            'onError': error,
            'scriptData': { token: auth }
        });
    });
</script>
</asp:Content>
