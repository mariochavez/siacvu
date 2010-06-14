<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Catalogos"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Productos"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>

<div class="FondoMenuLadoA" id="ColumnaA">
    
    <div class="modulo left">
        
            <h1>Producci&oacute;n cient&iacute;fica</h1>
            <ul>
    			<li><%=Html.ActionLinkForAreas<LibroController>(x => x.Index(), "Libros")%></li>
    			<li><%=Html.ActionLinkForAreas<CapituloController>(x => x.Index(), "Cap&iacute;tulos en libros")%></li>
    			<li><%=Html.ActionLinkForAreas<ArticuloController>(x => x.Index(), "Art&iacute;culos en revistas de investigaci&oacute;n")%></li>
    			<li><%=Html.ActionLinkForAreas<ArticuloDifusionController>(x => x.Index(), "Art&iacute;culos en revistas de difusi&oacute;n")%></li>
    			<li><%=Html.ActionLinkForAreas<ResenaController>(x => x.Index(), "Rese&ntilde;as-Notas cr&iacute;ticas")%></li>
    			<li><%=Html.ActionLinkForAreas<ReporteController>(x => x.Index(), "Reportes t&eacute;cnicos-Documentos de trabajo")%></li>
    			<li><%=Html.ActionLinkForAreas<ObraTraducidaController>(x => x.Index(), "Obras traducidas")%></li>
		    </ul>
    </div>

    <div class="modulo left">
        
            <h1>Proyectos de investigaci&oacute;n</h1>
            <ul>
                <li><%=Html.ActionLinkForAreas<ProyectoController>(x => x.Index(), "Proyectos de investigaci&oacute;n")%></li>
            </ul>
    </div>

    <div class="modulo left">
        
            <h1>Dict&aacute;menes</h1>
            <ul>
                <li><%=Html.ActionLinkForAreas<DictamenController>(x => x.Index(), "Dict&aacute;menes")%></li>
            </ul>
    </div>

    <div class="modulo left">
    
        <h1>Formaci&oacute;n de recursos humanos</h1>
        <ul>
            <li><%=Html.ActionLinkForAreas<TesisDirigidaController>(x => x.Index(), "Participaci&oacute;n en Tesis")%></li>
			<li><%=Html.ActionLinkForAreas<CursoController>(x => x.Index(), "Cursos")%></li>
        </ul>
    </div>

    <div class="modulo left">
    
        <h1>Organizaci&oacute;n y participaci&oacute;n de eventos acad&eacute;micos</h1>
        <ul>
            <li><%=Html.ActionLinkForAreas<EventoController>(x => x.Index(), "Organizaci&oacute;n y participaci&oacute;n de eventos acad&eacute;micos")%></li>
        </ul>
    </div>
<% if(Page.User.IsInRole("DGAA")) { %>
    <div class="modulo left">
    
        <h1>Mantenimiento</h1>
        <ul>
            <li><%=Html.ActionLinkForAreas<RevistaPublicacionController>(x => x.Index(), "Revistas")%></li>
			<li><%=Html.ActionLinkForAreas<InstitucionController>(x => x.Index(), "Instituciones")%></li>
			<li><%=Html.ActionLinkForAreas<EditorialController>(x => x.Index(), "Editoriales")%></li>
        </ul>
    </div>
<% } %>
</div>

