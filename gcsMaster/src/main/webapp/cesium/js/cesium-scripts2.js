

var mapOptions = { 
    		  scene: {
    			    center: { lat: 30.820398, lng: 116.218603, alt: 6483, heading: 22, pitch: -40 }
    			  },
    		  control: {
    			     //以下是Cesium.Viewer所支持的控件相关的options
    			    baseLayerPicker: true, //basemaps底图切换按钮，图层选择器，选择要显示的地图服务和地形服务
    			    homeButton: true, //视角复位按钮
    			    sceneModePicker: true, //二三维切换按钮， 选择投影模式,有三种：3D,2D,哥伦布视图
    			    navigationHelpButton: true, //帮助按钮，显示默认的地图控制帮助
    			    infoBox: true, //信息框
    			    selectionIndicator: true, //选择框
    			    vrButton: true, //vr模式按钮
    			    fullscreenButton: true, //全屏按钮
    			    animation: false, //动画部件按钮（左下角），控制视图动画的播放速度
    			    timeline: false, //时间线（下侧）,指示当前时间，并允许用户跳到特定的时间
    			    geocoder: true, //POI查询按钮
    			    geocoderConfig: { key: ['ae29a37307840c7ae4a785ac905927e0'] }, //POI查询按钮参数配置

    			    //以下是mars3d.control定义的控件
    			    defaultContextMenu: true, //右键菜单
    			    mouseDownView: true,
    			    compass: { top: '10px', left: '60px' },
    			    distanceLegend: { left: '100px', bottom: '2px' },
    			    timeline: false, //是否显示 时间线控件
    			  },
    	      lang: mars3d.LangType.EN // 使用英文
    		 
     } //支持的参数请看API文档：http://mars3d.cn/api/Map.html
     var map = new mars3d.Map('mars3dContainer', mapOptions);
     

     var  tileLayer = new mars3d.layer.XyzLayer({
    	    url: 'http://mt1.google.cn/vt/lyrs=s&hl=zh-CN&gl=CN&x={x}&y={y}&z={z}&s=Gali', 
    	})
    	map.addLayer(tileLayer)


     
 

