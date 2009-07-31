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
    <% using (Html.BeginForm("Create", "Investigador")) { %>
        <div id="form">
        <%=Html.AntiForgeryToken() %>
        <%=Html.Hidden("Id", Model.Form.Id) %>

        <table class="form">
            <tr>
                <td class="label required">
                    <label>Usuario:<em>*</em></label>
                </td>
                <td class="field">
                    <%=Html.DropDownList("Usuario", Model.Form.Usuarios.CreateSelectList<UsuarioForm>("Id", "Nombre"),
                        "Seleccione ...")%>
                    <%=Html.ValidationMessage("Usuario") %>
                </td>
            </tr>
            <tr>
                <td class="label required">
                   <label>Fecha de Ingreso:<em>*</em></label>
                </td>                
                <td class="field">
                    <%=Html.TextBox("FechaIngreso", Model.Form.FechaIngreso, new { maxlength = 10 })%>
                    <span class="helper_message">(Formato dd/mm/yyyy)</span>
                    <%=Html.ValidationMessage("FechaIngreso")%>
                </td>
            </tr>
            <tr>
                <td class="label required">
                   <label>Estado:<em>*</em></label>
                </td>
                <td class="field">
                    <table class="subform">
                        <tr>
                            <td class="label">
                                Estado:<em>*</em>
                            </td>
                            <td>
                                <%=Html.DropDownList("EstadoInvestigador.Estado", Model.Form.Estados.CreateSelectList<EstadoForm>("Id", "Nombre"),
                        "Seleccione ...")%>
                                <%=Html.ValidationMessage("EstadoInvestigador.Estado")%>
                            </td>
                        </tr>
                        <tr>
                            <td class="label">                        
                                Fecha:<em>*</em>
                            </td>
                            <td>
                                <%=Html.TextBox("EstadoInvestigador.Fecha", Model.Form.EstadoInvestigador.Fecha, new { maxlength = 10 })%>
                                <span class="helper_message">(Formato dd/mm/yyyy)</span>
                                <%=Html.ValidationMessage("EstadoInvestigador.Fecha")%>
                            </td>
                        </tr>                                
                    </table>
                </td>
            </tr>
            <tr>
                <td class="label required">
                   <label>Grado:<em>*</em></label>
                </td>
                <td class="field">
                    <table class="subform">
                        <tr>
                            <td class="label">
                                Grado:<em>*</em>
                            </td>
                            <td>
                                <%=Html.DropDownList("GradoAcademicoInvestigador.GradoAcademico", Model.Form.GradosAcademicos.CreateSelectList<GradoAcademicoForm>("Id", "Nombre"),
                        "Seleccione ...")%>
                                <%=Html.ValidationMessage("GradoAcademicoInvestigador.GradoAcademico")%>
                            </td>
                        </tr>
                        <tr>
                            <td class="label">                        
                                Fecha:<em>*</em>
                            </td>
                            <td>
                                <%=Html.TextBox("GradoAcademicoInvestigador.Fecha", Model.Form.GradoAcademicoInvestigador.Fecha, new { maxlength = 10 })%>
                                <span class="helper_message">(Formato dd/mm/yyyy)</span>
                                <%=Html.ValidationMessage("GradoAcademicoInvestigador.Fecha")%>
                            </td>
                        </tr>
                        <tr>
                            <td class="label">                        
                                Descripcion:<em>*</em>
                            </td>
                            <td>
                                <%=Html.TextBox("GradoAcademicoInvestigador.Descripcion", Model.Form.GradoAcademicoInvestigador.Descripcion, new { maxlength = 40 })%>
                                <%=Html.ValidationMessage("GradoAcademicoInvestigador.Descripcion")%>
                            </td>
                        </tr>
                        <tr>
                            <td class="label">                        
                                Area:
                            </td>
                            <td>
                                <%=Html.TextBox("GradoAcademicoInvestigador.AreaInvestigacion", Model.Form.GradoAcademicoInvestigador.AreaInvestigacion, new { maxlength = 40 })%>
                                <%=Html.ValidationMessage("GradoAcademicoInvestigador.AreaInvestigacion")%>
                            </td>
                        </tr> 
                        <tr>
                            <td class="label">                        
                                Detalle:
                            </td>
                            <td>
                                <%=Html.TextArea("GradoAcademicoInvestigador.Detalle", Model.Form.GradoAcademicoInvestigador.Detalle, 3, 35, new { maxlength = 100 })%>
                                <br /><span class="helper_message">(Descripcion narrativa)</span>
                            </td>
                        </tr>                                                                                                      
                    </table>
                </td>
            </tr>
            <tr>
                <td class="label required">
                   <label>Categoria:<em>*</em></label>
                </td>
                <td class="field">
                    <table class="subform">
                        <tr>
                            <td class="label">
                                Categoria:<em>*</em>
                            </td>
                            <td>
                                <%=Html.DropDownList("CategoriaInvestigador.Categoria", Model.Form.Categorias.CreateSelectList<CategoriaForm>("Id", "Nombre"),
                        "Seleccione ...")%>
                                <%=Html.ValidationMessage("CategoriaInvestigador.Categoria")%>
                            </td>
                        </tr>
                        <tr>
                            <td class="label">                        
                                Fecha:<em>*</em>
                            </td>
                            <td>
                                <%=Html.TextBox("CategoriaInvestigador.Fecha", Model.Form.CategoriaInvestigador.Fecha, new { maxlength = 10 })%>
                                <span class="helper_message">(Formato dd/mm/yyyy)</span>
                                <%=Html.ValidationMessage("CategoriaInvestigador.Fecha")%>
                            </td>
                        </tr>                                
                    </table>
                </td>
            </tr>
            <tr>
                <td class="label required">
                   <label>Cargo:<em>*</em></label>
                </td>
                <td class="field">
                    <table class="subform">
                        <tr>
                            <td class="label">
                                Cargo:<em>*</em>
                            </td>
                            <td>
                                <%=Html.DropDownList("CargoInvestigador.Cargo", Model.Form.Cargos.CreateSelectList<CargoForm>("Id", "Nombre"),
                        "Seleccione ...")%>
                                <%=Html.ValidationMessage("CargoInvestigador.Cargo")%>
                            </td>
                        </tr>
                        <tr>
                            <td>                        
                                Fecha:<em>*</em>
                            </td>
                            <td>
                                <%=Html.TextBox("CargoInvestigador.Fecha", Model.Form.CargoInvestigador.Fecha, new { maxlength = 10 })%>
                                <span class="helper_message">(Formato dd/mm/yyyy)</span>
                                <%=Html.ValidationMessage("CargoInvestigador.Fecha")%>
                            </td>
                        </tr>
                        <tr>
                            <td class="label">                        
                                Departamento:<em>*</em>
                            </td>
                            <td>
                                <%=Html.DropDownList("CargoInvestigador.Departamento", Model.Form.Departamentos.CreateSelectList<DepartamentoForm>("Id", "Nombre"),
                        "Seleccione ...")%>
                                <%=Html.ValidationMessage("CargoInvestigador.Departamento")%>
                            </td>
                        </tr>
                        <tr>
                            <td class="label">                        
                                Sede:<em>*</em>
                            </td>
                            <td>
                                <%=Html.DropDownList("CargoInvestigador.Sede", Model.Form.Sedes.CreateSelectList<SedeForm>("Id", "Nombre"),
                        "Seleccione ...")%>
                                <%=Html.ValidationMessage("CargoInvestigador.Sede")%>
                            </td>
                        </tr>                                                                                 
                    </table>
                </td>
            </tr>
            <tr>
                <td class="label required">
                   <label>SNI:<em>*</em></label>
                </td>
                <td class="field">
                    <table class="subform">
                        <tr>
                            <td class="label">
                                SNI:<em>*</em>
                            </td>
                            <td>
                                <%=Html.DropDownList("SNIInvestigador.SNI", Model.Form.SNIs.CreateSelectList<SNIForm>("Id", "Nombre"),
                        "Seleccione ...")%>
                                <%=Html.ValidationMessage("SNIInvestigador.SNI")%>
                            </td>
                        </tr>
                        <tr>
                            <td class="label">                        
                                Periodo:<em>*</em>
                            </td>
                            <td>
                                <%=Html.TextBox("SNIInvestigador.FechaInicial", Model.Form.SNIInvestigador.FechaInicial, new { maxlength = 10 })%> a 
                                <%=Html.TextBox("SNIInvestigador.FechaFinal", Model.Form.SNIInvestigador.FechaFinal, new { maxlength = 10 })%>
                                <span class="helper_message">(Formato dd/mm/yyyy)</span>
                                <%=Html.ValidationMessage("SNIInvestigador.FechaInicial")%>
                                <%=Html.ValidationMessage("SNIInvestigador.FechaFinal")%>
                            </td>
                        </tr>
                        <tr>
                            <td class="label">                        
                                Expediente SNI:
                            </td>
                            <td>
                                <%=Html.TextBox("SNIInvestigador.ExpedienteSNI", Model.Form.SNIInvestigador.ExpedienteSNI, new { maxlength = 40 })%>
                            </td>
                        </tr>
                        <tr>
                            <td class="label">                        
                                Expediente Produccion:
                            </td>
                            <td>
                                <%=Html.TextBox("SNIInvestigador.ExpedienteProduccion", Model.Form.SNIInvestigador.ExpedienteProduccion, new { maxlength = 40 })%>
                            </td>
                        </tr> 
                        <tr>
                            <td class="label">                        
                                Expediente Academico:
                            </td>
                            <td>
                                <%=Html.TextBox("SNIInvestigador.ExpedienteAcademico", Model.Form.SNIInvestigador.ExpedienteAcademico, new { maxlength = 40 })%>
                            </td>
                        </tr>                         
                        <tr>
                            <td class="label">                        
                                Clave CVU:
                            </td>
                            <td>
                                <%=Html.TextBox("SNIInvestigador.ClaveCVU", Model.Form.SNIInvestigador.ClaveCVU, new { maxlength = 40 })%>
                            </td>
                        </tr>                                                                                                      
                    </table>
                </td>
            </tr>                                               
        </table>
        
	    <div class="btn_container_footer">
		    <span class="btn btn_normal_brown">
			    <%=Html.SubmitButton("Guardar", "Guardar Cambios") %>
		    </span>
		    <span class="btn btn_normal_white">
			    <%=Html.ActionLink<RolController>(x => x.Index(), "Regresar") %>
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
