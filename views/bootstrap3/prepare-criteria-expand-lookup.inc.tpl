							{{ T_SEARCH }} {{ EXPANDED_TITLE }} :<br><input  id="expandsearch" type="text" class="{{ BOOTSTRAP_STYLE_TEXTFIELD }}" name="expand_value" style="width: 50%;display: inline" size="30" value="{{ EXPANDED_SEARCH_VALUE }}"</input>
									<input id="reporticoSearchExpand" class="{{ BOOTSTRAP_STYLE_SMALL_BUTTON }}swPrpSubmit" style="margin-bottom: 2px" type="submit" name="EXPANDSEARCH_{{ EXPANDED_ITEM }}" value="Search"><br>

{{ CONTENT }}
							<br>
							<input class="{{ BOOTSTRAP_STYLE_SMALL_BUTTON }}swPrpSubmit" type="submit" name="EXPANDCLEAR_{{ EXPANDED_ITEM }}" value="Clear">
							<input class="{{ BOOTSTRAP_STYLE_SMALL_BUTTON }}swPrpSubmit" type="submit" name="EXPANDSELECTALL_{{ EXPANDED_ITEM }}" value="Select All">
							<input class="{{ BOOTSTRAP_STYLE_SMALL_BUTTON }}swPrpSubmit" type="submit" name="EXPANDOK_{{ EXPANDED_ITEM }}" value="OK">