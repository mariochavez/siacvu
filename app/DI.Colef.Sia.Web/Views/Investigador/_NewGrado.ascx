<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<InvestigadorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Grado Académico</label>
    <%=Html.DropDownList("GradoAcademicoInvestigador.GradoAcademico", Model.GradosAcademicos.CreateSelectList<GradoAcademicoForm>("Id", "Nombre"),
        "Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("GradoAcademicoInvestigador.GradoAcademico")%>
</p>
<p>
    <label>Fecha de obtención de grado</label>
    <%=Html.TextBox("GradoAcademicoInvestigador.Fecha", Model.GradoAcademicoInvestigador.Fecha, new { @class = "datetime input100-requerido", maxlength = 10 })%>
    <span>(Formato dd/mm/yyyy)</span>
    <%=Html.ValidationMessage("GradoAcademicoInvestigador.Fecha")%>
</p>
<p>
    <label>Nombre del programa</label>
    <%=Html.TextBox("GradoAcademicoInvestigador.Programa", Model.GradoAcademicoInvestigador.Programa, new { @class = "input420-requerido", maxlength = 40 })%>
    <%=Html.ValidationMessage("GradoAcademicoInvestigador.Programa")%>
</p>
<p>
    <label>Instituci&oacute;n</label>
    <%=Html.TextBox("GradoAcademicoInvestigador.InstitucionNombre", Model.GradoAcademicoInvestigador.InstitucionNombre,
                new { @class = "autocomplete buscar-requerido", maxlength = 100, rel = Url.Action("Search", "Institucion") })%>
    <%=Html.Hidden("GradoAcademicoInvestigador.InstitucionId", Model.GradoAcademicoInvestigador.InstitucionId, new { rel = "#GradoAcademicoInvestigador_InstitucionNombre", url = Url.Action("ChangeInstitucion") })%>
    <%=Html.ValidationMessage("GradoAcademicoInvestigador.Institucion")%>
</p> 
<p>
    <label>Pa&iacute;s</label>
    <span id="span_pais" class="valor"><%= Html.Encode(Model.GradoAcademicoInvestigador.InstitucionPaisNombre)%>&nbsp;</span>
</p>
<p>
    <label>Documento probatorio</label>
    <span id="span_gradoacademico_documento" class="valor">&nbsp;</span><br />
</p>
<div style="padding: 0 0 10px 20px">
    <input type="file" name="GradoAcademicoInvestigador_DocumentoProbatorio" id="GradoAcademicoInvestigador_DocumentoProbatorio" class="fileUpload"/>
</div>
<div id="GradoAcademico_FileQueue" style="display:none;" rel="#span_gradoacademico_documento"></div>