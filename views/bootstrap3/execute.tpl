{% if not REPORTICO_AJAX_CALLED %}
{% if not EMBEDDED_REPORT %}
<not DOCTYPE html>
<HTML>
<HEAD>
<TITLE>{{ TITLE }}</TITLE>
{{ OUTPUT_ENCODING }}
</HEAD>
{% if REPORT_PAGE_STYLE %}
{% if REPORTICO_STANDALONE_WINDOW %}
<BODY class="swRepBody swRepBodyStandalone" {{ REPORT_PAGE_STYLE }};">
{% else %}
<BODY class="swRepBody">
{% endif %}
{% else %}
{% if REPORTICO_STANDALONE_WINDOW %}
<BODY class="swRepBody swRepBodyStandalone">
{% else %}
<BODY class="swRepBody">
{% endif %}
{% endif %}

    <LINK id="bootstrap_css" REL="stylesheet" TYPE="text/css" HREF="{{ ASSETS_PATH }}/js/bootstrap3/css/bootstrap.min.css">

<LINK id="PRP_StyleSheet" REL="stylesheet" TYPE="text/css" HREF="{{ THEME_DIR }}/css/reportico_bootstrap.css">
{% else %}
    {% if not REPORTICO_BOOTSTRAP_PRELOADED %}
        <LINK id="bootstrap_css" REL="stylesheet" TYPE="text/css" HREF="{{ ASSETS_PATH }}/js/bootstrap3/js/bootstrap.min.css">
    {% endif %}
    <LINK id="PRP_StyleSheet" REL="stylesheet" TYPE="text/css" HREF="{{ THEME_DIR }}/css/reportico_bootstrap.css">
{% endif %}
{% if AJAX_ENABLED %}
{% if not REPORTICO_AJAX_PRELOADED %}
{% if not REPORTICO_JQUERY_PRELOADED || REPORTICO_STANDALONE_WINDOW %}

<script type="text/javascript" src="{{ ASSETS_PATH }}/js/jquery.js"></script>

{% endif %}

<script type="text/javascript" src="{{ ASSETS_PATH }}/js/ui/jquery-ui.js"></script>


<script type="text/javascript" src="{{ ASSETS_PATH }}/js/download.js"></script>
<script type="text/javascript" src="{{ ASSETS_PATH }}/js/reportico.js"></script>

{% endif %}
{% if REPORTICO_CSRF_TOKEN %}
<script type="text/javascript">var reportico_csrf_token = "{{ REPORTICO_CSRF_TOKEN }}";</script>
{% endif %}
{% if BOOTSTRAP_STYLES %}
{% if not REPORTICO_BOOTSTRAP_PRELOADED %}
<script type="text/javascript" src="{{ ASSETS_PATH }}/js/bootstrap3/js/bootstrap.min.js"></script>
{% endif %}
{% endif %}
{% endif %}
{% if not REPORTICO_AJAX_PRELOADED %}

<script type="text/javascript" src="{{ ASSETS_PATH }}/js/ui/i18n/jquery.ui.datepicker-{{ AJAX_DATEPICKER_LANGUAGE }}.js"></script>

{% endif %}
{% if not BOOTSTRAP_STYLES %}

<script type="text/javascript" src="{{ ASSETS_PATH }}/js/jquery.jdMenu.js"></script>
<LINK id="reportico_css" REL="stylesheet" TYPE="text/css" HREF="{{ ASSETS_PATH }}/js/jquery.jdMenu.css">

{% endif %}

<LINK id="reportico_css" REL="stylesheet" TYPE="text/css" HREF="{{ ASSETS_PATH }}/js/ui/jquery-ui.css">
<script type="text/javascript">var reportico_datepicker_language = "{{ AJAX_DATEPICKER_FORMAT }}";</script>
<script type="text/javascript">var reportico_this_script = "{{ SCRIPT_SELF }}";</script>
<script type="text/javascript">var reportico_ajax_script = "{{ REPORTICO_AJAX_RUNNER }}";</script>
<script type="text/javascript">var pdf_delivery_mode = "{{ PDF_DELIVERY_MODE }}";</script>

