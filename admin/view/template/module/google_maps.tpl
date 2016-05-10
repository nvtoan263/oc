<?php echo $header; ?><?php echo $column_left; ?>
<?php echo $gmaps_info; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
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
		<?php if ($success) { ?>
			<div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
				<button type="button" class="close" data-dismiss="alert">&times;</button>
    		</div>
		<?php } ?>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-globe"></i> <?php echo $text_list; ?></h3>
				<span style="float: right;"><?php echo '<a href="#" data-toggle="modal" data-target="#about">' . $gmaps_info_name . '</a>' . ' (v' . $gmaps_info_version . ')&nbsp;&nbsp;' . $gmaps_donate; ?></span>
            </div>
			<div class="panel-body">
				<div class="table-responsive">
					<table class="table table-bordered table-hover">
						<thead>
						<tr>
							<td class="text-left"><?php echo $column_name; ?></td>
							<td class="text-right"><?php echo $column_count; ?></td>
							<td class="text-right"><?php echo $column_action; ?></td>
						</tr>
						</thead>
						<tbody>
						<tr>
							<td class="text-left"><?php echo $text_add_marker; if (!$wlocation) { echo '&nbsp;&nbsp;<span class="text-warning"><i class="fa fa-exclamation-triangle"></i> ' . $permission_location . '</span>'; } ?></td>
							<td class="text-right"><?php echo count($gmaps); ?></td>
							<td class="text-right"><?php if (!$wlocation) {?><a class="btn btn-warning"><i class="fa fa-exclamation-triangle"></i></a><?php } else { ?><a href="<?php echo $action_add_marker; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a><?php } ?></td>
						</tr>
						<tr>
							<td class="text-left"><?php echo $text_add_module; if (!$wmapmodule) { echo '&nbsp;&nbsp;<span class="text-warning"><i class="fa fa-exclamation-triangle"></i> ' . $permission_mapmodule . '</span>'; } ?></td>
							<td class="text-right"><?php echo count($module_data); ?></td>
							<td class="text-right"><?php if (!$wmapmodule) {?><a class="btn btn-warning"><i class="fa fa-exclamation-triangle"></i></a><?php } else { ?><a href="<?php echo $action_add_module; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-success"><i class="fa fa-plus-circle"></i></a><?php } ?></td>
						</tr>
						</tbody>
					</table>
				</div>
				<?php if (isset($module_data) and !empty($module_data)) { ?>
				<div class="table-responsive">
					<table class="table table-bordered table-hover">
						<thead>
						<tr>
							<td class="text-left"><?php echo $column_module; ?></td>
							<td class="text-right"><?php echo $column_action; ?></td>
						</tr>
						</thead>
						<tbody>
						<?php foreach ($module_data as $module) { ?>
						<tr>
							<td class="text-left"><?php echo $module['name']; ?></td>
							<td class="text-right"><?php if (!$wmapmodule) {?><a class="btn btn-warning"><i class="fa fa-exclamation-triangle"></i></a><?php } else { ?><a onclick="confirm('<?php echo $text_confirm; ?>') ? location.href='<?php echo $module['delete']; ?>' : false;" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger"><i class="fa fa-trash-o"></i></a> <a href="<?php echo $module['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a><?php } ?></td>
						</tr>
						<?php } ?>
						</tbody>
					</table>
				</div>
				<?php } ?>
			</div>
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
<?php echo $footer; ?>