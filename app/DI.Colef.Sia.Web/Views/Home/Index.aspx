<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true" 
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<HomeForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<%@ Import Namespace="DI.Colef.Sia.Web.Controllers" %>

<asp:Content ID="titleContent" ContentPlaceHolderID="TituloPlaceHolder" runat="server">
    <h2><%=Html.Encode(Model.Title) %></h2>
</asp:Content>

<asp:Content ID="introductionContent" ContentPlaceHolderID="IntroduccionPlaceHolder" runat="server">
    <div id="subcontenido">
	    <h3>Panel de administraci&oacute;n</h3>
		<p>Para crear o modificar productos utilice el men&uacute; de la parte superior llamado <strong>Productos</strong>.</p>
		
		<!-- 	
		<div class="botonzon">
		    <span>
		        
		    </span>
		</div>
	    -->
	</div><!--end subcontenido-->
</asp:Content>

<asp:Content ID="sidebarContent" ContentPlaceHolderID="SidebarContentPlaceHolder" runat="server">
    <div id="barra">
        <div id="asistente">
            <h3>Asistente de secci&oacute;n</h3>
            <p>Pendiente.</p>
        </div><!--end asistente-->
    </div><!--end barra-->
</asp:Content>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
<div id="textos">
				
    <% Html.RenderPartial("_Message"); %>
    <div id="lista">
        <h4>Producci&oacute;n acad&eacute;mica</h4>
        
		<% if (Model.Form.ProduccionAcademica == null || Model.Form.ProduccionAcademica.Length == 0){ %>
			<div class="elementolista">
				<div class="elementodescripcion">
					<h5><span>No hay productos registrados</span></h5>
				</div><!--end elementodescripcion-->

			</div><!--end elementolista-->
		<% } else { %>
            <% foreach (var produccionAcademica in Model.Form.ProduccionAcademica) { %>
                <div class="elementolista" id="accion_<%=Html.Encode(produccionAcademica.Id) %>">
	                <div class="elementodescripcion">
	                    <h5><span><%=Html.Encode(produccionAcademica.Nombre)%></span></h5>
	                    <h6>
	                        <%=HumanizeHelper.GetNombreProducto(produccionAcademica.TipoProducto)%>
	                        Creado el <%=HumanizeHelper.FormatDate(produccionAcademica.CreadoEl)%>
	                    </h6>
	                </div><!--end elementodescripcion-->

					<div class="elementobotones">
						<p>
							<span><%=Html.ActionLink("Editar", "Edit", new { id = produccionAcademica.Id, tipoProducto = produccionAcademica.TipoProducto })%></span>
	                        <span><%=Html.ActionLink("Ver", "Show", new { id = produccionAcademica.Id })%></span>
	                   	</p>
					</div><!--end elementobotones-->
                		
                </div><!--end elementolista-->
            <% } %>
        <% } %>
    
    </div><!--end lista-->
    
</div><!--end textos-->
					    
<script type="text/javascript">
    $(document).ready(function() {
        setupDocument();
    });
</script>    
</asp:Content>
