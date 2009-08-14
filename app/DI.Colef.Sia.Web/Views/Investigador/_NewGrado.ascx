<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<InvestigadorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Grado</label>
    <%=Html.DropDownList("GradoAcademicoInvestigador.GradoAcademico", Model.GradosAcademicos.CreateSelectList<GradoAcademicoForm>("Id", "Nombre"),
"Seleccione ...")%>
    <%=Html.ValidationMessage("GradoAcademicoInvestigador.GradoAcademico")%>
</p>
<p>
    <label>Fecha</label>
    <%=Html.TextBox("GradoAcademicoInvestigador.Fecha", Model.GradoAcademicoInvestigador.Fecha, new { @class = "datetime input100-requerido", maxlength = 10 })%>
    <span>(Formato dd/mm/yyyy)</span>
    <%=Html.ValidationMessage("GradoAcademicoInvestigador.Fecha")%>
</p>
<p>
    <label>Descripcion</label>
    <%=Html.TextBox("GradoAcademicoInvestigador.Descripcion", Model.GradoAcademicoInvestigador.Descripcion, new { @class = "input250-requerido", maxlength = 40 })%>
    <%=Html.ValidationMessage("GradoAcademicoInvestigador.Descripcion")%>
</p>
<p>
    <label>Area</label>
    <%=Html.TextBox("GradoAcademicoInvestigador.AreaInvestigacion", Model.GradoAcademicoInvestigador.AreaInvestigacion, new { @class = "input250", maxlength = 40 })%>
    <%=Html.ValidationMessage("GradoAcademicoInvestigador.AreaInvestigacion")%>
</p> 
<p>
    <label>Detalle</label>
    <%=Html.TextArea("GradoAcademicoInvestigador.Detalle", Model.GradoAcademicoInvestigador.Detalle, 3, 35, new { @class = "input250", maxlength = 100 })%>
    <span>(Descripcion narrativa)</span>
</p>