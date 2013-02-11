var MAP_WIDTH;
var MAP_HEIGHT;
var current = [];

function lng2x(lng) {
	var xfactor = 2.752;
	var xoffset = 473.75;
	var x = (lng * xfactor) + xoffset;
	return x;
}

function lat2y(lat) {
	var yfactor = -2.753;
	var yoffset = 231;
	var y = (lat * yfactor) + yoffset;
	return y;
}

function zoomToLatLng(R, lat, lng) {
	var x = lng2x(lng);
	var y = lat2y(lat);
	R.setViewBox(x-100, y-100, 100*2, 100*2, true);
}

function zoomToXY(x, y, smooth) {
	sf = 3;
	tx = ((MAP_WIDTH / 2) - x) * sf;
	ty = ((MAP_HEIGHT / 2) - y) * sf;
	$map = $('#map');
	if (smooth) {
		$map.addClass('smooth');
	}
	$map.css('-webkit-transform', 'matrix(' + sf + ', 0, 0, ' + sf + ', ' + tx + ', ' + ty + ')');
}

function plot(R, lat, lng, size, confname) {
	var conf_attr = {
		fill: Raphael.getColor(.9),
		stroke: "none",
		opacity: .8
	};

	size = size * .5 + 4;
	return R.circle(lng2x(lng), lat2y(lat), size).attr(conf_attr).data('confname', confname).hover(function(e) {
		this.attr({
			stroke: "#00f",
			'stroke-width': 2
		});
		console.log(this.data('confname'));
	}, function(e) {
		if (!(this.data('selected'))) {
			this.attr({
				stroke: "none"
			});
		}
	}).click(function(e) {
		if (this.data('selected')) {
			current = [];
			this.attr({
				stroke: "none"
			}).data('selected', false);
			$map.css('-webkit-transform', 'matrix(1, 0, 0, 1, 0, 0)');
		}
		else {
			// deselect current conf
			if (current.length > 0) {
				current[0].attr({
					stroke: "none"				
				}).data('selected', false);
			}

			// add new current conf
			current = [this];
			this.attr({
				stroke: "#00f",
				'stroke-width': 2			
			}).data('selected', true);

			// zoom to current conf
			zoomToXY(lng2x(lng), lat2y(lat), true);
			$(this.node).popover({
				title: confname			
			}).popover('show');
		}
	});
}
