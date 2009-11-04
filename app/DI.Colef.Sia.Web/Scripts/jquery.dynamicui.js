Array.prototype.contains = function(obj) {
    var i = this.length;
    while (i--) {
        if (this[i] === obj) {
            return true;
        }
    }
    return false;
}

jQuery.dynamicui = function(select, options) {
    var me = this;

    // Create jQuery object for input element
    var $select = $(select);

    select.dynamic = me;

    if ($select.isDropDownList()) {
        $select.change(setupFields);
    } else if ($select.isCheckBox()) {
        $select.click(setupFields);
    }

    this.setup = setupFields;

    function isArray(obj) {
        return obj && !(obj.propertyIsEnumerable('length')) && typeof obj === 'object' && typeof obj.length === 'number';
    }

    function setupFields() {
        if (options.data == null)
            return;

        if ($select.isDropDownList()) {
            for (var i = 0; i < options.data.length; i++) {
                if (isArray(options.data[i][0])) {
                    var value = $select.selectedText();
                    if (options.data[i][0].contains(value) || (options.data[i][0].contains('*') && !$select.isSelected('Seleccione ...'))) {
                        showFields(options.data[i][1]);
                    } else {
                        hideFields(options.data[i][1]);
                    }
                } else {
                    if ($select.isSelected(options.data[i][0])) {
                        showFields(options.data[i][1]);
                    } else if (options.data[i][0] == '*' && !$select.isSelected('Seleccione ...')) {
                        showFields(options.data[i][1]);
                    } else {
                        hideFields(options.data[i][1]);
                    }
                }
            }
        } else if ($select.isCheckBox()) {
            for (var i = 0; i < options.data.length; i++) {
                if ($select.isChecked() && options.data[i][0] == '1') {
                    showFields(options.data[i][1]);
                } else if (!$select.isChecked() && options.data[i][0] == '0') {
                    showFields(options.data[i][1]);
                } else {
                    hideFields(options.data[i][1]);
                }
            }
        }
    }

    function showFields(fields) {
        if (fields == null)
            return;

        for (var i = 0; i < fields.length; i++) {
            var field = fields[i];

            if (!$(field).is(':visible')) {
                if ($(field).hasClass('noeffect')) {
                    $(field).show();
                } else {
                    $(field).slideDown('fast', function() {
                        $(field).fadeIn('fast');
                    });
                }
            }
        }
    }

    function hideFields(fields) {
        if (fields == null)
            return;

        for (var i = 0; i < fields.length; i++) {
            var field = fields[i];

            if ($(field).is(':visible')) {
                if ($(field).hasClass('noeffect')) {
                    $(field).hide();
                } else {
                    $(field).slideUp('fast', function() {
                        $(field).fadeOut('fast');
                    });
                }
            }
        }
    }
}

jQuery.fn.dynamicui = function(data) {
    // Make sure options exists
    options = {};

    options.data = ((typeof data == "object") && (data.constructor == Array)) ? data : null;

    this.each(function() {
        var select = this;
        new jQuery.dynamicui(select, options);
    });

    // Don't break the chain
    return this;
}

/* Determines if the element is a checkbox. */
jQuery.fn.isCheckBox = function() {
    ///     <summary>
    ///     Determines if the element is a checkbox.
    ///     </summary>
    ///     <returns type="Boolean" />
    return (jQuery(this).formElementType() === "checkbox");
}

/* Determines if the element is checked. The pre-condition for this is the element is a checkbox. */
jQuery.fn.isChecked = function() {
    ///     <summary>
    ///     Determines if the element is checked. The pre-condition for this is the element is a checkbox.
    ///     </summary>
    ///     <returns type="Boolean" />
    var current = jQuery(this);
    return current.is(":checked");
}

/* Determines if the element is a drop down list, that is a select box with 1 row and items appear when clicked, rather
   than just a scrollbar. */
jQuery.fn.isDropDownList = function()
{
    ///     <summary>
    ///     Determines if the element is a drop down list, that is a select box with 1 row and items appear when clicked, rather than just a scrollbar.
    ///     </summary>
    ///     <returns type="Boolean" />
    var type = jQuery(this).formElementType();
    var size = (this).attr("size");
    
    if (type !== "select-one")
    {
        return false;
    }
    else
    {
        if (typeof size === "undefined")
            return true;
        else
            return (parseInt(size) <= 1);
    }
}

