<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<InvestigadorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<table class="subform">
    <tr>
        <td class="label">
            Cargo:<em>*</em>
        </td>
        <td>
            <%=Html.DropDownList("CargoInvestigador.Cargo", Model.Cargos.CreateSelectList<CargoForm>("Id", "Nombre"),
    "Seleccione ...")%>
            <%=Html.ValidationMessage("CargoInvestigador.Cargo")%>
        </td>
    </tr>
    <tr>
        <td>                        
            Fecha:<em>*</em>
        </td>
        <td>
            <%=Html.TextBox("CargoInvestigador.Fecha", Model.CargoInvestigador.Fecha, new { @class = "datetime", maxlength = 10 })%>
            <span class="helper_message">(Formato dd/mm/yyyy)</span>
            <%=Html.ValidationMessage("CargoInvestigador.Fecha")%>
        </td>
    </tr>
    <tr>
        <td class="label">                        
            Departamento:<em>*</em>
        </td>
        <td>
            <%=Html.DropDownList("CargoInvestigador.Departamento", Model.Departamentos.CreateSelectList<DepartamentoForm>("Id", "Nombre"),
    "Seleccione ...")%>
            <%=Html.ValidationMessage("CargoInvestigador.Departamento")%>
        </td>
    </tr>
    <tr>
        <td class="label">                        
            Sede:<em>*</em>
        </td>
        <td>
            <%=Html.DropDownList("CargoInvestigador.Sede", Model.Sedes.CreateSelectList<SedeForm>("Id", "Nombre"),
    "Seleccione ...")%>
            <%=Html.ValidationMessage("CargoInvestigador.Sede")%>
        </td>
    </tr>                                                                                 
</table>
