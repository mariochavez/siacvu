<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<GenericViewData<RevistaPublicacionForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<div id="form">
    <%=Html.AntiForgeryToken() %>
    <%=Html.Hidden("Id", Model.Form.Id) %>

    <table class="form">
        <tr>
            <td class="label required">
                <label for="Titulo">Titulo:<em>*</em></label>
            </td>
            <td class="field">
                <%=Html.TextBox("Titulo", Model.Form.Titulo, new { @class = "big", size = 10, maxlength = 40 })%>
                <span class="helper_message">(Debe de ser un titulo unico)</span>
                <%=Html.ValidationMessage("Titulo")%>
            </td>
        </tr>
        <tr>
            <td class="label required">
                <label for="Periodicidad">Periodicidad:<em>*</em></label>
            </td>
            <td class="field">
                <%=Html.TextBox("Periodicidad", Model.Form.Periodicidad, new { @class = "big", size = 10, maxlength = 40 })%>                
                <%=Html.ValidationMessage("Periodicidad")%>
            </td>
        </tr>
        <tr>
            <td class="label required">
                <label for="Issn">Issn:<em>*</em></label>
            </td>
            <td class="field">
                <%=Html.TextBox("Issn", Model.Form.Issn, new { @class = "big", size = 10, maxlength = 40 })%>                
                <%=Html.ValidationMessage("Issn")%>
            </td>
        </tr>
        <tr>
            <td class="label required">
                <label for="Detalle">Detalle:<em>*</em></label>
            </td>
            <td class="field">
                <%=Html.TextBox("Detalle", Model.Form.Detalle, new { @class = "big", size = 10, maxlength = 40 })%>                
                <%=Html.ValidationMessage("Detalle")%>
            </td>
        </tr>
        <tr>
            <td class="label required">
                <label for="Tipo">Tipo:<em>*</em></label>
            </td>
            <td class="field">
                <%=Html.TextBox("Tipo", Model.Form.Tipo, new { @class = "big", size = 10, maxlength = 40 })%>                
                <%=Html.ValidationMessage("Tipo")%>
            </td>
        </tr>
        <tr>
            <td class="label required">
                <label for="Estado">Estado:<em>*</em></label>
            </td>
            <td class="field">
                <%=Html.TextBox("Estado", Model.Form.Estado, new { @class = "big", size = 10, maxlength = 40 })%>                
                <%=Html.ValidationMessage("Estado")%>
            </td>
        </tr>
    </table>
    
	<div class="btn_container_footer">
		<span class="btn btn_normal_brown">
			<%=Html.SubmitButton("Guardar", "Guardar Cambios") %>
		</span>
		<span class="btn btn_normal_white">
			<%=Html.ActionLink<RevistaPublicacionController>(x => x.Index(), "Regresar") %>
		</span>
	</div>    
</div>
