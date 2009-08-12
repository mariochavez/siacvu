<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true" 
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<MovilidadAcademicaForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<%@ Import Namespace="DI.Colef.Sia.Web.Controllers" %>

<asp:Content ID="titleContent" ContentPlaceHolderID="TituloPlaceHolder" runat="server">
    <h2><%=Html.Encode(Model.Title) %></h2>
</asp:Content>

<asp:Content ID="introductionContent" ContentPlaceHolderID="IntroduccionPlaceHolder" runat="server">
    <div id="subcontenido">
	    <h3>Agregar Nueva Movilidad Academica</h3>
		<p>Puedes agregar una nueva Movilidad Academica dentro de la lista de administraci&oacute;n presionando en el bot&oacute;n derecho de titulo <strong>+ Crear Movilidad Academica</strong>.</p>
			
		<div class="botonzon">
		    <span>
		        <%=Html.ActionLink<MovilidadAcademicaController>(x => x.New(), "+ Crear Movilidad Academica", new { title = "Crear Movilidad Academica" })%>
		    </span>
		</div>
	
	</div><!--end subcontenido-->
</asp:Content>

<asp:Content ID="sidebarContent" ContentPlaceHolderID="SidebarContentPlaceHolder" runat="server">
    <div id="barra">
        <div id="asistente">
            <h3>Asistente de secci&oacute;n</h3>
            <p>Lista de Movilidades Academicas registradas en el sistema.</p>
            <% Html.RenderPartial("_ListSidebar"); %>
        </div><!--end asistente-->
    </div><!--end barra-->
</asp:Content>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
<div id="textos">
	<div id="forma">
	
        <% Html.RenderPartial("_Message"); %>
        <br />
        <div id="datalist">   
            <div class="btn_container">
                <% Html.RenderPartial("_Search"); %>
            </div> 
            <br />
            <div class="table_title">Movilidad Academica</div>
            <table>
                 <% if(Model.List == null || Model.List.Length == 0) { %>
                    <tr>
                        <td>No hay movilidad academica definida</td>
                    </tr>
                <% } else { %>
                    <% foreach (var movilidadAcademica in Model.List) { %>
                        <tr class="highlight">
				            <td class="button" width="46">
					            <div class="floatr btn_container">
						            <span class="btn btn_small_white">
							            <%=Html.ActionLink<MovilidadAcademicaController>(x => x.Edit(movilidadAcademica.Id), "Editar") %>
						            </span>
					            </div>
				            </td>                
                            <td class="single" width="70%">
                                <%=Html.Encode(movilidadAcademica.LineaTematicaNombre) %>
                                <div class="meta_info">Modificado el <%=Html.Encode(movilidadAcademica.Modificacion) %></div>
                            </td>
                            <td id="accion_<%=Html.Encode(movilidadAcademica.Id) %>" class="button" width="140">
                                <div class="floatr btn_container">
                                <% if (movilidadAcademica.Activo) { %>
                                    <span class="btn btn_small_white">
                                        <%=Html.ActionLink("Desactivar", "Deactivate", new { id = movilidadAcademica.Id }, new { @class = "remote put" })%>
                                    </span>
                                <% } else { %>
                                    <span class="btn btn_small_white">
                                        <%=Html.ActionLink("Activar", "Activate", new { id = movilidadAcademica.Id }, new { @class = "remote put" })%>
                                    </span>
                                <% } %>
                                </div>
                            </td>
                        </tr>
                    <% } %>
                <% } %>
            </table>
        </div>    
    
	</div><!--end forma-->	
	    
</div><!--end textos-->

<script type="text/javascript">
    $(document).ready(function() {
        setupDocument();
    });
</script>
</asp:Content>
