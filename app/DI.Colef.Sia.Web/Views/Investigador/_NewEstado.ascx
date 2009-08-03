<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<InvestigadorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<table class="subform">
    <tr>
        <td class="label">
            Estado:<em>*</em>
        </td>
        <td>
            <%=Html.DropDownList("EstadoInvestigador.Estado", Model.Estados.CreateSelectList<EstadoForm>("Id", "Nombre"),
    "Seleccione ...")%>
            <%=Html.ValidationMessage("EstadoInvestigador.Estado")%>
        </td>
    </tr>
    <tr>
        <td class="label">                        
            Fecha:<em>*</em>
        </td>
        <td>
            <%=Html.TextBox("EstadoInvestigador.Fecha", Model.EstadoInvestigador.Fecha, new { @class = "datetime", maxlength = 10 })%>
            <span class="helper_message">(Formato dd/mm/yyyy)</span>
            <%=Html.ValidationMessage("EstadoInvestigador.Fecha")%>
        </td>
    </tr>                                
</table>