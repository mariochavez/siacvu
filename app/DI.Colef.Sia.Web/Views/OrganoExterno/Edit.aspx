<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true" 
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<OrganoExternoForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DI.Colef.Sia.Web.Controllers" %>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <h2><%=Html.Encode(Model.Title) %></h2>
    <% Html.RenderPartial("_Message"); %>
    <br />
    
    <% using (Html.BeginForm("Update", "OrganoExterno")){ %>
        <div id="form">
        <%=Html.AntiForgeryToken() %>
        <%=Html.Hidden("Id", Model.Form.Id) %>

            <table class="form">
		        <tr>
                    <td class="label required">
                       <label>Datos Organo Externo:</label>
                    </td>
                    <td class="field">
                        <% Html.RenderPartial("_DatosOrganoExterno", Model.Form); %>
                    </td>
		        </tr>                              
            </table>
        
	        <div class="btn_container_footer">
		        <span class="btn btn_normal_brown">
			        <%=Html.SubmitButton("Guardar", "Guardar Cambios") %>
		        </span>
		        <span class="btn btn_normal_white">
			        <%=Html.ActionLink<OrganoExternoController>(x => x.Index(), "Regresar")%>
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
