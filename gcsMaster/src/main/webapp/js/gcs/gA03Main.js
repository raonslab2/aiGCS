class GcsDashboard {
    constructor() {
        this.initGeolocation();
        this.initList();
        this.bindEvents();
        this.switchView('gallery'); // 기본적으로 갤러리 뷰로 설정
        this.setGalleryColumns();
        $(window).resize(() => this.setGalleryColumns());
    }

    initGeolocation() {
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(
                (pos) => {
                    $("#tmLat").val(pos.coords.latitude);
                    $("#tmLng").val(pos.coords.longitude); 
                },
                (error) => {
                    let errorMsg = '';
                    switch (error.code) {
                        case error.PERMISSION_DENIED:
                            errorMsg = "사용자가 위치 정보 공유를 거부했습니다.";
                            break;
                        case error.POSITION_UNAVAILABLE:
                            errorMsg = "위치 정보를 사용할 수 없습니다.";
                            break;
                        case error.TIMEOUT:
                            errorMsg = "요청 시간이 초과되었습니다.";
                            break;
                        case error.UNKNOWN_ERROR:
                            errorMsg = "알 수 없는 오류가 발생했습니다.";
                            break;
                    }
                    alert("Error: " + errorMsg + " (" + error.message + ")");
                }
            );
        } else {
            alert("이 브라우저에서는 Geolocation이 지원되지 않습니다.");
        }
    }

	bindEvents() {
	    $('#createRouterPath').click((e) => {  
	        var tmLat = $("#tmLat").val(); 
	        var tmLng = $("#tmLng").val(); 
	        window.location.href = "/gcs/dashboard/gA03Main2.do?tmLat=" + tmLat + "&tmLng=" + tmLng;
	    });
	
	    $('#createRouterPolygonPath').click((e) => {  
	        var tmLat = $("#tmLat").val(); 
	        var tmLng = $("#tmLng").val(); 
	        window.location.href = "/gcs/dashboard/gA03Main9.do?tmLat=" + tmLat + "&tmLng=" + tmLng;
	    });
	
	    $(document).on('click', '.pageClass', (e) => {
	        var page = $(e.target).data('page');
	        var totalPageCnt = $(e.target).data('total_page_count');
	        if (page > totalPageCnt) return false;
	        if (page == 0) return false;
	        $("#page").val(page);
	        var formSer = $('#searchForm').serialize();
	        this.loadList(formSer);
	    });
	
	    $('#viewSwitchToggle').click(() => this.toggleView());
	}


    initList() {
        var formSer = $('#searchForm').serialize();
        this.loadList(formSer);
    }

    loadList(formSer) {
        $.ajax({
            url: '/gcs/dashboard/gA03Main2List.do',
            type: 'POST',
            data: formSer
        }).done((res) => {
            this.renderList(res);
        }).fail((jqXHR, textStatus, errorThrown) => {
            alert("AJAX 요청 실패: " + textStatus + " - " + errorThrown);
        });
    }

    renderList(res) {
        const resultList = $('#resultList');
        const galleryView = $('#galleryView');
        resultList.empty();
        galleryView.empty();
        $('.pagination').empty();
        $('.subTr').remove();
        if (res.totalCnt === '0') {
            const data = "<tr class='subTr'><td colspan='9' style='height:100px;'>자료가 존재하지 않습니다.</td></tr>";
            resultList.append(data);
        } else {
            res.list.forEach((row) => {
                resultList.append(this.projectListView(row));
                galleryView.append(this.projectGalleryView(row));
            });
        }
        $('.pagination').append(this.paginationView(res.paginationInfo));
        $('.' + res.paginationInfo.currentPageNo).addClass("active");
        $('.pagination > li').css('cursor', 'pointer');
    }

    projectListView(row) {
        return `
            <tr id="subRow" class="subTr" style="cursor:pointer;">
                <td class="dlPk">${row.dlPk}</td>
                <td><img src="/images/sample_map.png" height="32" /></td>
                <td><button type="button" onclick="GcsDashboard.fn_waypoint33(${row.dlPk}); return false;" class="btn_style03 btn_green btnMoveReg">${row.dlName}</button></td>
                <td>${row.dlHomeX} , ${row.dlHomeY}</td>
                <td><button type="button" onclick="GcsDashboard.fn_waypoint(${row.dlPk}); return false;" class="btn_style03 btn_red btnMoveReg">Edit</button></td>
                <td><span onclick="GcsDashboard.fn_del(${row.dlPk}); return false;" style="margin-left:20px;">DEL</span></td>
                <td>${this.formatDate(row.dlCreateTime)}</td>
            </tr>
        `;
    }

	projectGalleryView(row) {
	    return `
	        <div class="gallery-item">
	            <img src="/images/sample_map.png" alt="Map Image">
	            <div class="content">
	                <h3>${row.dlName}</h3>
	                <div class="meta">
	                    <span>${this.formatDate(row.dlCreateTime)}</span>
	                    <span><button type="button" onclick="GcsDashboard.fn_waypoint(${row.dlPk}); return false;" class="btn_style03 btn_red btnMoveReg">Edit</button></span>
	                </div>
	            </div>
	        </div>
	    `;
	}


    formatDate(dateString) {
        const dateParts = dateString.split('T');
        return dateParts[0];
    }

    paginationView(page) {
        let data = '';
        data += `
            <li class="first"><a class="pageClass" data-page="${page.firstPageNo}" title="첫 페이지 바로가기"><img src="/images/bbs_prev02.gif" alt="첫 페이지" style="margin: 10px;"></a></li>
            <li class="prev"><a class="pageClass" data-page="${page.currentPageNo - 1}" title="이전 페이지(1page) 바로가기"><img src="/images/bbs_prev01.gif" alt="이전 페이지" style="margin: 10px;"></a></li>
        `;
        for (let i = page.firstPageNoOnPageList; i <= page.lastPageNoOnPageList; i++) {
            data += `<li class="${i}"><a class="pageClass" data-page="${i}" title="${i}페이지 바로가기">${i}</a></li>`;
        }
        data += `
            <li class="next"><a class="pageClass" data-total_page_count="${page.totalPageCount}" data-page="${page.currentPageNo + 1}" title="다음 페이지(11page) 바로가기"><img src="/images/bbs_next01.gif" alt="다음 페이지" style="margin: 10px;"></a></li>
            <li class="last"><a class="pageClass" data-page="${page.lastPageNo}" title="끝 페이지(67page) 바로가기"><img src="/images/bbs_next02.gif" alt="마지막 페이지" style="margin: 10px;"></a></li>
        `;
        return $(data);
    }

	switchView(view) {
	    if (view === 'list') {
	        $('.table').show();
	        $('#galleryView').hide();
	        $('#viewSwitchToggle').text('GV');
	    } else {
	        $('.table').hide();
	        $('#galleryView').show();
	        $('#viewSwitchToggle').text('LV');
	    }
	}
	
	toggleView() {
	    const currentView = $('#viewSwitchToggle').text() === 'LV' ? 'list' : 'gallery';
	    this.switchView(currentView);
	}

    setGalleryColumns() {
        let columns = 5;
        const width = $(window).width();
        if (width <= 1200) columns = 4;
        if (width <= 992) columns = 3;
        if (width <= 768) columns = 2;
        if (width <= 576) columns = 1;

        $('.gallery').css('column-count', columns);
    }
}

$(document).ready(() => {
    new GcsDashboard();
});

GcsDashboard.fn_waypoint = function (dlPk) {
    window.location.href = "/gcs/dashboard/gA03Main2.do?dlPk=" + dlPk;
};

GcsDashboard.fn_waypoint33 = function (dlPk) {
    var popup = window.open("/gcs/dashboard/gA03Main33.do?dlPk=" + dlPk, "waypoint", "fullscreen=yes, toolbar=no, location=no, directories=no, status=no, menubar=no,scrollbars=no,resizable=no");
};

GcsDashboard.fn_del = function (dlPk) {
    var result = confirm('Are you sure you want to do this?');
    if (result) {
        $.ajax({
            url: '/gcs/dashboard/gA03MainDelete.do',
            type: 'post',
            data: { "dlPk": dlPk },
            async: false
        }).done((res) => {
            console.log(res.list);
            alert("Success");
            $(location).attr('href', '/gcs/dashboard/gA03Main.do');
        }).fail(() => {
            alert("실패");
        });
    }
};
