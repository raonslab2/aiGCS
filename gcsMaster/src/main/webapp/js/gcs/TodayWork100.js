$(document).ready(function() {
    // 일일 RPA 처리량 데이터
    var dailyData = {
        labels: ['9:00', '10:00', '11:00', '12:00', '13:00', '14:00', '15:00'],
        datasets: [{
            label: '일일 RPA 처리량',
            data: [10, 25, 15, 18, 10, 22, 25], // 각 시간대의 처리량
            backgroundColor: 'rgba(255, 99, 132, 0.2)',
            borderColor: 'rgba(255, 99, 132, 1)',
            borderWidth: 1
        }]
    };

    // 주간 RPA 처리량 데이터
    var weeklyData = {
        labels: ['월', '화', '수', '목', '금', '토', '일'],
        datasets: [{
            label: '주간 RPA 처리량',
            data: [80, 140, 90, 110, 120, 80, 140], // 각 요일의 처리량
            backgroundColor: 'rgba(54, 162, 235, 0.2)',
            borderColor: 'rgba(54, 162, 235, 1)',
            borderWidth: 1
        }]
    };

    // 월간 RPA 처리량 데이터
    var monthlyData = {
        labels: ['1주', '2주', '3주', '4주'],
        datasets: [{
            label: '월간 RPA 처리량',
            data: [440, 380, 410, 320], // 각 주차의 처리량
            backgroundColor: 'rgba(255, 206, 86, 0.2)',
            borderColor: 'rgba(255, 206, 86, 1)',
            borderWidth: 1
        }]
    };

    // 연간 RPA 처리량 데이터
    var yearlyData = {
        labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        datasets: [{
            label: '연간 RPA 처리량',
            data: [1000, 1100, 1200, 1300, 1400, 1500, 1000, 1700, 500, 1900, 2000, 1600], // 각 월의 처리량
            backgroundColor: 'rgba(75, 192, 192, 0.2)',
            borderColor: 'rgba(75, 192, 192, 1)',
            borderWidth: 1
        }]
    };

    // 차트 생성
    var dailyChartCanvas = document.getElementById('dailyChart').getContext('2d');
    var dailyChart = new Chart(dailyChartCanvas, {
        type: 'bar',
        data: dailyData,
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        }
    });

    var weeklyChartCanvas = document.getElementById('weeklyChart').getContext('2d');
    var weeklyChart = new Chart(weeklyChartCanvas, {
        type: 'line',
        data: weeklyData,
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        }
    });

    var monthlyChartCanvas = document.getElementById('monthlyChart').getContext('2d');
    var monthlyChart = new Chart(monthlyChartCanvas, {
        type: 'bar',
        data: monthlyData,
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        }
    });

    var yearlyChartCanvas = document.getElementById('yearlyChart').getContext('2d');
    var yearlyChart = new Chart(yearlyChartCanvas, {
        type: 'line',
        data: yearlyData,
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        }
    });
});
