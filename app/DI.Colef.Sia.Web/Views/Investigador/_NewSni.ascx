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
<p id="SniPeriodos_Fields">
    <label>Periodo</label>
    <%=Html.TextBox("SNIInvestigador.FechaInicial", Model.SNIInvestigador.FechaInicial, new { @class = "datetime input100-requerido", maxlength = 10 })%><span id="SniFechaFinal_Field" class="noeffect"> a 
    <%=Html.TextBox("SNIInvestigador.FechaFinal", Model.SNIInvestigador.FechaFinal, new { @class = "datetime input100-requerido", maxlength = 10 })%></span>
    <span>(Formato dd/mm/aaaa)</span>
    <span class="cvu"></span> 
    <%=Html.ValidationMessage("SNIInvestigador.FechaInicial")%>
    <%=Html.ValidationMessage("SNIInvestigador.FechaFinal")%>
</p>
<p>
    <label>Documento probatorio</label>
    <span id="span_sni_documento" class="valor">&nbsp;</span><br />
</p>
<div style="padding: 0 0 10px 20px">
    <input type="file" name="SniInvestigador_DocumentoProbatorio" id="SniInvestigador_DocumentoProbatorio" class="fileUpload"/>
</div>
<div id="Sni_FileQueue" style="display:none;" rel="#span_sni_documento"></div>