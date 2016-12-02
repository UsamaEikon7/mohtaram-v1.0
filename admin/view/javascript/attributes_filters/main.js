function PopupCenter(pageURL, w, h) {
    var dualScreenLeft = window.screenLeft !== undefined ? window.screenLeft : screen.left;
    var dualScreenTop = window.screenTop !== undefined ? window.screenTop : screen.top;

    width = window.innerWidth ? window.innerWidth : document.documentElement.clientWidth ? document.documentElement.clientWidth : screen.width;
    height = window.innerHeight ? window.innerHeight : document.documentElement.clientHeight ? document.documentElement.clientHeight : screen.height;

    var left = ((width / 2) - (w / 2)) + dualScreenLeft;
    var top = ((height / 2) - (h / 2)) + dualScreenTop;
    var targetWin = window.open(pageURL, '_blank', 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width=' + w + ', height=' + h + ', top=' + top + ', left=' + left);
    return false;
}

function stickyNav() {
    var topOffset = $('#header').height();

    var stickyNavigation = function () {
        var scrollTop = $(window).scrollTop();
        var defaultWidth = $('#column-left').hasClass('active') ? 235 : $('#menu').width();
        var contentWidth = $(window).width() - defaultWidth;
        if (scrollTop > topOffset) {
            $('.sticky-nav').css({
                'position': 'fixed',
                'top': 0,
                'z-index': 100,
                'border-bottom': '1px solid #E5E5E5',
                'background-color': 'white',
                'width': contentWidth,
                'opacity': '.9'
            });
            $('.static-content').css({
                'padding-top': $('.sticky-nav').height()
            });
        } else {
            $('.sticky-nav').css({
                'position': 'relative',
                'z-index': 1,
                'border-bottom': 'none',
                'opacity': 1
            });
            $('.static-content').css({
                'padding-top':0
            });
        }
    };
    
    $(window).scroll(function () {
        stickyNavigation();
    });
    $(window).resize(function () {
        stickyNavigation();
    });
    stickyNavigation();
}

function disableCheckboxButton() {
    $('#search_button_checkbox').addClass('disabled');
    $('#search_button_checkbox input').prop('disabled', true);
    $('#search_button_checkbox label').css({'color': '#ccc', 'cursor': 'not-allowed'});
}

function enableCheckboxButton() {
    $('#search_button_checkbox').removeClass('disabled');
    $('#search_button_checkbox input').prop('disabled', false);
    $('#search_button_checkbox label').css({'color': '#666666', 'cursor': 'default'});
}

function disableCheckbox(wellName) {
    var checkboxInput = $('.' + wellName + ' .checkbox .checkbox_item');
    var checkboxSpan = $('.' + wellName + ' .checkbox span');
    if ($('.checkbox .checkbox_item').attr('disabled') === 'disabled') {
        checkboxInput.removeAttr('disabled').removeClass('disabled');
        checkboxSpan.removeClass('disabled');
    } else {
        checkboxInput.attr('disabled', 'disabled').addClass('disabled');
        checkboxSpan.addClass('disabled');
    }
}

$(document).ready(function () {
    $('#module_panel a:first').tab('show');
    $('#language_text a:first').tab('show');
    $('#language_name a:first').tab('show');

    $('#use_checkbox').on('click', function () {
        if ($('#search_button_checkbox').hasClass('disabled')) {
            enableCheckboxButton();
        } else {
            disableCheckboxButton();
        }
    });

    function initAceEditor() {
        var textarea = $('#textarea-module-css');
        var editor = ace.edit("editor-module-css");
        var editorSession = editor.getSession();
        editorSession.on('change', function () {
            textarea.val(editorSession.getValue());
        });

        editor.setOptions({
            showLineNumbers: true,
            displayIndentGuides: true,
            showFoldWidgets: false,
            showGutter: true,
            showPrintMargin: false
        });
        editor.setTheme("ace/theme/chrome");
        editorSession.setMode("ace/mode/css");
        editor.resize();
    }

    initAceEditor();

    $(document).delegate('a[data-toggle="help_image_icon"]', 'click', function (e) {
        e.preventDefault();
        var element = this;

        $(element).popover({
            html: true,
            placement: 'right',
            trigger: 'focus',
            template: '<div class="popover btech" role="tooltip"><div class="arrow"></div><h3 class="popover-title"></h3><div class="popover-content"></div></div>',
            content: function () {
                return '<img src="view/image/attributes_filters_help/' + $(element).data('image') + '" alt="" />';
            }
        });

        $(element).popover('toggle');
    });
});
