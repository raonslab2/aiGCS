(function() {
    if (typeof L.NewMarkerControl === 'undefined') {
        L.EditControl = L.Control.extend({
            options: {
                position: 'topleft',
                callback: null,
                kind: '',
                html: ''
            },

            onAdd: function(map) {
                var container = L.DomUtil.create('div', 'leaflet-control leaflet-bar'),
                    link = L.DomUtil.create('a', '', container);

                link.href = '#';
                link.title = 'Create a new ' + this.options.kind;
                link.innerHTML = this.options.html;
                L.DomEvent.on(link, 'click', L.DomEvent.stop)
                          .on(link, 'click', function() {
                            window.LAYER = this.options.callback.call(map.editTools);
                          }, this);

                return container;
            }
        });

        L.NewLineControl = L.EditControl.extend({
            options: {
                position: 'topleft',
                callback: map => map.editTools.startPolyline(),
                kind: 'line',
                html: '\\/\\'
            }
        });

        L.NewPolygonControl = L.EditControl.extend({
            options: {
                position: 'topleft',
                callback: map => map.editTools.startPolygon(),
                kind: 'polygon',
                html: '▰'
            }
        });

        // 마커 컨트롤을 생성하고 변수에 할당합니다.
        var markerControl = L.EditControl.extend({
            options: {
                position: 'topleft',
                callback: map => map.editTools.startMarker(),
                kind: 'marker',
                html: '🖈'
            }
        });

        // 필요할 때에만 마커 컨트롤을 지도에 추가합니다.
        window.addMarkerControl = function(map) {
            map.addControl(new markerControl());
        };

        L.NewRectangleControl = L.EditControl.extend({
            options: {
                position: 'topleft',
                callback: map => map.editTools.startRectangle(),
                kind: 'rectangle',
                html: '⬛'
            }
        });

        L.NewCircleControl = L.EditControl.extend({
            options: {
                position: 'topleft',
                callback: map => map.editTools.startCircle(),
                kind: 'circle',
                html: '⬤'
            }
        });
    }

    if (typeof MapControls === 'undefined') {
        class MapControls {
            constructor(map) {
                this.map = map;
            }

            addDefaultControls() {
                // 마커 컨트롤을 필요할 때에만 추가하기 위해 addDefaultControls 메소드에서는 제외합니다.
                this.map.addControl(new L.NewLineControl());
                this.map.addControl(new L.NewPolygonControl());
                this.map.addControl(new L.NewRectangleControl());
                this.map.addControl(new L.NewCircleControl());
            }
        }

        window.MapControls = MapControls;
    }
})();