<div class="FondoMenuLadoB" id="ColumnaB">

    <div class="modulo left">
    
        <h1>Difusi&oacute;n del conocimiento</h1>
        <ul>
            <li><%=Html.ActionLinkForAreas<ParticipacionMedioController>(x => x.Index(), "Difusi&oacute;n del conocimiento")%></li>
        </ul>
    </div>

    <div class="modulo left">
    
        <h1>Formaci&oacute;n acad&eacute;mica y trabajo cient&iacute;fico</h1>
        <ul>
            <li><%=Html.ActionLinkForAreas<FormacionAcademicaController>(x => x.Index(), "Formaci&oacute;n acad&eacute;mica")%></li>
			<li><%=Html.ActionLinkForAreas<ExperienciaProfesionalController>(x => x.Index(), "Experiencia profesional") %></li>
			<li><%=Html.ActionLinkForAreas<GrupoInvestigacionController>(x => x.Index(), "Grupos de investigaci&oacute;n") %></li>
			<li><%=Html.ActionLinkForAreas<IdiomasInvestigadorController>(x => x.Index(), "Idiomas") %></li>
			<li><%=Html.ActionLinkForAreas<ApoyoConacytController>(x => x.Index(), "Apoyo CONACYT") %></li>
        </ul>
    </div>

    <div class="modulo left">
    
        <h1>Distinciones acad&eacute;micas</h1>
        <ul>
            <li><%=Html.ActionLinkForAreas<DistincionController>(x => x.Index(), "Distinciones acad&eacute;micas")%></li>
        </ul>
    </div>

    <div class="modulo left">
    
        <h1>Participaci&oacute;n en &oacute;rganos colegiados</h1>
        <ul>
            <% if(Page.User.IsInRole("DGAA")) { %>
			    <li><%=Html.ActionLinkForAreas<OrganoInternoController>(x => x.Index(), "Participaci&oacute;n en &oacute;rganos Internos")%></li>
			<% } %>
			<% if(Page.User.IsInRole("Investigadores")) { %>
			    <li><%=Html.ActionLinkForAreas<OrganoExternoController>(x => x.Index(), "Participaci&oacute;n Honor&iacute;fica en &Oacute;rganos Colegiados Externos")%></li>
			<% } %>
        </ul>
    </div>

    <div class="modulo left">
    
        <h1>Movilidad acad&eacute;mica</h1>
        <ul>
            <% if(Page.User.IsInRole("Investigadores")) { %>
			    <li><%=Html.ActionLinkForAreas<EstanciaInstitucionExternaController>(x => x.Index(), "Estancias en instituciones externas")%></li>
			<% } %>
			<% if(Page.User.IsInRole("DGAA")) { %>
			    <li><%=Html.ActionLinkForAreas<EstanciaAcademicaExternaController>(x => x.Index(), "Estancias acad&eacute;micas externas")%></li>
			<% } %>
        </ul>
    </div>
<% if(Page.User.IsInRole("DGAA")) { %>
    <div class="modulo left">
    
        <h1>Planta acad&eacute;mica</h1>
        <ul>
            <li><%=Html.ActionLinkForAreas<InvestigadorController>(x => x.Index(), "Planta acad&eacute;mica")%></li>
			<li><%=Html.ActionLinkForAreas<UsuarioController>(x => x.Index(), "Permisos")%></li>
        </ul>
    </div>
<% } %>
</div>

