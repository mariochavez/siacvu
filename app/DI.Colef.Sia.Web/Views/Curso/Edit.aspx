<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true" 
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<CursoForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DI.Colef.Sia.Web.Controllers" %>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <h2><%=Html.Encode(Model.Title) %></h2>
    <% Html.RenderPartial("_Message"); %>
    <br />
    <% using (Html.BeginForm("Update", "Curso"))
       { %>
        <div id="form">
        <%=Html.AntiForgeryToken() %>
        <%=Html.Hidden("Id", Model.Form.Id) %>
        <%=Html.Hidden("Investigador", Model.Form.Investigador) %>

        <table class="form">
            <tr>
                    <td class="label required">
                       <label>Datos de Curso:<em>*</em></label>
                    </td>
                    <td class="field">
                        <% Html.RenderPartial("_DatosCurso", Model.Form); %>
                    </td>
                </tr>
                <tr>
                    <td class="label required">
                       <label>Datos Opcionales:<em>*</em></label>
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
			    <%=Html.ActionLink<CursoController>(x => x.Index(), "Regresar")%>
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
