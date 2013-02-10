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

function plot(lat, lon, size, name) {
	size = size * .5 + 4;
	return R.circle(lon2x(lon), lat2y(lat), size).attr(conf_attr).data('name', name).hover(function(e) {
		this.attr({
			stroke: "#00f",
			'stroke-width': 2
		});
		console.log(this.data('name'));
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


var data = $.parseJSON($("#data").text());
for (var c=0; c<data.length; c++) {
    plot(data[c].lat, data[c].lng, 10, data[c].name);
}