jQuery.fn.isMultiSelectBox = function() {
    ///     <summary>
    ///     Determines if the element is a multi selection select box. 
    ///     </summary>
    ///     <returns type="Boolean" />
    return (jQuery(this).formElementType() === "select-multiple");
}

jQuery.fn.isSelectBox = function() {
    ///     <summary>
    ///     Determines if the element is a single selection 2 or more rows select box.
    ///     </summary>
    ///     <returns type="Boolean" />

    var type = jQuery(this).formElementType();
    var size = (this).attr("size");

    if (type !== "select-one") {
        return false;
    }
    else {
        if (typeof size === "undefined")
            return false;
        else
            return (parseInt(size) > 1);
    }
}

jQuery.fn.isRadioBox = function() {
    ///     <summary>
    ///     Determines if the element is a radiobox.
    ///     </summary>
    ///     <returns type="Boolean" />
    return (jQuery(this).formElementType() === "radio");
}

/* Determines if the list of provided values are selected. The pre-condition for this is the element is a select box. 
   This performs an 'AND' search - all the values must be selected for the function to return true.
   Example: $("#element").isSelected("1","2");
   @param arguments A list of values to see if they are selected.
*/
jQuery.fn.isSelected = function() {
    ///     <summary>
    ///     Determines if the list of provided values are selected. The pre-condition for this is the element is a select box. 
    /// This performs an 'AND' search - all the values must be selected for the function to return true.
    ///     </summary>
    ///     <param name="args" type="Array">A list of values to see if they are selected.</param>
    ///     <returns type="Boolean" />
    var current = jQuery(this);

    if (arguments.length === 0) {
        return false; // throw?
    }

    var result = false;
    var compareTo = arguments[0];
    var argumentsIn = arguments; // copy for scope inside the jQuery.each


    if (current.isDropDownList()) {
        var selected = jQuery("#" + current.attr("id") + " option:selected");
        if (selected.length === 1) {
            var selected = selected.text();
            return (compareTo === selected);
        }
    }

    return result;
}

jQuery.fn.selectedItem = function(index) {
    ///     <summary>
    ///     Retrieves the Nth selected item from a radiobox or select box list. If N is greater than the number of selected items
    /// then the last item is returned.
    /// Example: $("#element").selectedItem(2); // the 3rd selected item.
    ///     </summary>
    ///     <param name="index" type="Number"> The selected index to retrieve, this is zero based. </param>
    ///     <returns type="jQuery" />
    var current = jQuery(this);
    if (typeof index === "undefined" || isNaN(index))
        index = 0;

    if (current.isRadioBox()) {
        var selected = jQuery("input[type='radio'][name='" + current.attr("name") + "'][checked]");
        if (index > selected.length - 1)
            index = selected.length - 1;
        else if (index < 0)
            index = 0;

        if (selected.length > 0)
            return jQuery(selected[index]);
    }
    else if (current.isSelectBox() || current.isMultiSelectBox() || current.isDropDownList()) {
        var selected = jQuery("#" + current.attr("id") + " option:selected");
        if (index > selected.length - 1)
            index = selected.length - 1;
        else if (index < 0)
            index = 0;

        if (selected.length > 0)
            return jQuery(selected[index]);
    }

    return current; // is this the proper behaviour?
}

jQuery.fn.selectedValue = function() {
    ///     <summary>
    ///     Gets the value of the first selected item in a radiobox list or select box list.
    ///     </summary>
    ///     <returns type="String" />
    var current = jQuery(this);
    return current.selectedItem(0).val();
}

jQuery.fn.selectedText = function() {
    ///     <summary>
    ///     Gets the text of the first selected item in a select box list.
    ///     </summary>
    ///     <returns type="String" />
    var current = jQuery(this);
    return current.selectedItem(0).text();
}

jQuery.fn.elementExists = function() {
    ///     <summary>
    ///     Checks if a jQuery object exists in the DOM, by checking the length of its child elements.
    ///     </summary>
    ///     <returns type="Boolean" />
    return jQuery(this).length > 0;
}

/* Retrieves the form field type based on its type attribute. */
jQuery.fn.formElementType = function() {
    ///     <summary>
    ///     Retrieves the form field type based on its type attribute.
    ///     </summary>
    ///     <returns type="String" />
    if (jQuery(this).elementExists())
        return jQuery(this).attr("type");
    else
        return "";
};