{% if REPORTICO_BOOTSTRAP_MODAL %}
<script type="text/javascript">var reportico_bootstrap_styles = "{{ BOOTSTRAP_STYLES }}";</script>
<script type="text/javascript">var reportico_bootstrap_modal = true;</script>
{% else %}
<script type="text/javascript">var reportico_bootstrap_modal = false;</script>
<script type="text/javascript">var reportico_bootstrap_styles = false;</script>
{% endif %}

<script type="text/javascript">var reportico_ajax_mode = "{{ REPORTICO_AJAX_MODE }}";</script>
<script type="text/javascript">var reportico_report_title = "{{ TITLE }}";</script>
<script type="text/javascript">var reportico_css_path = "{{ THEME_DIR }}/css/reportico_bootstrap.css";</script>

{% endif %}
{% if REPORTICO_CHARTING_ENGINE == "FLOT"  %}

<script type="text/javascript" src="{{ ASSETS_PATH }}/js/flot/jquery.flot.js"></script>
<script type="text/javascript" src="{{ ASSETS_PATH }}/js/flot/jquery.flot.axislabels.js"></script>

{% endif %}
{% if REPORTICO_CHARTING_ENGINE == "NVD3"  %}
{% if not REPORTICO_AJAX_PRELOADED %}

<script type="text/javascript" src="{{ ASSETS_PATH }}/js/nvd3/d3.min.js"></script>
<script type="text/javascript" src="{{ ASSETS_PATH }}/js/nvd3/nv.d3.js"></script>
<LINK id="nvd3_css" REL="stylesheet" TYPE="text/css" HREF="{{ ASSETS_PATH }}/js/nvd3/nv.d3.css">

{% endif %}
{% endif %}
{% if not REPORTICO_AJAX_PRELOADED %}

<script type="text/javascript" src="{{ ASSETS_PATH }}/js/jquery.dataTables.min.js"></script>

<LINK id="datatable_css" REL="stylesheet" TYPE="text/css" HREF="{{ STYLESHEETDIR }}/jquery.dataTables.css">
{% endif %}
{% if PRINTABLE_HTML %}

