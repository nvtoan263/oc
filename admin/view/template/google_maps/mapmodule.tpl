<?php echo $header; ?><?php echo $column_left; ?>
<?php echo $gmaps_info; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button type="submit" form="form-google-hangouts" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
                <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
            </div>
            <h1><?php echo $heading_title; ?></h1>
            <ul class="breadcrumb">
            <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
            <?php } ?>
            </ul>
        </div>
    </div>
    <div class="container-fluid">
        <?php if ($error_warning) { ?>
        <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <?php } ?>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_title; ?></h3>
				<span style="float: right;"><?php echo '<a href="#" data-toggle="modal" data-target="#about">' . $gmaps_info_name . '</a>' . ' (v' . $gmaps_info_version . ')&nbsp;&nbsp;' . $gmaps_donate; ?></span>
            </div>
			<form  action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-google-maps" class="form-horizontal">
				<div class="panel-body">

					<div class="form-group required">
						<label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
						<div class="col-sm-10">
							<input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
							<?php if ($error_name) { ?>
								<div class="text-danger"><?php echo $error_name; ?></div>
							<?php } ?>
						</div>
					</div>

					<div class="form-group required">
						<label class="col-sm-2 control-label"><?php echo $entry_ids; ?></label>
						<div class="col-sm-10">
							<div class="well well-sm" style="height: 150px; overflow: auto;">
							<?php foreach ( $gmaps as $gmap ) { ?>
								<div class="checkbox">
									<label>
									<?php if (is_array($ids) and in_array($gmap['id'], $ids) ) { ?>
										<input type="checkbox" name="ids[]" value="<?php echo $gmap['id']; ?>" checked="checked" />
										<?php echo '(#' . $gmap['id'] . ') ' . $gmap['alias']; ?>
									<?php } else { ?>
										<input type="checkbox" name="ids[]" value="<?php echo $gmap['id']; ?>" />
										<?php echo '(#' . $gmap['id'] . ') ' . $gmap['alias']; ?>
									<?php } ?>
									</label>
								</div>
							<?php } ?>
							</div>
							<a onclick="$(this).parent().find(':checkbox').prop('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').prop('checked', false);"><?php echo $text_unselect_all; ?></a>
							<?php if ($error_ids) { ?>
								<div class="text-danger"><?php echo $error_ids; ?></div>
							<?php } ?>
						</div>
					</div>

					<div class="form-group required">
						<label class="col-sm-2 control-label" for="input-width"><?php echo $entry_width; ?></label>
						<div class="col-sm-10">
							<input type="text" name="width" value="<?php echo $width; ?>" placeholder="<?php echo $placeholder_width; ?>" id="input-width" class="form-control" />
							<?php if ($error_width) { ?>
								<div class="text-danger"><?php echo $error_width; ?></div>
							<?php } ?>
						</div>
					</div>

					<div class="form-group required">
						<label class="col-sm-2 control-label" for="input-height"><?php echo $entry_height; ?></label>
						<div class="col-sm-10">
							<input type="text" name="height" value="<?php echo $height; ?>" placeholder="<?php echo $placeholder_height; ?>" id="input-height" class="form-control" />
							<?php if ($error_height) { ?>
								<div class="text-danger"><?php echo $error_height; ?></div>
							<?php } ?>
						</div>
					</div>


					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-zoom"><?php echo $entry_zoom; ?></label>
						<div class="col-sm-10">
							<select name="zoom" id="input-zoom" class="form-control">
								<option value="20" <?php if ($zoom == '20') { ?>selected="selected"<?php }?>>20</option>
								<option value="19" <?php if ($zoom == '19') { ?>selected="selected"<?php }?>>19</option>
								<option value="18" <?php if ($zoom == '18') { ?>selected="selected"<?php }?>>18</option>
								<option value="17" <?php if ($zoom == '17') { ?>selected="selected"<?php }?>>17</option>
								<option value="16" <?php if ($zoom == '16') { ?>selected="selected"<?php }?>>16</option>
								<option value="15" <?php if ($zoom == '15') { ?>selected="selected"<?php }?>>15</option>
								<option value="14" <?php if ($zoom == '14') { ?>selected="selected"<?php }?>>14</option>
								<option value="13" <?php if ($zoom == '13') { ?>selected="selected"<?php }?>>13</option>
								<option value="12" <?php if ($zoom == '12') { ?>selected="selected"<?php }?>>12</option>
								<option value="11" <?php if ($zoom == '11') { ?>selected="selected"<?php }?>>11</option>
								<option value="10" <?php if ($zoom == '10') { ?>selected="selected"<?php }?>>10</option>
								<option value="9" <?php if ($zoom == '9') { ?>selected="selected"<?php }?>>09</option>
								<option value="8" <?php if ($zoom == '8') { ?>selected="selected"<?php }?>>08</option>
								<option value="7" <?php if ($zoom == '7') { ?>selected="selected"<?php }?>>07</option>
								<option value="6" <?php if ($zoom == '6') { ?>selected="selected"<?php }?>>06</option>
								<option value="5" <?php if ($zoom == '5') { ?>selected="selected"<?php }?>>05</option>
								<option value="4" <?php if ($zoom == '4') { ?>selected="selected"<?php }?>>04</option>
								<option value="3" <?php if ($zoom == '3') { ?>selected="selected"<?php }?>>03</option>
								<option value="2" <?php if ($zoom == '2') { ?>selected="selected"<?php }?>>02</option>
								<option value="1" <?php if ($zoom == '1') { ?>selected="selected"<?php }?>>01</option>
							</select>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-zoom"><?php echo $entry_maptype; ?></label>
						<div class="col-sm-10">
							<select name="maptype" id="input-maptype" class="form-control">
									<option value="ROADMAP" <?php if ($maptype == 'ROADMAP') { ?>selected="selected"<?php } ?>>ROADMAP</option>
									<option value="SATELLITE" <?php if ($maptype == 'SATELLITE') { ?>selected="selected"<?php } ?>>SATELLITE</option>
									<option value="HYBRID" <?php if ($maptype == 'HYBRID') { ?>selected="selected"<?php } ?>>HYBRID</option>
									<option value="TERRAIN" <?php if ($maptype == 'TERRAIN') { ?>selected="selected"<?php } ?>>TERRAIN</option>
							</select>
						</div>
					</div>

					<?php $module['maptype'] = 'ROADMAP'; //todo: ?>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-zoom"><?php echo $entry_status; ?></label>
						<div class="col-sm-10">
							<select name="status" class="form-control">
								<?php if ($status) { ?>
									<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
									<option value="0"><?php echo $text_disabled; ?></option>
								<?php } else { ?>
									<option value="1"><?php echo $text_enabled; ?></option>
									<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
								<?php } ?>
							</select>
						</div>
					</div>


				</div>

			</form>
        </div>
    </div>
