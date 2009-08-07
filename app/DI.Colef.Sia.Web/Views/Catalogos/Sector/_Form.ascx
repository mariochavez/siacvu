<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<GenericViewData<SectorForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<div id="form">
    <%=Html.AntiForgeryToken() %>
    <%=Html.Hidden("Id", Model.Form.Id) %>

    <table class="form">
        <tr>
            <td class="label required">
                <label for="Nombre">Nombre:<em>*</em></label>
            </td>
            <td class="field">
                <%=Html.TextBox("Nombre", Model.Form.Nombre, new { @class = "big", size = 10, maxlength = 40 })%>
                <span class="helper_message">(Debe de ser un nombre unico)</span>
                <%=Html.ValidationMessage("Nombre") %>
            </td>
        </tr>
    </table>
    
	<div class="btn_container_footer">
		<span class="btn btn_normal_brown">
			<%=Html.SubmitButton("Guardar", "Guardar Cambios") %>
		</span>
		<span class="btn btn_normal_white">
			<%=Html.ActionLink<SectorController>(x => x.Index(), "Regresar") %>
		</span>
	</div>    
</div>
