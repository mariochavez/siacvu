<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<HomeForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<% if (Model.FormacionRecursosHumanos == null || Model.FormacionRecursosHumanos.Length == 0){ %>
	<div class="elementolista">
		<div class="elementodescripcion">
			<h5><span>No hay formaci&oacute;n de recursos humanos registrados</span></h5>
		</div><!--end elementodescripcion-->

	</div><!--end elementolista-->
<% } else { %>
    <% foreach (var recursoHumano in Model.FormacionRecursosHumanos){ %>
        <div class="elementolista" id="accion_<%=Html.Encode(recursoHumano.Id) %>">
            <div class="elementodescripcion">
                <h5><span><%=Html.Encode(recursoHumano.Nombre)%></span></h5>
                <h6>
                    <%=HumanizeHelper.GetNombreProducto(recursoHumano.TipoProducto)%>
                    Registrado el: <%=HumanizeHelper.FormatDate(recursoHumano.CreadoEl)%>
                    <% if (recursoHumano.Institucion != null){ %>
                        Instituci&oacute;n: <%=Html.Encode(recursoHumano.Institucion.Nombre)%>
                    <% } %>
                </h6>
            </div><!--end elementodescripcion-->

			<div class="elementobotones">
				<p>
					<span><%=Html.ActionLink<HomeController>(x => x.Edit(recursoHumano.Id, recursoHumano.TipoProducto), "Editar")%></span>
                    <span><%=Html.ActionLink<HomeController>(x => x.Show(recursoHumano.Id, recursoHumano.TipoProducto), "Ver")%></span>
               	</p>
			</div><!--end elementobotones-->
        		
        </div><!--end elementolista-->
    <% } %>
<% } %>