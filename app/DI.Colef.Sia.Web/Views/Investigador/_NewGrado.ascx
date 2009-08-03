<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<InvestigadorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<table class="subform">
    <tr>
        <td class="label">
            Grado:<em>*</em>
        </td>
        <td>
            <%=Html.DropDownList("GradoAcademicoInvestigador.GradoAcademico", Model.GradosAcademicos.CreateSelectList<GradoAcademicoForm>("Id", "Nombre"),
    "Seleccione ...")%>
            <%=Html.ValidationMessage("GradoAcademicoInvestigador.GradoAcademico")%>
        </td>
    </tr>
    <tr>
        <td class="label">                        
            Fecha:<em>*</em>
        </td>
        <td>
            <%=Html.TextBox("GradoAcademicoInvestigador.Fecha", Model.GradoAcademicoInvestigador.Fecha, new { @class = "datetime", maxlength = 10 })%>
            <span class="helper_message">(Formato dd/mm/yyyy)</span>
            <%=Html.ValidationMessage("GradoAcademicoInvestigador.Fecha")%>
        </td>
    </tr>
    <tr>
        <td class="label">                        
            Descripcion:<em>*</em>
        </td>
        <td>
            <%=Html.TextBox("GradoAcademicoInvestigador.Descripcion", Model.GradoAcademicoInvestigador.Descripcion, new { maxlength = 40 })%>
            <%=Html.ValidationMessage("GradoAcademicoInvestigador.Descripcion")%>
        </td>
    </tr>
    <tr>
        <td class="label">                        
            Area:
        </td>
        <td>
            <%=Html.TextBox("GradoAcademicoInvestigador.AreaInvestigacion", Model.GradoAcademicoInvestigador.AreaInvestigacion, new { maxlength = 40 })%>
            <%=Html.ValidationMessage("GradoAcademicoInvestigador.AreaInvestigacion")%>
        </td>
    </tr> 
    <tr>
        <td class="label">                        
            Detalle:
        </td>
        <td>
            <%=Html.TextArea("GradoAcademicoInvestigador.Detalle", Model.GradoAcademicoInvestigador.Detalle, 3, 35, new { maxlength = 100 })%>
            <br /><span class="helper_message">(Descripcion narrativa)</span>
        </td>
    </tr>                                                                                                      
</table>