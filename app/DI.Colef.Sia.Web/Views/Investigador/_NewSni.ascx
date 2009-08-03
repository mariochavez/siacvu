<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<InvestigadorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<table class="subform">
    <tr>
        <td class="label">
            SNI:<em>*</em>
        </td>
        <td>
            <%=Html.DropDownList("SNIInvestigador.SNI", Model.SNIs.CreateSelectList<SNIForm>("Id", "Nombre"),
    "Seleccione ...")%>
            <%=Html.ValidationMessage("SNIInvestigador.SNI")%>
        </td>
    </tr>
    <tr>
        <td class="label">                        
            Periodo:<em>*</em>
        </td>
        <td>
            <%=Html.TextBox("SNIInvestigador.FechaInicial", Model.SNIInvestigador.FechaInicial, new { @class = "datetime", maxlength = 10 })%> a 
            <%=Html.TextBox("SNIInvestigador.FechaFinal", Model.SNIInvestigador.FechaFinal, new { @class = "datetime", maxlength = 10 })%>
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
            <%=Html.TextBox("SNIInvestigador.ExpedienteSNI", Model.SNIInvestigador.ExpedienteSNI, new { maxlength = 40 })%>
        </td>
    </tr>
    <tr>
        <td class="label">                        
            Expediente Produccion:
        </td>
        <td>
            <%=Html.TextBox("SNIInvestigador.ExpedienteProduccion", Model.SNIInvestigador.ExpedienteProduccion, new { maxlength = 40 })%>
        </td>
    </tr> 
    <tr>
        <td class="label">                        
            Expediente Academico:
        </td>
        <td>
            <%=Html.TextBox("SNIInvestigador.ExpedienteAcademico", Model.SNIInvestigador.ExpedienteAcademico, new { maxlength = 40 })%>
        </td>
    </tr>                         
    <tr>
        <td class="label">                        
            Clave CVU:
        </td>
        <td>
            <%=Html.TextBox("SNIInvestigador.ClaveCVU", Model.SNIInvestigador.ClaveCVU, new { maxlength = 40 })%>
        </td>
    </tr>                                                                                                      
</table>