<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<HomeForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<% if (Model.ProduccionAcademica == null || Model.ProduccionAcademica.Length == 0){ %>
	<div class="elementolista">
		<div class="elementodescripcion">
			<h5><span>No hay producci&oacute;n acad&eacute;mica registrada</span></h5>
		</div><!--end elementodescripcion-->

	</div><!--end elementolista-->
<% } else { %>
    <% foreach (var produccionAcademica in Model.ProduccionAcademica) { %>
        <div class="elementolista" id="accion_<%=Html.Encode(produccionAcademica.Id) %>">
            <div class="elementodescripcion">
                <h5><span><%=Html.Encode(produccionAcademica.Nombre)%></span></h5>
                <h6>
                    <%=HumanizeHelper.GetNombreProducto(produccionAcademica.TipoProducto)%>
                    Registrado el: <%=HumanizeHelper.FormatDate(produccionAcademica.CreadoEl)%>
                    <% if(produccionAcademica.RevistaPublicacion != null){ %>
                        Revista: <%=Html.Encode(produccionAcademica.RevistaPublicacion.Titulo)%>
                    <% } %>
                    <% if (produccionAcademica.EstatusProducto != 0){ %>
                        Estatus: <%=HumanizeHelper.EstadoProducto(produccionAcademica.EstatusProducto)%>
                    <% } %>
                </h6>
            </div><!--end elementodescripcion-->

			<div class="elementobotones">
				<p>
					<span><%=Html.CustomActionLink("Home", "Edit", "Editar", produccionAcademica.Id, produccionAcademica.TipoProducto)%></span>
                    <span><%=Html.CustomActionLink("Home", "Show", "Ver", produccionAcademica.Id, produccionAcademica.TipoProducto)%></span>
                    <%--<span><%=Html.CustomActionLink("Home", "Signature", "Firmar", produccionAcademica.Id, produccionAcademica.TipoProducto)%></span>--%>
               	</p>
			</div><!--end elementobotones-->
        		
        </div><!--end elementolista-->
    <% } %>
<% } %>