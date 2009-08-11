<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true" 
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<InvestigadorForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DI.Colef.Sia.Web.Controllers" %>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <h2><%=Html.Encode(Model.Title) %></h2>
    <% Html.RenderPartial("_Message"); %>
    <br />
    <% using (Html.BeginForm("Update", "Investigador")) { %>
        <div id="form">
        <%=Html.AntiForgeryToken() %>
        <%=Html.Hidden("Id", Model.Form.Id) %>

        <table class="form">
            <tr>
                <td class="label">
                    <label>Usuario:</label>
                </td>
                <td class="field">
                    <%=Html.Encode(Model.Form.Nombre) %>
                </td>
            </tr>
            <tr>
                <td class="label required">
                   <label>Fecha de Ingreso:<em>*</em></label>
                </td>                
                <td class="field">
                    <%=Html.TextBox("FechaIngreso", Model.Form.FechaIngreso, new { @class="datetime", maxlength = 10 })%>
                    <span class="helper_message">(Formato dd/mm/yyyy)</span>
                    <%=Html.ValidationMessage("FechaIngreso")%>
                </td>
            </tr>
            <tr>
                <td class="label">
                   <label>Estados:</label>
                </td>
                <td class="field">
                    <% Html.RenderPartial("_EditEstado", Model.Form); %>
                </td>
            </tr>
            <tr>
                <td class="label required">
                   <label>Grado:<em>*</em></label>
                </td>
                <td class="field">
                    <% Html.RenderPartial("_EditGrado", Model.Form); %>
                </td>
            </tr>
            <tr>
                <td class="label required">
                   <label>Categoria:<em>*</em></label>
                </td>
                <td class="field">
                    <% Html.RenderPartial("_EditCategoria", Model.Form); %>
                </td>
            </tr>
            <tr>
                <td class="label required">
                   <label>Cargo:<em>*</em></label>
                </td>
                <td class="field">
                    <% Html.RenderPartial("_EditCargo", Model.Form); %>
                </td>
            </tr>
            <tr>
                <td class="label required">
                   <label>SNI:<em>*</em></label>
                </td>
                <td class="field">
                    <% Html.RenderPartial("_EditSni", Model.Form); %>
                </td>
            </tr>                                          
        </table>
        
	    <div class="btn_container_footer">
		    <span class="btn btn_normal_brown">
			    <%=Html.SubmitButton("Guardar", "Guardar Cambios") %>
		    </span>
		    <span class="btn btn_normal_white">
			    <%=Html.ActionLink<InvestigadorController>(x => x.Index(), "Regresar") %>
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
