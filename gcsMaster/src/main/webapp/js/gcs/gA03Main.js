// /webapp/js/gcs/gA03Main.js

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
                    const errorMsg = this.getGeolocationErrorMessage(error.code);
                    alert(`Error: ${errorMsg} (${error.message})`);
                }
            );
        } else {
            alert("이 브라우저에서는 Geolocation이 지원되지 않습니다.");
        }
    }

    getGeolocationErrorMessage(code) {
        switch (code) {
            case error.PERMISSION_DENIED:
                return "사용자가 위치 정보 공유를 거부했습니다.";
            case error.POSITION_UNAVAILABLE:
                return "위치 정보를 사용할 수 없습니다.";
            case error.TIMEOUT:
                return "요청 시간이 초과되었습니다.";
            case error.UNKNOWN_ERROR:
                return "알 수 없는 오류가 발생했습니다.";
        }
    }

    bindEvents() {
        $('#createRouterPath').click(() => this.navigateToPath("/gcs/dashboard/gA03Main2.do"));
        $('#createRouterPolygonPath').click(() => this.navigateToPath("/gcs/dashboard/gA03Main9.do"));
        $(document).on('click', '.pageClass', (e) => this.handlePageClick(e));

        // 뷰 전환 버튼 이벤트 처리
        $('#viewSwitchToggle').click(() => this.toggleView());
    }

    navigateToPath(url) {
        const tmLat = $("#tmLat").val(); 
        const tmLng = $("#tmLng").val(); 
        window.location.href = `${url}?tmLat=${tmLat}&tmLng=${tmLng}`;
    }

    handlePageClick(e) {
        const page = $(e.target).data('page');
        const totalPageCnt = $(e.target).data('total_page_count');
        if (page > totalPageCnt || page == 0) return false;
        $("#page").val(page);
        this.loadList($('#searchForm').serialize());
    }

    initList() {
        this.loadList($('#searchForm').serialize());
    }

    loadList(formSer) {
        $.ajax({
            url: '/gcs/dashboard/gA03Main2List.do',
            type: 'POST',
            data: formSer
        }).done((res) => {
            this.renderList(res);
        }).fail((jqXHR, textStatus, errorThrown) => {
            alert(`AJAX 요청 실패: ${textStatus} - ${errorThrown}`);
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
        $(`.${res.paginationInfo.currentPageNo}`).addClass("active");
        $('.pagination > li').css('cursor', 'pointer');
    }

	projectListView(row) {
	    return `
	        <tr id="subRow" class="subTr" style="cursor:pointer;">
	            <td class="dlPk">${row.dlPk}</td>
	            <td><img src="/images/sample_map.png" height="32" /></td>
	            <td><button type="button" onclick="GcsDashboard.fn_waypoint33(${row.dlPk}); return false;" class="btn_style03 btn_green btnMoveReg">${row.dlName}</button></td>
	            <td>${row.dlHomeX} , ${row.dlHomeY}</td>
	            <td>
	                ${row.dlDiv === "0"
	                    ? `<button type="button" onclick="GcsDashboard.fn_waypoint2D(${row.dlPk}); return false;" class="btn_style03 btn_red btnMoveReg">2D</button>`
	                    : `<button type="button" onclick="GcsDashboard.fn_waypoint3D(${row.dlPk}); return false;" class="btn_style03 btn_red btnMoveReg">3D</button>`
	                }
	            </td>
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
	                    ${row.dlDiv === "0" 
	                        ? `<span><button type="button" onclick="GcsDashboard.fn_waypoint2D(${row.dlPk}); return false;" class="btn_style03 btn_red btnMoveReg">2D</button></span>` 
	                        : `<span><button type="button" onclick="GcsDashboard.fn_waypoint3D(${row.dlPk}); return false;" class="btn_style03 btn_red btnMoveReg">3D</button></span>`
	                    }
	                </div>
	            </div>
	        </div>
	    `;
	}



    formatDate(dateString) {
        return dateString.split('T')[0];
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
        const isListView = view === 'list';
        $('.table').toggle(isListView);
        $('#galleryView').toggle(!isListView);

        // 버튼 배경 이미지 및 상태 토글
        const button = $('#viewSwitchToggle');
        if (isListView) {
            button.removeClass('grid-view').addClass('list-view');
        } else {
            button.removeClass('list-view').addClass('grid-view');
        }
    }

    toggleView() {
        const currentView = $('#viewSwitchToggle').hasClass('list-view') ? 'gallery' : 'list';
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

GcsDashboard.fn_waypoint3D = function (dlPk) {
    window.location.href = `/gcs/dashboard/gA03Main2.do?dlPk=${dlPk}`;
};

GcsDashboard.fn_waypoint2D = function (dlPk) {
    window.location.href = `/gcs/dashboard/gA03Main9.do?dlPk=${dlPk}`;
};

GcsDashboard.fn_waypoint33 = function (dlPk) {
    window.open(`/gcs/dashboard/gA03Main33.do?dlPk=${dlPk}`, "waypoint", "fullscreen=yes, toolbar=no, location=no, directories=no, status=no, menubar=no,scrollbars=no,resizable=no");
};

GcsDashboard.fn_del = function (dlPk) {
    if (confirm('Are you sure you want to do this?')) {
        $.ajax({
            url: '/gcs/dashboard/gA03MainDelete.do',
            type: 'post',
            data: { "dlPk": dlPk },
            async: false
        }).done((res) => {
            alert("Success");
            $(location).attr('href', '/gcs/dashboard/projectMain1001.do');
        }).fail(() => {
            alert("실패");
        });
    }
};
