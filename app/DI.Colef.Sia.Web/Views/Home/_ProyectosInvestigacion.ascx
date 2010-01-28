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
        <div class="elementolista" id="accion_<%=Html.Encode(proyecto.Id)%>_<%=Html.Encode(proyecto.TipoProducto)%>">
            <div class="elementodescripcion">
                <h5><span><%=Html.Encode(proyecto.Nombre)%></span></h5>
                <h6>
                    <%=HumanizeHelper.GetNombreProducto(proyecto.TipoProducto)%>
                    <% if (!String.IsNullOrEmpty(proyecto.TipoNombre)){ %>
                        Proyecto de <%=proyecto.TipoNombre %><br />
                    <% } %>
                    <% if(Page.User.IsInRole("DGAA")){ %>
                        Investigador: <%=Html.Encode(proyecto.InvestigadorNombre)%><br />
                    <% } %>
                    Registrado el <%=proyecto.FechaCreacion %><br />
                </h6>
            </div><!--end elementodescripcion-->

			<div class="elementobotones">
				<p>
				    <%if (Page.User.IsInRole("DGAA") && proyecto.IsFirmed()) { %>
				        <span><%=Html.ActionLinkForAreas<HomeController>(x => x.Edit(proyecto.Id, proyecto.TipoProducto), "Editar")%></span>
				    <% } else if(Page.User.IsInRole("Investigadores")) { %>
				        <% if(!proyecto.IsFirmed() && !proyecto.IsValidated()) { %>
				            <span><%=Html.ActionLinkForAreas<HomeController>(x => x.Edit(proyecto.Id, proyecto.TipoProducto), "Editar")%></span>
				            <span><%=Html.ActionLinkForAreas<HomeController>(x => x.Sign(proyecto.Id, proyecto.TipoProducto), "Firmar")%></span>
				        <% } else if(proyecto.IsFirmed() && !proyecto.IsValidated()) { %>
				            <span><%=Html.ActionLinkForAreas<HomeController>(x => x.Show(proyecto.Id, proyecto.TipoProducto), "Ver")%></span>
				        <%} else if(proyecto.IsValidated()) { %>
				            <span><%=Html.ActionLinkForAreas<HomeController>(x => x.Edit(proyecto.Id, proyecto.TipoProducto), "Editar")%></span>
				        <% } %>
				    <% } %>
               	</p>
			</div><!--end elementobotones-->
        		
        </div><!--end elementolista-->
    <% } %>
<% } %>