<script type="text/javascript" src="{{ ASSETS_PATH }}/js/reportico.js"></script>
<script type="text/javascript">
/*
* Where multiple data tables exist due to graphs
* resize the columns of all tables to match the first
*/
function resizeOutputTables(window)
{
  var tableArr = reportico_jquery(".swRepPage");
  var tableDataRow = reportico_jquery('.swRepResultLine:first');

  var cellWidths = new Array();
  reportico_jquery(tableDataRow).each(function() {
    for(j = 0; j < reportico_jquery(this){{ 0.cells.length; j++){ }
       var cell = reportico_jquery(this){{ 0.cells[j]; }
       if(not cellWidths[j] || cellWidths[j] < cell.clientWidth) cellWidths[j] = cell.clientWidth;
    }
  });

  var tablect = 0;
  reportico_jquery(tableArr).each(function() {
    tablect++;
    if ( tablect == 1 )
        return;

    reportico_jquery(this).find(".swRepResultLine:first").each(function() {
      for(j = 0; j < reportico_jquery(this){{ 0.cells.length; j++){ }
        reportico_jquery(this){{ 0.cells{{ j.style.width = cellWidths[j]+'px';  }}
      }
   });
 });
}
</script>

{% endif %}
<div id="reportico_container">
    <script>
        reportico_criteria_items = [];
{% if CRITERIA_ITEMS is defined %}
{% for critno in CRITERIA_ITEMS %}
        reportico_criteria_items.push("{CRITERIA_ITEMS[critno].name}");
{% endfor %}
{% endif %}
    </script>
<div class="swRepForm">
{% if ERRORMSG|length>0 %}
            <div id="reporticoEmbeddedError">
                {{ ERRORMSG }}
            </div>

            <script>
                reportico_jquery(document).ready(function()
                {
                    showParentNoticeModal(reportico_jquery("#reporticoEmbeddedError").html());
                });
            </script>

            <TABLE class="swError">
                <TR>
                    <TD>{{ ERRORMSG }}</TD>
                </TR>
            </TABLE>
{% endif %}
{% if STATUSMSG|length>0 %} 
			<TABLE class="swStatus">
				<TR>
					<TD>{{ STATUSMSG }}</TD>
				</TR>
			</TABLE>
{% endif %}
{% if SHOW_LOGIN %}
			<TD width="10%"></TD>
			<TD width="55%" align="left" class="swPrpTopMenuCell">
{% if PROJ_PASSWORD_ERROR|length > 0 %}
                                <div style="color: #ff0000;">{{ PASSWORD_ERROR }}</div>
{% endif %}
				Enter the report project password. <br><input type="password" name="project_password" value=""></div>
				<input class="swLinkMenu" type="submit" name="login" value="Login">
			</TD>
{% endif %}
{% if REPORTICO_DYNAMIC_GRIDS %}
<script type="text/javascript">var reportico_dynamic_grids = true;</script>
{% if REPORTICO_DYNAMIC_GRIDS_SORTABLE %}
<script type="text/javascript">var reportico_dynamic_grids_sortable = true;</script>
{% else %}
<script type="text/javascript">var reportico_dynamic_grids_sortable = false;</script>
{% endif %}
{% if REPORTICO_DYNAMIC_GRIDS_SEARCHABLE %}
<script type="text/javascript">var reportico_dynamic_grids_searchable = true;</script>
{% else %}
<script type="text/javascript">var reportico_dynamic_grids_searchable = false;</script>
{% endif %}
{% if REPORTICO_DYNAMIC_GRIDS_PAGING %}
<script type="text/javascript">var reportico_dynamic_grids_paging = true;</script>
{% else %}
<script type="text/javascript">var reportico_dynamic_grids_paging = false;</script>
{% endif %}
<script type="text/javascript">var reportico_dynamic_grids_page_size = {{ REPORTICO_DYNAMIC_GRIDS_PAGE_SIZE }};</script>
{% else %}
<script type="text/javascript">var reportico_dynamic_grids = false;</script>
{% endif %}
{{ CONTENT }}
</div>
{% if not REPORTICO_AJAX_CALLED %}
{% if not EMBEDDED_REPORT %}
</BODY>
</HTML>
{% endif %}
{% endif %}

{% if REPORTICO_BOOTSTRAP_MODAL %}
{% if BOOTSTRAP_STYLES == "3"  %}
<div class="modal fade" id="reporticoNoticeModal" tabindex="-1" role="dialog" aria-labelledby="reporticoNoticeModal" aria-hidden="true">
    <div class="modal-dialog modal-lg">
{% else %}
<div class="modal fade" style="width: 500px; margin-left: -450px" id="reporticoNoticeModal" tabindex="-1" role="dialog" aria-labelledby="reporticoModal" aria-hidden="true">
    <div class="modal-dialog">
{% endif %}
        <div class="modal-content">
            <div class="modal-header">
            <button type="button" data-dismiss="modal" class="close" aria-hidden="true">&times;</button>
            <h4 class="modal-title reportico-modal-title" id="reporticoNoticeModalLabel">{{ T_NOTICE }}</h4>
            </div>
            <div class="modal-body" style="padding: 0px" id="reporticoNoticeModalBody">
                <h3>Modal Body</h3>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                <not --button type="button" class="btn btn-primary" >Close</button-->
        </div>
    </div>
  </div>
</div>
{% else %}
<div id="reporticoModal" tabindex="-1" class="reportico-modal">
    <div class="reportico-modal-dialog">
        <div class="reportico-modal-content">
            <div class="reportico-modal-header">
            <button type="button" class="reportico-modal-close">&times;</button>
            <h4 class="reportico-modal-title" id="reporticoModalLabel">Set Parameter</h4>
            </div>
            <div class="reportico-modal-body" style="padding: 0px" id="swMiniMaintain">
                <h3>Modal Body</h3>
            </div>
            <div class="reportico-modal-footer">
                <not --button type="button" class="btn btn-default" data-dismiss="modal">Close</button-->
                <button type="button" class="swMiniMaintainSubmit" >Close</button>
        </div>
    </div>
  </div>
</div>
{% endif %}