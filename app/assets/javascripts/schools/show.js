function init_school_show() {
  init_chart();
}

function init_eju(eju_results) {
    var content = '<div style="text-align: center"><i class="fa fa-dot-circle-o space-name color-blue"><span>　日本留学試験(EJU) 受験状況</span></i></div>';
    content = content + '<table class="table table-bordered">';
    content = content + '<tr>\n' +
        '<td colspan="2" style="text-align: center"></td>\n' +
        '<td colspan="2" style="text-align: center">日语</td>\n' +
        '<td colspan="2" style="text-align: center">文系</td>\n' +
        '<td colspan="2" style="text-align: center">理系</td>\n' +
        '</tr>';
    content = content + '<tr>\n' +
        '<td colspan="2" style="text-align: center">日期</td>\n' +
        '<td style="text-align: center">参加人数</td>\n' +
        '<td style="text-align: center">219分以上</td>\n' +
        '<td style="text-align: center">参加人数</td>\n' +
        '<td style="text-align: center">100分以上</td>\n' +
        '<td style="text-align: center">参加人数</td>\n' +
        '<td style="text-align: center">100分以上</td>\n' +
        '</tr>';
    var nihongo,bunka,rika;
    $.each(eju_results,function(j,eju_result){

        if(eju_result.exam_type === 3){
            nihongo = eju_result;
        }else if(eju_result.exam_type === 4){
            bunka = eju_result;
        }else{
            rika = eju_result;
        }

        if(nihongo && bunka && rika){
            content = content + '<tr>\n' +
                '<td colspan="2" style="text-align: center">'+eju_result.date+'</td>\n' +
                '<td style="text-align: center">'+nihongo.examinees+'</td>\n' +
                '<td style="text-align: center">'+nihongo.certified+'</td>\n' +
                '<td style="text-align: center">'+bunka.examinees+'</td>\n' +
                '<td style="text-align: center">'+bunka.certified+'</td>\n' +
                '<td style="text-align: center">'+rika.examinees+'</td>\n' +
                '<td style="text-align: center">'+rika.certified+'</td>\n' +
                '</tr>';
            nihongo = null,bunka = null,rika = null;
        }

    });
    content = content + '</table>';
    $('#eju_div').html(content);
}


function init_map() {
    var latitude = $('#google_map').attr('data-la') * 1.0,longitude = $('#google_map').attr('data-lo') * 1.0;
    var uluru = {lat: latitude, lng: longitude};
    var map = new google.maps.Map(document.getElementById('google_map'), {
        zoom: 15,
        center: uluru
    });
    var marker = new google.maps.Marker({
        position: uluru,
        map: map
    });
  init_chart();
}

function init_chart() {
  var location_score =  $('#commentChart').attr('data-location-score');
  var environment_score =  $('#commentChart').attr('data-environment-score');
  var service_score =  $('#commentChart').attr('data-service-score');
  var progression_score =  $('#commentChart').attr('data-progression-score');
  var teaching_score =  $('#commentChart').attr('data-teaching-score');
  var fee_score =  $('#commentChart').attr('data-fee-score');

  var ctx = document.getElementById('commentChart').getContext('2d');
  chart = new Chart(ctx, {
    type: 'horizontalBar',
    data: {
      labels: ['地理位置', '教学环境', '学校服务', '升学情况', '教学质量', '学费费用'],
      datasets: [{
        label: '分数',
        backgroundColor: [
          'rgba(255, 99, 132, 1)',
          'rgba(54, 162, 235, 1)',
          'rgba(255, 206, 86, 1)',
          'rgba(75, 192, 192, 1)',
          'rgba(153, 102, 255, 1)',
          'rgba(255, 159, 64, 1)'
        ],
        borderColor: [
          'rgba(255,99,132,1)',
          'rgba(54, 162, 235, 1)',
          'rgba(255, 206, 86, 1)',
          'rgba(75, 192, 192, 1)',
          'rgba(153, 102, 255, 1)',
          'rgba(255, 159, 64, 1)'
        ],
        borderWidth: 0,
        data: [location_score, environment_score, service_score, progression_score, teaching_score, fee_score]
      }]
    },
    options: {
      legend: {
        display: false
      },
      scales: {
        xAxes: [{
          ticks: {
            beginAtZero:true,
            suggestedMax: 5
          }
        }],
        yAxes: [{ barThickness: 10 }]
      }
    }
  });

}
