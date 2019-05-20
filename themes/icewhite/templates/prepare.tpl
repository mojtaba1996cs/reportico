{% autoescape false %}
{% include 'header.inc.tpl' %}

<div id="reportico-container">

<!-- Widget Initialisation -->
{{ASSETS_INIT}}

<!-- Begin Form -->
{{ WIDGETS["criteria-form"]["begin"] }}

    <!-- Menu Bar -->
    {% include 'navigation-menu.inc.tpl' %}

    {% if PERMISSIONS["design"] %}
    <!-- Output options -->
    {% include 'prepare-design-options.inc.tpl' %}
    {% endif %}

    {% if PERMISSIONS["execute"] %}

    <!-- Report Title -->
    {{ WIDGETS["title"] }}

    <!-- Report Output options -->
    {% if not FLAGS["admin-report-selected"] %}
    <div class="row" style="width: 100%;">

        <div class="col-lg-12 col-md-12 col-sm-12">

            {% if FLAGS["show_hide_prepare_print_html_button"] %} {{ WIDGETS["output-html-new-window"] }} {% endif %}
            {% if FLAGS["show_hide_prepare_html_button"] %} {{ WIDGETS["output-html-inline"] }} {% endif %}
            {% if FLAGS["show_hide_prepare_pdf_button"] %} {{ WIDGETS["output-pdf"] }} {% endif %}
            {% if FLAGS["show_hide_prepare_csv_button"] %} {{ WIDGETS["output-csv"] }} {% endif %}

            <div style="display: inline; border-left: dotted 1px">
            {{ WIDGETS["popup-page-setup"] }}
            </div>
            {{ WIDGETS["template"]["save-template"] }}
            {{ WIDGETS["template"]["load-template"] }}
        </div>

    </div>
    {% endif %}


  {# Criteria Midsection Main Selection Block #}
  <div id="criteria-block" class="row" style="padding: 8px; border-top: 1px solid #d0ccc9;">

      {# Left hand side Criteria Entry Blocks #}
      <div class="col-xs-6 col-sm-6 col-lg-6 col-md-6" >

          {% if FLAGS["admin-report-selected"] or FLAGS["show_hide_prepare_go_buttons"] %}
          {{ WIDGETS["submit-go"] }}
          {% endif %}

          {% if PERMISSIONS["design"] %}
          {# Criteria Edit Button #}
          {{ WIDGETS["popup-edit-criteria"] }}
          {% endif %}

          <div class="col-lg-12 container">

              {# Tab Menu Headers #}

              {# Display each criteria item #}
              {% set last_tab = "" %}
              {% set tabs_exist = false %}
              {% set firstCriteria = true %}
              {% set tab_count = 0 %}

              {% for criterion in CRITERIA_BLOCK %}


                  {% if criterion.tab and ( not last_tab )  %}
                  {% set tabs_exist = true %}
                  <ul class="nav nav-tabs">
                  {% endif %}

                  {% if criterion.tab and ( criterion.tab != last_tab )  %}
                      {% set tab_count = tab_count + 1 %}
                      {% set tab_id = criterion.tab | replace({'\ ': '_'}) %}
                      {% if firstCriteria %}
                          <li class="active"><a data-toggle="tab" href="#tab-content-{{ tab_id }}">{{ criterion.tab }}</a></li>
                      {% else %}
                          <li><a data-toggle="tab" href="#tab-content-{{ tab_id }}">{{ criterion.tab }}</a></li>
                      {% endif %}
                  {% endif %}

                  {% set last_tab = criterion.tab %}
                  {% set firstCriteria = false %}

              {% endfor %}

              {% if ( tabs_exist )  %}
                </ul>
              {% endif %}

              {# Tab Menu Contents #}
              {# Display each criteria item #}
              {% set last_tab = "" %}
              {% set tabs_exist = false %}
              {% set tab_count = 1 %}

              <div class="tab-content" style="padding-top: 10px">

              {% for criterion in CRITERIA_BLOCK %}

              {% set tab_id = criterion.tab | replace({'\ ': '_'}) %}
              {% if criterion.tab and ( not last_tab )  %}
                  {% set tabs_exist = true %}
                  <div id="tab-content-{{ tab_id }}" class="tab-pane fade in active">
              {% else %}
                  {% if criterion.tab and ( last_tab != criterion.tab )  %}
                  </div>
                  <div id="tab-content-{{ tab_id }}" class="tab-pane fade">
                  {% endif %}
              {% endif %}

              {# Criteria grouped into collapsible tabs #}
              {% if criterion.tab and ( criterion.tab != last_tab )  %}
              <!--div class="row reportico-toggleCriteriaDiv" id="reportico-toggleCriteriaDiv{{ criterion.id }}">
                      {% if criterion.hidden  %}
                      <a class="reportico-toggleCriteria" id="reportico-toggleCriteria{{ criterion.id }}" href="javascript:toggleCriteria('{{ criterion.id }}')">+</a>
                      {% else %}
                      <a class="reportico-toggleCriteria" id="reportico-toggleCriteria{{ criterion.id }}" href="javascript:toggleCriteria('{{ criterion.id }}')">-</a>
                      {% endif %}
                      {{ criterion.tab }}
              </div-->
              {% endif %}
              {% set last_tab = criterion.tab %}

              {# Criteria entry selection #}
              {% if criterion.hidden %}
              <div class='row {{ criterion.tabclass }}' style="padding: 3px 0px; display: inline">
              {% else %}
              <div class='row {{ criterion.tabclass }}' style="padding: 3px 0px">
              {% endif %}

                  {# Criteria Title and Tooltip #}
                  <div class='col-xs-3 col-sm-3 col-lg-3 col-md-3' style='font-weight: bold'>
                      {% if criterion.tooltip %}
                      <a class='reportico_tooltip' data-toggle="tooltip" data-placement="right" title="{{ criterion.tooltip }}">
                          <span class="glyphicon glyphicon-question-sign"></span>
                      </a>
                      {% endif %}
                      {{ criterion.title }}
                  </div>

                  {# Criteria Selection Widget - text field, datepicker etc #}
                  <div class="col-xs-8 col-sm-8 col-lg-8 col-md-8">
                      {{ criterion.selection }}
                  </div>

                  {# Criteria Expand Button #}
                  <div class="col-xs-1 col-sm-1 col-lg-1 col-md-1">
                      {{ criterion.lookup }}
                  </div>

              </div>



              {% endfor %}

          </div>
          {% if  ( last_tab )  %}
          </div>
          {% endif %}

          </div>

          {% if not FLAGS["admin-report-selected"] and FLAGS["show_hide_prepare_reset_buttons"] %}
          {{ WIDGETS["submit-reset"] }}
          {% endif %}

      </div>

      {# Right hand side - Report Description and Lookup area #}
      <div class="col-sm-6 col-lg-6 col-md-6" id="reportico-prepare-expand-cell" >

           {% include 'prepare-expand-contents.inc.tpl' %}
      </div>
    </div>

          {% endif %}

{{ WIDGETS["criteria-form"]["end"] }}
<!-- End Form -->

{% include 'prepare-modals.inc.tpl' %}

{# After running inline HTML criteria block hides, this widget allows unhiding of it after running report #}
{{ WIDGETS["criteria-toggle"] }}

{{ WIDGETS["powered-by-banner"] }}
</div>

{% include 'footer.inc.tpl' %}

{% endautoescape %}
