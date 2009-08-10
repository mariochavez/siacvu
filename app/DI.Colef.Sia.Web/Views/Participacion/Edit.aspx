<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true" 
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<ParticipacionForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DI.Colef.Sia.Web.Controllers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <h2><%=Html.Encode(Model.Title) %></h2>
    <% Html.RenderPartial("_Message"); %>
    <br />
    <% using (Html.BeginForm("Update", "Participacion"))
       { %>
        <div id="Div1">
        <%=Html.AntiForgeryToken() %>
        <%=Html.Hidden("Id", Model.Form.Id) %>

        <table class="form">
            <tr>
                <td class="label required">
                   <label>Participacion:</label>
                </td>
                <td class="field">
                    <% Html.RenderPartial("_DatosParticipacion", Model.Form); %>
                </td>
            </tr>
        </table>
        
	    <div class="btn_container_footer">
		    <span class="btn btn_normal_brown">
			    <%=Html.SubmitButton("Guardar", "Guardar Cambios") %>
		    </span>
		    <span class="btn btn_normal_white">
			    <%=Html.ActionLink<ParticipacionController>(x => x.Index(), "Regresar")%>
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