<%--<div id="slide" class="panel">
	<div id="areas">
		<h3>&Aacute;reas</h3>
		<ul>
		    <% if(Page.User.IsInRole("Investigadores")) { %>
			    <li><%=Html.ActionLinkForAreas<ProyectoController>(x => x.Index(), "Proyectos de investigaci&oacute;n")%></li>
			    <li><a href="#cientifica">Producci&oacute;n cient&iacute;fica</a></li>
			    <li><%=Html.ActionLinkForAreas<DictamenController>(x => x.Index(), "Dict&aacute;menes") %></li>
			    <li><a href="#recursoshumano">Formaci&oacute;n de recursos humanos</a></li>
			    <li><%=Html.ActionLinkForAreas<EventoController>(x => x.Index(), "Organizaci&oacute;n y participaci&oacute;n de eventos acad&eacute;micos")%></li>
			    <li><%=Html.ActionLinkForAreas<ParticipacionMedioController>(x => x.Index(), "Difusi&oacute;n del conocimiento")%></li>
			    <li><a href="#academia">Formaci&oacute;n acad&eacute;mica y trabajo cient&iacute;fico</a></li>
			    <li><%=Html.ActionLinkForAreas<DistincionController>(x => x.Index(), "Distinciones acad&eacute;micas")%></li>
			<% } %>
			<li><a href="#organos">Participaci&oacute;n en &oacute;rganos colegiados</a></li>
			<li><a href="#movilidad">Movilidad acad&eacute;mica</a></li>
			<% if(Page.User.IsInRole("DGAA")) { %>
			    <li><a href="#planta">Planta acad&eacute;mica</a></li>
			    <li><a href="#mantenimiento">Mantenimiento</a></li>
			<% } %>
		</ul>
	</div>
	
	<div id="cientifica" style="display: none;">
		<h3>Producci&oacute;n acad&eacute;mica</h3>
		<ul>
			<li><%=Html.ActionLinkForAreas<LibroController>(x => x.Index(), "Libros")%></li>
			<li><%=Html.ActionLinkForAreas<CapituloController>(x => x.Index(), "Cap&iacute;tulos en libros")%></li>
			<li><%=Html.ActionLinkForAreas<ArticuloController>(x => x.Index(), "Art&iacute;culos en revistas de investigaci&oacute;n")%></li>
			<li><%=Html.ActionLinkForAreas<ArticuloDifusionController>(x => x.Index(), "Art&iacute;culos en revistas de difusi&oacute;n")%></li>
			<li><%=Html.ActionLinkForAreas<ResenaController>(x => x.Index(), "Rese&ntilde;as-Notas cr&iacute;ticas")%></li>
			<li><%=Html.ActionLinkForAreas<ReporteController>(x => x.Index(), "Reportes t&eacute;cnicos-Documentos de trabajo")%></li>
			<li><%=Html.ActionLinkForAreas<ObraTraducidaController>(x => x.Index(), "Obras traducidas")%></li>
			<li><a href="#areas" class="back">Regrear a men&uacute; principal</a></li>
		</ul>
	
	</div>
	<div id="recursoshumano" style="display: none;">
		<h3>Formaci&oacute;n de recursos humanos</h3>
		<ul>
			<li><%=Html.ActionLinkForAreas<TesisDirigidaController>(x => x.Index(), "Tesis dirigidas")%></li>
			<li><%=Html.ActionLinkForAreas<CursoController>(x => x.Index(), "Cursos")%></li>
			<li><a href="#areas" class="back">Regrear a men&uacute; principal</a></li>
		</ul>
	
	</div>
	<div id="academia" style="display: none;">
		<h3>Formaci&oacute;n acad&eacute;mica y trabajo cient&iacute;fico</h3>
		<ul>
			<li><%=Html.ActionLinkForAreas<FormacionAcademicaController>(x => x.Index(), "Formaci&oacute;n acad&eacute;mica")%></li>
			<li><%=Html.ActionLinkForAreas<ExperienciaProfesionalController>(x => x.Index(), "Experiencia profesional") %></li>
			<li><%=Html.ActionLinkForAreas<GrupoInvestigacionController>(x => x.Index(), "Grupos de investigaci&oacute;n") %></li>
			<li><%=Html.ActionLinkForAreas<IdiomasInvestigadorController>(x => x.Index(), "Idiomas") %></li>
			<li><%=Html.ActionLinkForAreas<ApoyoConacytController>(x => x.Index(), "Apoyo CONACYT") %></li>
			<li><a href="#areas" class="back">Regrear a men&uacute; principal</a></li>
		</ul>
	
	</div>
	<div id="organos" style="display: none;">
		<h3>Participaci&oacute;n en &oacute;rganos colegiados</h3>
		<ul>
		    <% if(Page.User.IsInRole("DGAA")) { %>
			    <li><%=Html.ActionLinkForAreas<OrganoInternoController>(x => x.Index(), "Participaci&oacute;n en &oacute;rganos Internos")%></li>
			<% } %>
			<% if(Page.User.IsInRole("Investigadores")) { %>
			    <li><%=Html.ActionLinkForAreas<OrganoExternoController>(x => x.Index(), "Participaci&oacute;n Honor&iacute;fica en &Oacute;rganos Colegiados Externos")%></li>
			<% } %>
			<li><a href="#areas" class="back">Regrear a men&uacute; principal</a></li>
		</ul>
	
	</div>
	<div id="movilidad" style="display: none;">
		<h3>Movilidad acad&eacute;mica</h3>
		<ul>
		    <% if(Page.User.IsInRole("Investigadores")) { %>
			    <li><%=Html.ActionLinkForAreas<EstanciaInstitucionExternaController>(x => x.Index(), "Estancias en instituciones externas")%></li>
			<% } %>
			<% if(Page.User.IsInRole("DGAA")) { %>
			    <li><%=Html.ActionLinkForAreas<EstanciaAcademicaExternaController>(x => x.Index(), "Estancias acad&eacute;micas externas")%></li>
			<% } %>
			<li><a href="#areas" class="back">Regrear a men&uacute; principal</a></li>
		</ul>
	
	</div>
	<div id="planta" style="display: none;">
		<h3>Planta acad&eacute;mica</h3>
		<ul>
			<li><%=Html.ActionLinkForAreas<InvestigadorController>(x => x.Index(), "Planta acad&eacute;mica")%></li>
			<li><%=Html.ActionLinkForAreas<UsuarioController>(x => x.Index(), "Permisos")%></li>
			<li><a href="#areas" class="back">Regrear a men&uacute; principal</a></li>
		</ul>
	
	</div>
	<div id="mantenimiento" style="display: none;">
		<h3>Mantenimiento</h3>
		<ul>
			<li><%=Html.ActionLinkForAreas<RevistaPublicacionController>(x => x.Index(), "Revistas")%></li>
			<li><%=Html.ActionLinkForAreas<InstitucionController>(x => x.Index(), "Instituciones")%></li>
			<li><%=Html.ActionLinkForAreas<EditorialController>(x => x.Index(), "Editoriales")%></li>
			<li><a href="#areas" class="back">Regrear a men&uacute; principal</a></li>
		</ul>
	
	</div>
	<div style="clear:both;"></div>
</div>


<a class="trigger" href="#">M<br/>e<br/>n<br/>&uacute;</a>--%>