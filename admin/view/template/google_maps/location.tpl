<?php echo $header; ?><?php echo $column_left; ?>
<?php echo $gmaps_info; ?>
<div id="content">
	<style type="text/css">
		.fa-minus-circle, .fa-plus-circle {
			font-size: 18px !important;
		}
		.nav-pills {
			border-right: 1px solid #dddddd;
			display: block;
		}
		.nav-pills > li.active {
			margin-right: -1px;
		}
		.nav-stacked > li + li {
			margin-top: 8px;
		}
		.nav-pills > li a {
			border-width: 1px;
			border-style: solid;
			border-color: #dddddd transparent #dddddd #dddddd;
			border-image: none;
			background-color: #f7f7f7;
			border-radius: 0px;
		}
		.nav-pills > li.active > a, .nav-pills > li.active > a:hover, .nav-pills > li.active > a:focus {
			color: inherit;
			background-color: #ffffff;
		}
		.jqte_tool_label {
			height: auto !important;
		}
		#module td span:after,
		label.control-label span:after {
			font-family: FontAwesome;
			color: #1E91CF;
			content: "\f059";
			margin-left: 4px;
		}
	</style>

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
                <h3 class="panel-title"><i class="fa fa-map-marker"></i> <?php echo $text_title; ?></h3>
				<span style="float: right;"><?php echo '<a href="#" data-toggle="modal" data-target="#about">' . $gmaps_info_name . '</a>' . ' (v' . $gmaps_info_version . ')&nbsp;&nbsp;' . $gmaps_donate; ?></span>
            </div>
			<form  action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-google-maps" class="form-horizontal">
				<div class="panel-body">
					<div class="row">
						<div class="col-sm-2">
							<ul class="nav nav-pills nav-stacked" id="maps">
								<?php $map_row = 1; ?>
								<?php $gmap_first = true; foreach ( $gmaps as $gmap ) { ?>
									<li<?php if ($gmap_first) { echo ' class="active"'; $gmap_first = false; } ?>><a href="#tab-maps<?php echo $map_row; ?>" data-toggle="tab"><i class="fa fa-minus-circle" style="color: red; cursor: pointer;" onclick=" if ( confirm('<?php echo $confirm_mapid; ?> (<?php echo $gmap['latitude'] . ',' . $gmap['longitude']; ?>) ?') ) { $('a[href=\'#tab-maps<?php echo $map_row; ?>\']').parent().remove(); $('#tab-maps<?php echo $map_row; ?>').remove(); $('#maps a:first').tab('show'); } "></i> <?php echo isset($gmap['id']) ? strlen($gmap['id'])>0 ? '(#' . $gmap['id'] . ')&nbsp;' .$gmap['alias']  : 'Map ' . $map_row : 'Map ' . $map_row; ?></a></li>
									<?php $map_row++; ?>
								<?php } ?>
								<li onclick="addGMap();" style="cursor: pointer;"><a><i class="fa fa-plus-circle" style="color: green;"></i> <?php echo $button_new_map; ?></a></li>
							</ul>
						</div>

						<div class="col-sm-10">
							<div class="tab-content" id="gform">
								<?php $map_row = 1; ?>
								<?php $gmap_first = true; foreach ( $gmaps as $gmap ) { ?>
									<div class="tab-pane<?php if ($gmap_first) { echo ' active'; $gmap_first = false; } ?>" id="tab-maps<?php echo $map_row; ?>">
										<ul class="nav nav-tabs" id="language">
											<?php $language_first = true; foreach ($languages as $language) { ?>
												<li<?php if ($language_first) { echo ' class="active"'; $language_first = false; } ?>><a href="#language-<?php echo $map_row;?>-<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
											<?php } ?>
										</ul>
										<div class="tab-content">
											<div class="form-group required">
												<label class="col-sm-2 control-label" for="input-id-<?php echo $map_row; ?>"><?php echo $entry_id; ?></label>
												<div class="col-sm-10">
													<input type="text" name="google_maps_module_map[<?php echo $map_row; ?>][id]" value="<?php echo isset($gmap['id']) ? $gmap['id'] : ''; ?>" placeholder="<?php echo $placeholder_id; ?>" id="input-id-<?php echo $map_row; ?>" class="form-control gmap_id" />
													<?php if ($error_id) { ?>
														<div class="text-danger"><?php echo $error_id; ?></div>
													<?php } ?>
												</div>
											</div>

											<div class="form-group">
												<label class="col-sm-2 control-label" for="input-alias-<?php echo $map_row; ?>"><?php echo $entry_alias; ?></label>
												<div class="col-sm-10">
													<input type="text" name="google_maps_module_map[<?php echo $map_row; ?>][alias]" value="<?php echo isset($gmap['alias']) ? $gmap['alias'] : ''; ?>" placeholder="<?php echo $placeholder_alias; ?>" id="input-alias-<?php echo $map_row; ?>" class="form-control gmap_alias" />
												</div>
											</div>

											<div class="form-group">
												<label class="col-sm-2 control-label" for="input-address-<?php echo $map_row; ?>"><?php echo $entry_address; ?></label>
												<div class="col-sm-10">
													<input type="text" name="google_maps_module_map[<?php echo $map_row; ?>][address]" value="<?php echo isset($gmap['address']) ? $gmap['address'] : ''; ?>" placeholder="<?php echo $placeholder_address; ?>" id="input-address-<?php echo $map_row; ?>" class="form-control gmap_address" />
												</div>
											</div>

											<div class="form-group">
												<div class="col-sm-2"></div>
												<div class="col-sm-10">
													<div id="gmap-location-picker-<?php echo $map_row; ?>" class="gmap-location-picker"><img src="/image/google_maps/activate_map.jpg" style="cursor:pointer;" onclick="activateGMap('gmap-location-picker-<?php echo $map_row; ?>', <?php echo isset($gmap['latitude']) ? $gmap['latitude'] : '0'; ?>, <?php echo isset($gmap['longitude']) ? $gmap['longitude'] : '0'; ?>, <?php echo $map_row; ?>, '<?php echo isset($gmap['address']) ? $gmap['address'] : ''; ?>');" /></div>
												</div>
											</div>

											<div class="form-group required">
												<label class="col-sm-2 control-label" for="input-latitude-<?php echo $map_row; ?>"><?php echo $entry_latitude; ?></label>
												<div class="col-sm-10">
													<input type="text" name="google_maps_module_map[<?php echo $map_row; ?>][latitude]" value="<?php echo isset($gmap['latitude']) ? $gmap['latitude'] : ''; ?>" placeholder="<?php echo $placeholder_latitude; ?>" id="input-latitude-<?php echo $map_row; ?>" class="form-control gmap_latitude" />
													<?php if ($error_latitude) { ?>
														<div class="text-danger"><?php echo $error_latitude; ?></div>
													<?php } ?>
												</div>
											</div>

											<div class="form-group required">
												<label class="col-sm-2 control-label" for="input-longitude-<?php echo $map_row; ?>"><?php echo $entry_longitude; ?></label>
												<div class="col-sm-10">
													<input type="text" name="google_maps_module_map[<?php echo $map_row; ?>][longitude]" value="<?php echo isset($gmap['longitude']) ? $gmap['longitude'] : ''; ?>" placeholder="<?php echo $placeholder_longitude; ?>" id="input-longitude-<?php echo $map_row; ?>" class="form-control gmap_longitude" />
													<?php if ($error_longitude) { ?>
														<div class="text-danger"><?php echo $error_longitude; ?></div>
													<?php } ?>
												</div>
											</div>

											<div class="form-group">
												<label class="col-sm-2 control-label" for="input-balloon_width<?php echo $map_row; ?>"><?php echo $entry_balloon_width; ?></label>
												<div class="col-sm-10">
													<input type="text" name="google_maps_module_map[<?php echo $map_row; ?>][balloon_width]" value="<?php echo isset($gmap['balloon_width']) ? $gmap['balloon_width'] : ''; ?>" placeholder="<?php echo $entry_balloon_width; ?>" id="input-balloon_width<?php echo $map_row; ?>" class="form-control gmap_balloon_width" />
												</div>
											</div>

											<?php $language_first = true; foreach ($languages as $language) { ?>
												<div class="tab-pane<?php if ($language_first) { echo ' active'; $language_first = false; } ?>" id="language-<?php echo $map_row;?>-<?php echo $language['language_id']; ?>">
												<div class="tab-pane" id="tab-htexts-<?php $map_row ?>-<?php echo $language['language_id'];?>">
													<ul class="nav nav-tabs" id="htexts">
														<li class="active"><a href="#htexts-<?php echo $map_row; ?>-<?php echo $language['language_id']?>-1" data-toggle="tab">Text Editor</a></li>
														<li><a href="#htexts-<?php echo $map_row; ?>-<?php echo $language['language_id']?>-2" data-toggle="tab">One Line HTML</a></li>
													</ul>
												</div>
												<div class="tab-content">
													<div class="tab-pane active" id="htexts-<?php echo $map_row; ?>-<?php echo $language['language_id']?>-1">
														<div class="form-group">
															<label class="col-sm-2 control-label" for="input-maptext-<?php echo $map_row; ?>-<?php echo $language['language_id']; ?>"><?php echo $entry_ballon_text; ?></label>
															<div class="col-sm-10">
																<textarea class="jqte-textarea" name="google_maps_module_map[<?php echo $map_row; ?>][maptext][<?php echo $language['language_id']; ?>]" placeholder="<?php echo $entry_ballon_text; ?>" id="input-maptext-<?php echo $map_row; ?>-<?php echo $language['language_id']; ?>"><?php echo isset($gmap['maptext'][$language['language_id']]) ? $gmap['maptext'][$language['language_id']] : ''; ?></textarea>
															</div>
														</div>
													</div>
													<div class="tab-pane" id="htexts-<?php echo $map_row; ?>-<?php echo $language['language_id']?>-2">
														<div class="form-group">
															<label class="col-sm-2 control-label" for="input-onlinetext<?php echo $language['language_id']; ?>"><?php echo $entry_ballon_text; ?></label>
															<div class="col-sm-10">
																<input type="text" name="google_maps_module_map[<?php echo $map_row; ?>][onelinetext][<?php echo $language['language_id']; ?>]" value="<?php echo isset($gmap['onelinetext'][$language['language_id']]) ? $gmap['onelinetext'][$language['language_id']] : ''; ?>" placeholder="<?php echo $entry_ballon_text; ?>" id="input-onlinetext<?php echo $language['language_id']; ?>" class="form-control" />
															</div>
														</div>
													</div>
												</div>
											</div>
											<?php } ?>
										</div>
									</div>
									<?php $map_row++; ?>
								<?php } ?>
							</div>
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
		$('.jqte-textarea').jqte();
		$('.gmap_id').iInt({disallow:'+-'});
		$('.gmap_alias').iAlphaNumeric({allow:'_',space:true});
		$('.gmap_balloon_width').iInt({disallow:'+-'});
		$('.gmap_latitude').iNumeric({allow:'-', disallow:'+',comma:false});
		$('.gmap_longitude').iNumeric({allow:'-', disallow:'+',comma:false});
	});

	function activateGMap(id, lat, long, mp_rw, addressVal)
	{
		var map = $('#' + id);
		if ( map.html() == '' || map.html().indexOf('activate_map') > 0 ) {
			map.empty().width(550).height(400).locationpicker({
				location: {latitude: lat, longitude: long},
				radius: 0,
				zoom: 1,
				inputBinding: {
					latitudeInput: $('input[name="google_maps_module_map[' + mp_rw + '][latitude]"]'),
					longitudeInput: $('input[name="google_maps_module_map[' + mp_rw + '][longitude]"]'),
					locationNameInput: $('input[name="google_maps_module_map[' + mp_rw + '][address]"]')
				},
				enableAutocomplete: true, enableReverseGeocode: false
			});
			$('input[name="google_maps_module_map[' + mp_rw + '][address]"]').val(addressVal);
		}
	}

	var map_row = <?php echo $map_row; ?>;

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
		html += '				<div id="gmap-location-picker-' + map_row + '" class="gmap-location-picker"><img src="/image/google_maps/activate_map.jpg" style="cursor:pointer;" onclick="activateGMap(\'gmap-location-picker-' + map_row + '\', 0, 0, ' + map_row + ', \'\');" /></div>';
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

		map_row++;
	}
</script>
<?php echo $footer; ?>