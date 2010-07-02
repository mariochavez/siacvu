<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl" %>

var html = '
    <div id="correoElectronicoEmptyListForm" class="sublista sublista-dos">
        <h6>
            <span>Este usuario no tiene correos electr&oacute;nicos asignados</span>
        </h6>
    </div>
';

$('#message').html('');
$('#message').removeClass('errormessage');

$('#correoElectronico_<%=Html.Encode(Model) %>').remove();

deleteElement(html, '#correoElectronicoList div[id^=correoElectronico_]', '#correoElectronicoList');

setupSublistRows();
