<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<GenericViewData<PeriodoReferenciaForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<div id="form">
    <%=Html.AntiForgeryToken() %>
    <%=Html.Hidden("Id", Model.Form.Id) %>

    <table class="form">
        <tr>
            <td class="label required">
                <label for="Periodo">Periodo:<em>*</em></label>
            </td>
            <td class="field">
                <%=Html.TextBox("Periodo", Model.Form.Periodo, new { @class = "big", size = 10, maxlength = 40 })%>
                <span class="helper_message">(Debe de ser un periodo unico)</span>
                <%=Html.ValidationMessage("Periodo")%>
            </td>
        </tr>
        <tr>
            <td class="label required">
                <label for="Orden">Orden:<em>*</em></label>
            </td>
            <td class="field">
                <%=Html.TextBox("Orden", Model.Form.Orden, new { @class = "big", size = 10, maxlength = 40 })%>                
                <%=Html.ValidationMessage("Orden")%>
            </td>
        </tr>
        <tr>
            <td class="label required">
                <label for="FechaInicial">FechaInicial:<em>*</em></label>
            </td>
            <td class="field">
                <%=Html.TextBox("FechaInicial", Model.Form.FechaInicial, new { @class = "big", size = 10, maxlength = 40 })%>                
                <%=Html.ValidationMessage("FechaInicial")%>
            </td>
        </tr>
        <tr>
            <td class="label required">
                <label for="FechaFinal">FechaFinal:<em>*</em></label>
            </td>
            <td class="field">
                <%=Html.TextBox("FechaFinal", Model.Form.FechaFinal, new { @class = "big", size = 10, maxlength = 40 })%>                
                <%=Html.ValidationMessage("FechaFinal")%>
            </td>
        </tr>
    </table>
    
	<div class="btn_container_footer">
		<span class="btn btn_normal_brown">
			<%=Html.SubmitButton("Guardar", "Guardar Cambios") %>
		</span>
		<span class="btn btn_normal_white">
			<%=Html.ActionLink<PeriodoReferenciaController>(x => x.Index(), "Regresar") %>
		</span>
	</div>    
</div>