</div>
<div class="modal fade" id="about" tabindex="-1" role="dialog" aria-labelledby="aboutLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="<?php echo $button_close; ?>"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="aboutLabel"><?php echo $text_about_title; ?></h4>
			</div>
			<div class="modal-body"><img src="/image/google_maps/google_maps_markers_logo.jpg" /><br /><?php echo $gmaps_about; ?></div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal"><?php echo $button_close; ?></button>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$( document ).ready(function() {
		$('.gmaps_ids').iAlphaNumeric({allow:'_-',disallow:'.',comma:true});
	});

	function addGMap()
	{
		var html = '';
		html +='<div class="tab-pane" id="tab-maps' + map_row + '">';
		html +='	<ul class="nav nav-tabs" id="language">';
		<?php
		$first_language = '';
		$aa_language = 0;
		foreach ($languages as $language) {
			if ($aa_language == 0) $first_language = $language['language_id'];
			$aa_language++;
		?>
		html +='			<li><a href="#language-'+ map_row + '-<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>';
		<?php } ?>
		html +='	</ul>';
		html +='	<div class="tab-content">';
		html += '		<div class="form-group required">';
		html += '			<label class="col-sm-2 control-label" for="input-id-' + map_row + '"><?php echo $entry_id; ?></label>';
		html += '			<div class="col-sm-10">';
		html += '				<input type="text" name="google_maps_module_map[' + map_row + '][id]" value="" placeholder="<?php echo $placeholder_id; ?>" id="input-id-' + map_row + '" class="form-control gmap_id" />';
		html += '			</div>';
		html += '		</div>';
		html += '		<div class="form-group">';
		html += '			<label class="col-sm-2 control-label" for="input-alias-' + map_row + '"><?php echo $entry_alias; ?></label>';
		html += '			<div class="col-sm-10">';
		html += '				<input type="text" name="google_maps_module_map[' + map_row + '][alias]" value="" placeholder="<?php echo $placeholder_alias; ?>" id="input-alias-' + map_row + '" class="form-control gmap_alias" />';
		html += '			</div>';
		html += '		</div>';
		html += '		<div class="form-group">';
		html += '			<label class="col-sm-2 control-label" for="input-address-' + map_row + '"><?php echo $entry_address; ?></label>';
		html += '			<div class="col-sm-10">';
		html += '				<input type="text" name="google_maps_module_map[' + map_row + '][address]" value="" placeholder="<?php echo $placeholder_address; ?>" id="input-address-' + map_row + '" class="form-control gmap_address" />';
		html += '			</div>';
		html += '		</div>';
		html += '		<div class="form-group">';
		html += '			<div class="col-sm-2"></div>';
		html += '			<div class="col-sm-10">';
		html += '				<div id="gmap-location-picker-' + map_row + '" class="gmap-location-picker"></div>';
		html += '			</div>';
		html += '		</div>';
		html += '		<div class="form-group required">';
		html += '			<label class="col-sm-2 control-label" for="input-latitude-' + map_row + '"><?php echo $entry_latitude; ?></label>';
		html += '			<div class="col-sm-10">';
		html += '				<input type="text" name="google_maps_module_map[' + map_row + '][latitude]" value="" placeholder="<?php echo $placeholder_latitude; ?>" id="input-latitude-' + map_row + '" class="form-control gmap_latitude" />';
		html += '			</div>';
		html += '		</div>';
		html += '		<div class="form-group required">';
		html += '			<label class="col-sm-2 control-label" for="input-longitude-' + map_row + '"><?php echo $entry_longitude; ?></label>';
		html += '			<div class="col-sm-10">';
		html += '				<input type="text" name="google_maps_module_map[' + map_row + '][longitude]" value="" placeholder="<?php echo $placeholder_longitude; ?>" id="input-longitude-' + map_row + '" class="form-control gmap_longitude" />';
		html += '			</div>';
		html += '		</div>';
		html += '		<div class="form-group">';
		html += '			<label class="col-sm-2 control-label" for="input-balloon_width' + map_row + '"><?php echo $entry_balloon_width; ?></label>';
		html += '			<div class="col-sm-10">';
		html += '				<input type="text" name="google_maps_module_map[' + map_row + '][balloon_width]" value="" placeholder="<?php echo $entry_balloon_width; ?>" id="input-balloon_width' + map_row + '" class="form-control gmap_balloon_width" />';
		html += '			</div>';
		html += '		</div>';

		<?php foreach ($languages as $language) { ?>
		html +='		<div class="tab-pane" id="language-'+ map_row + '-<?php echo $language['language_id']; ?>">';
		html +='			<div class="tab-pane" id="tab-htexts-<?php $map_row ?>-<?php echo $language['language_id'];?>">';
		html +='				<ul class="nav nav-tabs" id="htexts">';
		html +='					<li><a href="#htexts-' + map_row + '-<?php echo $language['language_id']?>-1" data-toggle="tab">Text Editor</a></li>';
		html +='					<li><a href="#htexts-' + map_row + '-<?php echo $language['language_id']?>-2" data-toggle="tab">One Line HTML</a></li>';
		html +='				</ul>';
		html +='			</div>';
		html +='			<div class="tab-content">';
		html +='				<div class="tab-pane" id="htexts-' + map_row + '-<?php echo $language['language_id']?>-1">';
		html +='					<div class="form-group">';
		html +='						<label class="col-sm-2 control-label" for="input-maptext-' + map_row + '-<?php echo $language['language_id']; ?>"><?php echo $entry_ballon_text; ?></label>';
		html +='						<div class="col-sm-10">';
		html +='							<textarea id="gmap-jqte-' + map_row + '" class="jqte-textarea" name="google_maps_module_map[' + map_row + '][maptext][<?php echo $language['language_id']; ?>]" placeholder="<?php echo $entry_ballon_text; ?>" id="input-maptext-' + map_row + '-<?php echo $language['language_id']; ?>"></textarea>';
		html +='						</div>';
		html +='					</div>';
		html +='				</div>';
		html +='				<div class="tab-pane" id="htexts-' + map_row + '-<?php echo $language['language_id']?>-2">';
		html +='					<div class="form-group">';
		html +='						<label class="col-sm-2 control-label" for="input-onlinetext<?php echo $language['language_id']; ?>"><?php echo $entry_ballon_text; ?></label>';
		html +='						<div class="col-sm-10">';
		html +='							<input type="text" name="google_maps_module_map[' + map_row + '][onelinetext][<?php echo $language['language_id']; ?>]" value="" placeholder="<?php echo $entry_ballon_text; ?>" id="input-onlinetext<?php echo $language['language_id']; ?>" class="form-control" />';
		html +='						</div>';
		html +='					</div>';
		html +='				</div>';
		html +='			</div>';
		html +='		</div>';
		<?php } ?>
		html +='	</div>';
		html +='</div>';

		$('#gform').append(html);
		$('#gmap-jqte-'+ map_row).jqte();

		$('.gmap_id').iInt({disallow:'+-'});
		$('.gmap_alias').iAlphaNumeric({allow:'_',space:true});
		$('.gmap_balloon_width').iInt({disallow:'+-'});

		$('#maps > li:last-child').before('<li><a href="#tab-maps' + map_row + '" data-toggle="tab"><i class="fa fa-minus-circle" style="color: red; cursor: pointer;" onclick=" $(\'a[href=\\\'#tab-maps' + map_row + '\\\']\').parent().remove(); $(\'#tab-maps' + map_row + '\').remove(); $(\'#maps a:first\').tab(\'show\'); "></i> Map ' + map_row + '</a></li>');


		$('#maps a[href=\'#tab-maps' + map_row + '\']').tab('show');
		$('#language a[href=\'#language-' + map_row + '-<?php echo $first_language; ?>\']').tab('show');
		$('#htexts a[href=\'#htexts-' + map_row + '-<?php echo $first_language; ?>-1\']').tab('show');

		$('#gmap-location-picker-' + map_row).locationpicker({
			location: {latitude: 0, longitude: 0},
			radius: 0,
			zoom: 3,
			inputBinding: {
				latitudeInput: $('input[name="google_maps_module_map[' + map_row + '][latitude]"]'),
				longitudeInput: $('input[name="google_maps_module_map[' + map_row + '][longitude]"]'),
				locationNameInput: $('input[name="google_maps_module_map[' + map_row + '][address]"]')
			},
			enableAutocomplete: true
		});

		map_row++;
	}

	function addModule()
	{
		var html = '';
		html += '<tr id="module-row' + module_row + '">';
		html += '	<td class="text-right">' + module_row + '</td>';
		html += '	<td class="text-left"><input type="text" name="google_maps_module[' + module_row + '][ids]" value="" placeholder="<?php echo $placeholder_ids; ?>" id="input-ids-' + module_row + '" class="form-control gmap_ids" /></td>';
		html += '	<td class="text-left"><input type="text" name="google_maps_module[' + module_row + '][width]" value="" placeholder="<?php echo $placeholder_width; ?>" id="input-width-' + module_row + '" class="form-control gmap_width" /></td>';
		html += '	<td class="text-left"><input type="text" name="google_maps_module[' + module_row + '][height]" value="" placeholder="<?php echo $placeholder_height; ?>" id="input-heigh-' + module_row + '" class="form-control gmap_height" /></td>';
		html += '	<td class="text-left">';
		html += '		<select name="google_maps_module[' + module_row + '][zoom]" id="input-zoom' + module_row + '" class="form-control">';
		html += '			<option value="20">20</option>';
		html += '			<option value="19">19</option>';
		html += '			<option value="18" selected="selected">18</option>';
		html += '			<option value="17">17</option>';
		html += '			<option value="16">16</option>';
		html += '			<option value="15">15</option>';
		html += '			<option value="14">14</option>';
		html += '			<option value="13">13</option>';
		html += '			<option value="12">12</option>';
		html += '			<option value="11">11</option>';
		html += '			<option value="10">10</option>';
		html += '			<option value="9">09</option>';
		html += '			<option value="8">08</option>';
		html += '			<option value="7">07</option>';
		html += '			<option value="6">06</option>';
		html += '			<option value="5">05</option>';
		html += '			<option value="4">04</option>';
		html += '			<option value="3">03</option>';
		html += '			<option value="2">02</option>';
		html += '			<option value="1">01</option>';
		html += '		</select>';
		html += '	</td>';
		html += '	<td class="text-left">';
		html += '		<select name="google_maps_module[' + module_row + '][maptype]" id="input-maptype' + module_row + '" class="form-control">';
		html += '				<option value="ROADMAP" selected="selected">ROADMAP</option>';
		html += '				<option value="SATELLITE">SATELLITE</option>';
		html += '				<option value="HYBRID">HYBRID</option>';
		html += '				<option value="TERRAIN">TERRAIN</option>';
		html += '		</select>';
		html += '	</td>';
		html += '	<td class="text-left">';
		html += '		<select name="google_maps_module[' + module_row + '][status]" class="form-control">';
		html += '				<option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
		html += '				<option value="0"><?php echo $text_disabled; ?></option>';
		html += '		</select>';
		html += '	</td>';
		html += '	<td><button type="button" onclick="$(\'#module-row' + module_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
		html += '</tr>';


		$('#module tbody').append(html);
		$('.gmaps_ids').iAlphaNumeric({allow:'_-',disallow:'.',comma:true});

		module_row++;
	}
</script>
<?php echo $footer; ?>