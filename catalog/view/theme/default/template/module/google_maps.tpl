<?php if ( $module_map == 0 ) { echo $gmaps_info;  } ?>
<style type="text/css">
	#google_map_div_<?php echo $module_map; ?> {
		width: <?php echo $gmap_width; ?>;
		height: <?php echo $gmap_height; ?>;
		border: 6px solid #f4f4f4;
		padding: 0;
		margin: 0 0 10px;
	}
</style>
<div id="google_map_div_<?php echo $module_map; ?>"></div>
<script type="text/javascript">
<?php
if ( $module_map == 0 )
{
$google_marker = <<<EOD

	var imageMarker = new google.maps.MarkerImage(
		'$gmap_marker',
		new google.maps.Size($gmap_marker_image_size),
		new google.maps.Point(0, 0),
		new google.maps.Point($gmap_marker_point)
	);


EOD;
echo $google_marker;
}
?>
$(document).ready(function() {
<?php
$google_map = <<<EOD
	var latlng$module_map = new google.maps.LatLng($gmap_flatlong);
	var options$module_map = {
		zoom: $gmap_zoom,
		center: latlng$module_map,
		mapTypeId: google.maps.MapTypeId.$gmap_maptype
	};

	var map$module_map = new google.maps.Map(document.getElementById('google_map_div_$module_map'), options$module_map);
EOD;

$aa = 0;
foreach ($gmaps as $gmap)
{
	$aa += 1;
	$google_map_text = strlen($gmap['onelinetext'])>0 ? $gmap['onelinetext'] : $gmap['maptext'];
	$google_map_text = str_replace("'", "\\'", $google_map_text);

$google_map .= <<<EOD

	var marker$module_map$aa = new google.maps.Marker({
		position: new google.maps.LatLng({$gmap['latlong']}),
		map: map$module_map,
		icon: imageMarker
	});

	google.maps.event.addListener(marker$module_map$aa, 'click', function() {
		infowindow$module_map$aa.open(map$module_map, marker$module_map$aa);
	});

	google.maps.event.addListener(map$module_map, 'click', function() {
		infowindow$module_map$aa.close();
	});

	var infowindow$module_map$aa = new google.maps.InfoWindow({
		content:  '<div style="width:{$gmap['balloon_width']}">$google_map_text</div>'
	});
EOD;
}
echo $google_map;
?>
});
</script>