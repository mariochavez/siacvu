<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true" 
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<ArticuloForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DI.Colef.Sia.Web.Controllers" %>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <h2><%=Html.Encode(Model.Title) %></h2>
    <% Html.RenderPartial("_Message"); %>
    <br />
    <% using (Html.BeginForm("Create", "Articulo")) { %>
        <div id="form">
        <%=Html.AntiForgeryToken() %>
        <%=Html.Hidden("Id", Model.Form.Id) %>
        
		    <table class="form">
                <tr>
                    <td class="label required">
                       <label>Datos Articulo:</label>
                    </td>
                    <td class="field">
                        <% Html.RenderPartial("_DatosArticulo", Model.Form); %>
                    </td>
                </tr>
                <tr>
                    <td class="label required">
                       <label>Referencia Bibliografica:<em>*</em></label>
                    </td>
                    <td class="field">
                        <% Html.RenderPartial("_ReferenciaBibliografica", Model.Form); %>
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
                    <td class="label">
                       <label>Coautores Externos:</label>
                    </td>
                    <td class="field">
                        <% Html.RenderPartial("_EditCoautorInterno", Model.Form); %>
                    </td>
                </tr>   
                <tr>
                    <td class="label required">
                       <label>Datos Opcionales:</label>
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
				    <%=Html.ActionLink<ArticuloController>(x => x.Index(), "Regresar") %>
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
