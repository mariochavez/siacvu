<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<InvestigadorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>SNI</label>
    <%=Html.DropDownList("SNIInvestigador.SNI", Model.SNIs.CreateSelectList<SNIForm>("Id", "Nombre"),
        "Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("SNIInvestigador.SNI")%>
</p>
<p>
    <label>Periodo</label>
    <%=Html.TextBox("SNIInvestigador.FechaInicial", Model.SNIInvestigador.FechaInicial, new { @class = "datetime input100-requerido", maxlength = 10 })%> a 
    <%=Html.TextBox("SNIInvestigador.FechaFinal", Model.SNIInvestigador.FechaFinal, new { @class = "datetime input100-requerido", maxlength = 10 })%>
    <span>(Formato dd/mm/yyyy)</span>
    <%=Html.ValidationMessage("SNIInvestigador.FechaInicial")%>
    <%=Html.ValidationMessage("SNIInvestigador.FechaFinal")%>
</p>
<p>
    <label>Expediente SNI</label>
    <%=Html.TextBox("SNIInvestigador.ExpedienteSNI", Model.SNIInvestigador.ExpedienteSNI, new { @class = "input250", maxlength = 40 })%>
</p>
<p>
    <label>Expediente Produccion</label>
    <%=Html.TextBox("SNIInvestigador.ExpedienteProduccion", Model.SNIInvestigador.ExpedienteProduccion, new { @class = "input250", maxlength = 40 })%>
</p> 
<p>
    <label>Expediente Academico</label>
    <%=Html.TextBox("SNIInvestigador.ExpedienteAcademico", Model.SNIInvestigador.ExpedienteAcademico, new { @class = "input250", maxlength = 40 })%>
</p>                         
<p>
    <label>Clave CVU</label>
    <%=Html.TextBox("SNIInvestigador.ClaveCVU", Model.SNIInvestigador.ClaveCVU, new { @class = "input250", maxlength = 40 })%>
</p>