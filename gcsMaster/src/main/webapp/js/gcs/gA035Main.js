class TodayWorkManager {
    constructor() {
        // 페이지가 준비되면 실행될 콜백 함수 등록
        $(document).ready(() => {
            // 메뉴 초기화 및 데이터 목록 초기화
            // 상단 메뉴 선택 기능
            this.initializeMenu(); 
            this.initDataList(); 

        });
    }

    
    initializeMenu() {
        $('.menu-item[data-tab="5"]').addClass('selected');
        $('#menu-logout').css('float', 'right');
    }

    initDataList() { 
            $('#initDataList').DataTable({ 
                data: [
                    ["Tiger Nixon", "System Architect", "Edinburgh", 61, "2011/04/25", "$320,800"],
                    ["Garrett Winters", "Accountant", "Tokyo", 63, "2011/07/25", "$170,750"],
                    ["Ashton Cox", "Junior Technical Author", "San Francisco", 66, "2009/01/12", "$86,000"],
                    ["Cedric Kelly", "Senior Javascript Developer", "Edinburgh", 22, "2012/03/29", "$433,060"],
                    ["Airi Satou", "Accountant", "Tokyo", 33, "2008/11/28", "$162,700"]
                ],
                columns: [
                    { title: "Name" },
                    { title: "Position" },
                    { title: "Office" },
                    { title: "Age" },
                    { title: "Start date" },
                    { title: "Salary" }
                ]
            });
        //this.setTodayDate("searchTwRequestDateSt", 0);
        //this.setTodayDate("searchTwRequestDateEd", 1);
        //this.userList("searchTwWorker");
        //this.setupSearchTwWorkerChange();
        //this.searchList();
    }
 
}

const todayWorkManager = new TodayWorkManager();
