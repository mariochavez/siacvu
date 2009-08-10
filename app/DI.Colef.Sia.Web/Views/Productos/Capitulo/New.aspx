<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true" 
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<CapituloForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DI.Colef.Sia.Web.Controllers" %>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <h2><%=Html.Encode(Model.Title) %></h2>
    <% Html.RenderPartial("_Message"); %>
    <br />
    <% using (Html.BeginForm("Create", "Capitulo")) { %>
		<div id="form">
		<%=Html.AntiForgeryToken() %>
        <%=Html.Hidden("Id", Model.Form.Id) %>        
        
		    <table class="form">
                <tr>
                    <td class="label required">
                       <label>Capitulo:</label>
                    </td>
                    <td class="field">
                        <% Html.RenderPartial("_DatosCapitulo", Model.Form); %>
                    </td>
                </tr>
                <tr>
                    <td class="label">
                       <label>Coautores Internos:</label>
                    </td>
                    <td class="field">
                        <% Html.RenderPartial("_EditCoautorInterno", Model.Form); %>
                    </td>
                </tr>
                <tr>
                    <td class="label">
                       <label>Coautores Externos:</label>
                    </td>
                    <td class="field">
                        <% Html.RenderPartial("_EditCoautorExterno", Model.Form); %>
                    </td>
                </tr>                
                <tr>
                    <td class="label required">
                       <label>Referencia bibliografica:</label>
                    </td>
                    <td class="field">                        
                        <% Html.RenderPartial("_ReferenciaBibliografica", Model.Form); %>
                    </td>
                </tr>
                <tr>
                    <td class="label">
                       <label>Responsables Internos del libro:</label>
                    </td>
                    <td class="field">
                        <% Html.RenderPartial("_EditResponsableInterno", Model.Form); %>
                    </td>
                </tr>
                
                <tr>
                    <td class="label">
                       <label>Responsables Externos:</label>
                    </td>
                    <td class="field">
                        <% Html.RenderPartial("_EditResponsableExterno", Model.Form); %>
                    </td>
                </tr>
                <tr>
                    <td class="label required">
                       <label>Referencia Bibliografica:</label>
                    </td>
                    <td class="field">                        
                        <% Html.RenderPartial("_ResponsablesLibro", Model.Form); %>
                    </td>
                </tr>
                <tr>
                    <td class="label required">
                       <label>Opcionales:</label>
                    </td>
                    <td class="field">
                        <% Html.RenderPartial("_DatosOpcionales", Model.Form); %>
                    </td>
                </tr>
		    </table>
		    
			<div class="btn_container_footer">
				<span class="btn btn_normal_brown">
					<%=Html.SubmitButton("Guardar", "Guardar Cambios") %>
				</span>
				<span class="btn btn_normal_white">
					<%=Html.ActionLink<CapituloController>(x => x.Index(), "Regresar") %>
				</span>
			</div>
	    </div>
    <% } %>
    
<script type="text/javascript">
    $(document).ready(function() {
        setupDocument();
    });
</script>
</asp:Content>
