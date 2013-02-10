/* application scripts */

function lon2x(lon) {
	var xfactor = 2.752;
	var xoffset = 473.75;
	var x = (lon * xfactor) + xoffset;
	return x;
}

function lat2y(lat) {
	var yfactor = -2.753;
	var yoffset = 231;
	var y = (lat * yfactor) + yoffset;
	return y;
}

var conf_attr = {
	fill: "#0f0",
	stroke: "none",
	opacity: .8
};

function plot(lat,lon,size) {
	size = size * .5 + 4;
	return R.circle(lon2x(lon), lat2y(lat), size).attr(conf_attr).hover(function(e) {
		this.attr({
			stroke: "#00f",
			'stroke-width': 2
		});
	}, function (e) {
		this.attr({
			stroke: "none"
		});		
	});
}

var attr = {
	fill: "#333",
	stroke: "#888",
	"stroke-width": .5,
	"stroke-linejoin": "round"
};

var map = {};
var R = Raphael("map");
renderMap(R, map, attr);


var conferences = {};

conferences.Accra = plot(5.5500, -0.2167, 2);
conferences.Manila = plot(14.5833, 121.0000, 1);
conferences.Oakland = plot(37.8044, -122.2697, 20);
conferences.Sydney = plot(-33.8683, 151.2086, 10)
conferences.Toronto = plot(43.6481, -79.4042, 1);
