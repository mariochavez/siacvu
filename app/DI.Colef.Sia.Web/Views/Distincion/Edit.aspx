<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true" 
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<DistincionForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DI.Colef.Sia.Web.Controllers" %>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <h2><%=Html.Encode(Model.Title) %></h2>
    <% Html.RenderPartial("_Message"); %>
    <br />
    <% using (Html.BeginForm("Update", "Distincion")) { %>
        <div id="form">
        <%=Html.AntiForgeryToken() %>
        <%=Html.Hidden("Id", Model.Form.Id) %>

        <table class="form">
	        <tr>
                <td class="label required">
                   <label>Datos Distincion:</label>
                </td>
                <td class="field">
                    <% Html.RenderPartial("_DatosDistincion", Model.Form); %>
                </td>
	        </tr>                                 
        </table>
        
	    <div class="btn_container_footer">
		    <span class="btn btn_normal_brown">
			    <%=Html.SubmitButton("Guardar", "Guardar Cambios") %>
		    </span>
		    <span class="btn btn_normal_white">
			    <%=Html.ActionLink<DistincionController>(x => x.Index(), "Regresar") %>
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
