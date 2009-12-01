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
    <%=Html.TextBox("SNIInvestigador.FechaInicial", Model.SNIInvestigador.FechaInicial, new { @class = "datetime input100-requerido", maxlength = 10 })%> a 
    <%=Html.TextBox("SNIInvestigador.FechaFinal", Model.SNIInvestigador.FechaFinal, new { @class = "datetime input100-requerido", maxlength = 10 })%>
    <span>(Formato dd/mm/yyyy)</span>
    <span class="cvu"></span> 
    <%=Html.ValidationMessage("SNIInvestigador.FechaInicial")%>
    <%=Html.ValidationMessage("SNIInvestigador.FechaFinal")%>
</p>
