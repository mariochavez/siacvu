<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<HomeForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<% if (Model.Proyectos == null || Model.Proyectos.Length == 0){ %>
	<div class="elementolista">
		<div class="elementodescripcion">
			<h5><span>No hay proyectos de investigaci&oacute;n registrados</span></h5>
		</div><!--end elementodescripcion-->

	</div><!--end elementolista-->
<% } else { %>
    <% foreach (var proyecto in Model.Proyectos){ %>
        <div class="elementolista" id="accion_<%=Html.Encode(proyecto.Id) %>">
            <div class="elementodescripcion">
                <h5><span><%=Html.Encode(proyecto.Nombre)%></span></h5>
                <h6>
                    <%=HumanizeHelper.GetNombreProducto(proyecto.TipoProducto)%>
                    Registrado el: <%=HumanizeHelper.FormatDate(proyecto.CreadoEl)%>
                    <% if (proyecto.EstatusProducto != 0){ %>
                        Estatus: <%=HumanizeHelper.EstadoProyecto(proyecto.EstatusProducto)%>
                    <% } %>
                </h6>
            </div><!--end elementodescripcion-->

			<div class="elementobotones">
				<p>
					<span><%=Html.ActionLink<HomeController>(x => x.Edit(proyecto.Id, proyecto.TipoProducto), "Editar")%></span>
                    <span><%=Html.ActionLink<HomeController>(x => x.Show(proyecto.Id, proyecto.TipoProducto), "Ver")%></span>
               	</p>
			</div><!--end elementobotones-->
        		
        </div><!--end elementolista-->
    <% } %>
<% } %>