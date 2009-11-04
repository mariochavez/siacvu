<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<InvestigadorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>SNI</label>
    <%=Html.DropDownList("SNIInvestigador.SNI", Model.SNIs.CreateSelectList<SNIForm>("Id", "Nombre"),
        "Seleccione ...", new { @class = "requerido" })%>
    <span class="cvu"></span> 
    <%=Html.ValidationMessage("SNIInvestigador.SNI")%>
</p>
<p>
    <label>Periodo</label>
    <%=Html.TextBox("SNIInvestigador.Fecha", Model.SNIInvestigador.Fecha, new { @class = "datetime input100-requerido", maxlength = 10 })%> a 
    <span>(Formato dd/mm/yyyy)</span>
    <span class="cvu"></span> 
    <%=Html.ValidationMessage("SNIInvestigador.Fecha")%>
</p>
<p>
    <label>Expediente SNI</label>
    <%=Html.TextBox("SNIInvestigador.ExpedienteSNI", Model.SNIInvestigador.ExpedienteSNI, new { @class = "input250", maxlength = 40 })%>
    <span class="cvu"></span> 
</p>