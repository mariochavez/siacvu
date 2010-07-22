<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true" 
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<CursoForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Core"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Productos"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DI.Colef.Sia.Web.Controllers" %>

<asp:Content ID="titleContent" ContentPlaceHolderID="TituloPlaceHolder" runat="server">
    <h2>
        <%=Html.ProductoNewTitle(TipoProductoEnum.Curso) %>
    </h2>
</asp:Content>

<asp:Content ID="introductionContent" ContentPlaceHolderID="IntroduccionPlaceHolder" runat="server">
	<div id="introduccion">
		<p>
            <%=Html.ProductoNewMessage(TipoProductoEnum.Curso) %>
		</p>
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

            <% using (Html.BeginForm("Create", "Curso", FormMethod.Post, new { @class = "remote" })){ %>			
		        <%=Html.AntiForgeryToken() %>
                <%=Html.Hidden("Id", Model.Form.Id) %>
                <%=Html.Hidden("Contexto", "curso", new { url = Url.Action("Glosario") })%>
                
                <h4>Datos del curso</h4>
                <p>
                    <label>Tipo de curso</label>
                    <%=Html.DropDownList("TipoCurso", Model.Form.TiposCursos.CreateSelectList<CustomSelectForm>("Id", "Nombre"),
                        "Seleccione ...", new { @class = "requerido" })%>
                    <%=Html.ValidationMessage("TipoCurso")%>
                </p>
                
                <div id="cursointerno_field">
                    <h4>Cursos en El Colef</h4>
                    <% Html.RenderPartial("_ShowCursoInvestigador", Model.Form); %>
                </div>
                
                <div id="cursoexterno_field">
                    <h4>Cursos en instituciones externas</h4>
                    <% Html.RenderPartial("_ShowCursoExterno", Model.Form); %>
                </div>
                <h4>&aacute;rea del conocimiento</h4>
                
                <% Html.RenderPartial("_ShowSubdisciplina", new ShowFieldsForm { Areas = Model.Form.Areas, Disciplinas = Model.Form.Disciplinas, Subdisciplinas = Model.Form.Subdisciplinas, IsShowForm = false }); %>
                
                <% Html.RenderPartial("_EditArchivo", Model.Form); %>

				<% Html.RenderPartial("_ProgressBar"); %>
                
                <p class="submit">
                    <%=Html.SubmitButton("Guardar", "Guardar cambios") %> &oacute; <%=Html.ActionLink<CursoController>(x => x.Index(), "Regresar", new { id = "regresar" })%>
                </p>
            <% } %>
	    </div><!--end forma-->	
    		
    </div><!--end textos-->
    
<script type="text/javascript">
    $(document).ready(function() {
        setupDocument();
        cursoSetup();

        var auth = "<% = Request.Cookies[FormsAuthentication.FormsCookieName]==null ? string.Empty : Request.Cookies[FormsAuthentication.FormsCookieName].Value %>";
        var uploader = '<%=ResolveUrl("~/Scripts/uploadify.swf") %>';
        var cancelImg = '<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>';
        var uploadImg = '<%=ResolveUrl("~/Content/Images/adjuntar.png") %>';
        var action = '<%=Url.Action("AddFile") %>';

        UploadMulti.setup('#uploadify', 'fileQueue', uploader, cancelImg, uploadImg, action, auth);
    });
</script>
</asp:Content>
