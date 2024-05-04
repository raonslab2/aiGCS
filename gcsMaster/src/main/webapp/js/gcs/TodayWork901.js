class TodayWorkManager {
    constructor() {
        // 페이지가 준비되면 실행될 콜백 함수 등록
        $(document).ready(() => {
            // 메뉴 초기화 및 데이터 목록 초기화
            // 상단 메뉴 선택 기능
            this.initializeMenu();

            this.setCode("PROCESS", "searchTwStatus");

            // 데이터 검색
            this.initDataList();

            // 버튼 클릭 이벤트 설정
            $("#btnList").click(() => this.goToPage("/gcs/TD0001/TodayWork901.do"));
            $("#btnWrite").click(() => this.goToPage("/gcs/TD0001/TodayWork901Write.do"));

            // 검색 버튼 클릭 이벤트 설정
            $("#searchList").on("click", () => this.searchList());

            // 페이지 번호 클릭 이벤트 설정
            $(document).on('click', '.pageClass', (event) => this.handlePageClick(event));

            // 편집 버튼 클릭 이벤트 설정
            $(document).on('click', '.editClass', (event) => this.handleEditClick(event));

            // 로그아웃 버튼 클릭 이벤트 설정
            $("#menu-logout").click(() => this.handleLogoutClick());

            // searchTwWorker select 요소의 change 이벤트 설정
            //this.setupSearchTwWorkerChange();
 
            $("#searchTwStatus").change(() => this.searchList());
            $("#searchTwWorker").change(() => this.searchList());
            $("#searchTwRequestDateSt").change(() => this.searchList());
            $("#searchTwRequestDateEd").change(() => this.searchList());
        });
    }

    // 코드 초기화 메서드
    setCode(coDiv, setDiv) { 
 
        var selectElement = $('#' + setDiv); // <select> 요소 선택
        $.ajax({
            type: 'POST',
            url: '/gcs/TD0001/selectTwCode.do',
            async: false, // 동기 방식으로 설정
            data: {
                "coDiv": coDiv
            },
            success: function (res) {
                res.list.forEach(function (row, index) {
                    // <option> 요소를 생성합니다.
                    var option = $('<option>', {
                        value: row.coCode,
                        text: row.coCodeName
                    });
                    // <select> 요소에 <option> 요소를 추가합니다.
                    selectElement.append(option);
                });
            },
            error: function (xhr, status, error) {
                alert("등록에 실패했습니다." + error);
            }
        });
    }

    setupSearchTwWorkerChange() {
        $("#searchTwWorker").change(() => {
            // searchTwWorker가 변경되면 검색을 다시 수행합니다.
            this.searchList();
        });
    }

    initializeMenu() {
        $('.menu-item[data-tab="1"]').addClass('selected');
        $('#menu-logout').css('float', 'right');
    }

    initDataList() {
        this.setTodayDate("searchTwRequestDateSt", 0);
        this.setTodayDate("searchTwRequestDateEd", 1);
        this.userList("searchTwWorker");
        this.setupSearchTwWorkerChange();
        this.searchList();
    }

    goToPage(pageUrl) {
        window.location.href = pageUrl;
    }

    formatDate(inputDate) {
        const date = new Date(inputDate);
        const year = date.getFullYear().toString().slice(2);
        const month = ('0' + (date.getMonth() + 1)).slice(-2);
        const day = ('0' + date.getDate()).slice(-2);
        const hours = ('0' + date.getHours()).slice(-2);
        const minutes = ('0' + date.getMinutes()).slice(-2);
        return `${year}-${month}-${day} ${hours}:${minutes}`;
    }

    userList(tmUserId) {
        $.ajax({
            url: '/gcs/TD0001/userList.do',
            type: 'post',
            async: false, // 동기 방식으로 설정
            data: { "userId": tmUserId }
        }).done((res) => {
            const selectElement = $(`#${tmUserId}`);
            selectElement.empty().append($('<option>', { value: 'ALL', text: 'ALL' }));
            res.list.forEach((row) => {
                const option = $('<option>', { value: row.userId, text: row.grMName });
                if (row.userId === res.userId) {
                    option.attr('selected', 'selected');
                }
                selectElement.append(option);
            });
        }).fail(() => {
            alert("Failed to fetch user list.");
        });
    }

    searchList() {
        const form = $('#searchForm').serialize();
        $.ajax({
            url: '/gcs/TD0001/selectTodayWork901List.do',
            type: 'post',
            data: form
        }).done((res) => {
            $('#resultList').empty();
            $('.pagination').empty();
            $('.subTr').remove();
            if (res.totalCnt == '0') {
                $('#resultList').append("<tr class='subTr'><td colspan='11' style='height:100px;text-align:center;'>No data available.</td></tr>");
                $('.pagination').append(this.paginationView(res.paginationInfo));
                $(`.${res.paginationInfo.currentPageNo}`).addClass("active");
                $('.pagination > li').css('cursor', 'pointer');
            } else {
                res.list.forEach((row) => {
                    $('#resultList').append(this.pageView(row));
                });
                $('.pagination').append(this.paginationView(res.paginationInfo));
                $(`.${res.paginationInfo.currentPageNo}`).addClass("active");
                $('.pagination > li').css('cursor', 'pointer');
            }
        }).fail(() => {
            alert("Failed to fetch data.");
        });
    }

    paginationView(page) {
        let data = "";
        data +=
            `<li class="first"><a class="pageClass" data-page="${page.firstPageNo}" title="첫 페이지 바로가기"><img src="/images/bbs_prev02.gif" alt="첫 페이지" style="margin: 10px;"></a></li>` +
            `<li class="prev"><a class="pageClass" data-page="${page.currentPageNo - 1}" title="이전 페이지(1page) 바로가기"><img src="/images/bbs_prev01.gif" alt="이전 페이지" style="margin: 10px;"></a></li>`;

        for (let i = page.firstPageNoOnPageList; i <= page.lastPageNoOnPageList; i++) {
            data += `<li class=${i}><a class="pageClass" data-page="${i}" title="${i}페이지 바로가기">${i}</a></li>`;
        }

        data +=
            `<li class="next"><a class="pageClass" data-total_page_count="${page.totalPageCount}" data-page="${page.currentPageNo + 1}" title="다음 페이지(11page) 바로가기"><img src="/images/bbs_next01.gif" alt="다음 페이지" style="margin: 10px;"></a></li>` +
            `<li class="last"><a class="pageClass" data-page="${page.lastPageNo}" title="끝 페이지(67page) 바로가기"><img src="/images/bbs_next02.gif" alt="마지막 페이지" style="margin: 10px;"></a></li>`;
        return data;
    }

    setTodayDate(stStr, tmDay) {
        const today = new Date();
        if (tmDay !== 0 && tmDay !== undefined) {
            today.setDate(today.getDate() + tmDay);
        }
        const yyyy = today.getFullYear();
        const mm = String(today.getMonth() + 1).padStart(2, '0');
        const dd = String(today.getDate()).padStart(2, '0');
        const formattedDate = `${yyyy}-${mm}-${dd}`;
        $(`#${stStr}`).val(formattedDate);
    }

    handlePageClick(event) {
        const page = $(event.target).data('page');
        const totalPageCnt = $(event.target).data('total_page_count');
        if (page > totalPageCnt || page === 0) {
            return false;
        }
        $("#page").val(page);
        this.searchList();
    }

    handleEditClick(event) {
        const twPk = $(event.target).closest('.editClass').data('pk');
        if (twPk !== undefined) {
            this.goToPage(`/gcs/TD0001/TodayWork901Write.do?twPk=${twPk}`);
        } else {
            alert("편집할 항목을 찾을 수 없습니다.");
        }
    }

    handleLogoutClick() {
        alert("로그아웃되었습니다!");
    }

    handleDateChange() {
        // searchTwRequestDateSt, searchTwRequestDateEd가 변경되면 검색을 다시 수행합니다.
        this.searchList();
    }

    pageView(row) {
        const twWorker = row.twWorker;
        let data = `
            <tr class="trDataList editClass" data-pk="${row.twPk}">
                <td class="center">${row.twPk}</td>
                <td class="center"><span class="btnRound">${row.twStatusName}</span></td>
                <td class="center">${row.twCategory1}</td>
                <td class="center"><b>${row.twSubject}</b></td>
                <td class="center">${row.twRequester}</td>
                <td class="center">${twWorker}</td>
                <td class="center">${this.formatDate(row.twUpdatetime)}</td>
            </tr>`;
        return data;
    }
}

const todayWorkManager = new TodayWorkManager();
