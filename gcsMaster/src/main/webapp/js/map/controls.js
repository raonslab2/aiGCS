(function() {
 
        L.EditControl = L.Control.extend({
            options: {
                position: 'topright',
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
                            if (map.editTools) {
                                var layer = this.options.callback.call(map.editTools);
                                if (layer && layer.enableEdit) {
                                    layer.enableEdit();
                                    layer.dragging.enable();
                                    layer.transform.enable({ rotation: true, scaling: false });
                                }
                            } else {
                                console.error('editTools is not defined on the map');
                            }
                          }, this);

                return container;
            }
        });

        L.NewLineControl = L.EditControl.extend({
            options: {
                position: 'topright',
                callback: function() {
                    if (this._map.editTools) {
                        return this._map.editTools.startPolyline();
                    } else {
                        console.error('editTools is not defined on the map');
                        return null;
                    }
                },
                kind: 'line',
                html: '\\/\\'
            }
        });

        L.NewPolygonControl = L.EditControl.extend({
            options: {
                position: 'topright',
                callback: function() { 
                    if (this._map.editTools) {
                        var polygon = this._map.editTools.startPolygon();
                        polygon.on('editable:drawing:end', function() {
                            polygon.enableEdit();
                            polygon.dragging.enable();
                            polygon.transform.enable({ rotation: true, scaling: false });
                        });
                        return polygon;
                    } else {
                        console.error('editTools is not defined on the map');
                        return null;
                    }
                },
                kind: 'polygon',
                html: '▰'
            }
        });

        var markerControl = L.EditControl.extend({
            options: {
                position: 'topright',
                callback: function() {
                    if (this._map.editTools) {
                        return this._map.editTools.startMarker();
                    } else {
                        console.error('editTools is not defined on the map');
                        return null;
                    }
                },
                kind: 'marker',
                html: '🖈'
            }
        });

        window.addMarkerControl = function(map) {
            map.addControl(new markerControl());
        };

        L.NewRectangleControl = L.EditControl.extend({
            options: {
                position: 'topright',
                callback: function() {
                    if (this._map.editTools) {
                        var rectangle = this._map.editTools.startRectangle();
                        rectangle.on('editable:drawing:end', function() {
                            rectangle.enableEdit();
                            rectangle.dragging.enable();
                            rectangle.transform.enable({ rotation: true, scaling: false });
                        });
                        return rectangle;
                    } else {
                        console.error('editTools is not defined on the map');
                        return null;
                    }
                },
                kind: 'rectangle',
                html: '⬛'
            }
        });

        L.NewCircleControl = L.EditControl.extend({
            options: {
                position: 'topright',
                callback: function() {
                    if (this._map.editTools) {
                        return this._map.editTools.startCircle();
                    } else {
                        console.error('editTools is not defined on the map');
                        return null;
                    }
                },
                kind: 'circle',
                html: '⬤'
            }
        });

        // Custom Zoom Control
        L.CustomZoomControl = L.Control.extend({
            options: {
                position: 'bottomright'
            },
            onAdd: function(map) {
                var container = L.DomUtil.create('div', 'leaflet-bar leaflet-control custom-zoom-control');
                this._zoomInButton = this._createButton('+', 'Zoom in', 'leaflet-control-zoom-in zoom-button', container, this._zoomIn, this);
                this._zoomOutButton = this._createButton('-', 'Zoom out', 'leaflet-control-zoom-out zoom-button', container, this._zoomOut, this);
                return container;
            },
            
            _createButton: function(html, title, className, container, fn, context) {
                var link = L.DomUtil.create('a', className, container);
                link.innerHTML = html;
                link.href = '#';
                link.title = title;

                L.DomEvent.on(link, 'click', L.DomEvent.stopPropagation)
                          .on(link, 'click', L.DomEvent.preventDefault)
                          .on(link, 'click', fn, context);

                return link;
            },
            
            _zoomIn: function(e) {
                this._map.zoomIn(e.shiftKey ? 3 : 1);
            },

            _zoomOut: function(e) {
                this._map.zoomOut(e.shiftKey ? 3 : 1);
            }
        });

        var customZoom = new L.CustomZoomControl();
 

 
        class MapControls {
            constructor(map) { 
                this._map = map; 
            }

            addDefaultControls() {
                //this._map.addControl(new L.NewLineControl());
                //this._map.addControl(new L.NewPolygonControl());
                //this._map.addControl(new L.NewRectangleControl());
                //this._map.addControl(new L.NewCircleControl());

                // 기존 줌 컨트롤 제거 후 커스텀 줌 컨트롤 추가
                this._map.zoomControl.remove();
                this._map.addControl(customZoom);
            }
        }
 
        window.MapControls = MapControls;
 
})();
