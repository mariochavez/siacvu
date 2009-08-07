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
        <%=Html.Hidden("Investigador", Model.Form.Investigador) %>
        
		    <table class="form">
                <tr>
                    <td class="label required">
                       <label>Datos de Capitulo:<em>*</em></label>
                    </td>
                    <td class="field">
                        <% Html.RenderPartial("_DatosCapitulo", Model.Form); %>
                    </td>
                </tr>
                <tr>
                    <td class="label required">
                       <label>Referencia bibliografica:</label>
                    </td>
                    <td class="field">
                        <% Html.RenderPartial("_NewCoautorInterno", Model.Form); %>
                        <% Html.RenderPartial("_NewCoautorExterno", Model.Form); %>
                        <% Html.RenderPartial("_ReferenciaBibliografica", Model.Form); %>
                    </td>
                </tr>
                <tr>
                    <td class="label required">
                       <label>Responsables del libro:<em>*</em></label>
                    </td>
                    <td class="field">
                        <% Html.RenderPartial("_NewResponsableInterno", Model.Form); %>
                        <% Html.RenderPartial("_NewResponsableExterno", Model.Form); %>
                        <% Html.RenderPartial("_ResponsablesLibro", Model.Form); %>
                    </td>
                </tr>
                <tr>
                    <td class="label required">
                       <label>Opcionales:<em>*</em></label>
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
