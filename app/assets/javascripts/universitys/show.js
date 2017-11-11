var chart;

function init_university_show() {
    var init_data = $('.btn-uni-show').attr('data');
    refresh_chart(JSON.parse(init_data));

    $(document).on("click", ".btn-uni-show", function(){
        chart.destroy();
        var data = JSON.parse($(this).attr('data'));
        refresh_chart(data);
        var a = $("#detial_div").offset().top;
        $("html,body").animate({scrollTop:a}, 'fast');
    });
}

function refresh_chart(data) {
    $("#detail_title").html("学部详情: "+data.total_name);
    var average = data.average;
    var median = data.median;
    var average_score = (average * 1.0)/800;
    var median_score = (median * 1.0)/800;

    $('#average_span').html(parseFloat(average).toFixed(0));
    $('#median_span').html(parseFloat(median).toFixed(0));
    $('#highest_span').html(parseFloat(data.highest).toFixed(0));
    $('#lowest_span').html(parseFloat(data.lowest).toFixed(0));

    var ctx = document.getElementById('myChart').getContext('2d');
    chart = new Chart(ctx, {
        type: 'radar',
        data: {
            labels: ['平均分', '中位分', '热度', '难度', '录取率'],
            datasets: [{
                backgroundColor: 'rgba(75, 192, 192, 0.2)',
                borderColor: 'rgba(75, 192, 192, 1)',
                pointBorderColor: 'rgba(75, 192, 192, 1)',
                pointBackgroundColor: 'rgba(75, 192, 192, 1)',
                data: [average_score * 100, median_score * 100, data.heat * 100, data.difficulty * 100, data.acceptance_rate * 100]
            }]
        },
        options: {
            scale: {
                ticks: {
                    suggestedMin: 0,
                    suggestedMax: 100
                }
            },
            legend: {
                display: false,
                labels: {
                    fontColor: 'rgb(255, 99, 132)'
                }
            }
        }
    });

}
