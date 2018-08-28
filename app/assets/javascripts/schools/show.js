function init_school_show() {
    $.ajax({
        url: "/schools/show_data?id="+$('#jpt_div').attr('data-id'),
        success:function(response){
            init_jpt(JSON.parse(response.jpt_results));
            //init_eju(JSON.parse(response.eju_results));
            init_graduate(JSON.parse(response.graduate_results));
            init_course(JSON.parse(response.courses));
            init_students(JSON.parse(response.students));
            init_chart();
        },
        error:function(response){
            console.log("get show data error");
        },
        complete:function(response){
        }
    });
}

function init_students(students) {
    var content = '<div style="text-align: center"><i class="fa fa-square space-name color-green"><span>　学生来源</span></i></div>';
    content = content + '<table class="table table-bordered">';

    var total = 0;
    var temp_content = '<tr>';
    content = content + '<tr>';
    $.each(students,function(j,student){
        if(j%8==0&&j!=0){
            content = content + '</tr>';
            temp_content = temp_content + '</tr>';
            content = content + temp_content;
            content = content + '<tr>';
            temp_content = '<tr>';
        }
        content = content + '<td style="text-align: center">'+student.from+'</td>';
        temp_content = temp_content + '<td style="text-align: center">'+student.num+'</td>';
        total = total + student.num
    });
    content = content + '<td style="text-align: center">合计</td>';
    content = content + '</tr>';
    temp_content = temp_content + '<td style="text-align: center">'+total+'</td>';
    content = content + temp_content;
    content = content + '</tr></table>';
    $('#student_div').html(content);
}

function init_course(courses) {
    var content = '<div style="text-align: center"><i class="fa fa-square space-name color-green"><span>　课程情报</span></i></div>';
    content = content + '<table class="table table-bordered"><tr>\n' +
        '<th rowspan="2" style="text-align: center">课程名称</th>\n' +
        '<th rowspan="2" style="text-align: center">课程目的</th>\n' +
        '<th rowspan="2" style="text-align: center">修业时间</th>\n' +
        '<th rowspan="2" style="text-align: center">授课时数</th>\n' +
        '<th rowspan="2" style="text-align: center">授课周数</th>\n' +
        '<th rowspan="2" style="text-align: center">入学月份</th>\n' +
        '<th style="text-align: center" colspan="5">费用</th>\n' +
        '</tr><tr>\n' +
        '<th style="text-align: center">报名费</th>\n' +
        '<th style="text-align: center">入学金</th>\n' +
        '<th style="text-align: center">学费</th>\n' +
        '<th style="text-align: center">其他</th>\n' +
        '<th style="text-align: center">合计</th>\n' +
        '</tr>';
    $.each(courses,function(j,course){
        content = content + '<tr>\n' +
            '<td style="text-align: center">'+course.name+'</td>\n' +
            '<td style="text-align: center">'+course.purpose+'</td>\n' +
            '<td style="text-align: center">'+course.length+'</td>\n' +
            '<td style="text-align: center">'+course.hours+'</td>\n' +
            '<td style="text-align: center">'+course.weeks+'</td>\n' +
            '<td style="text-align: center">'+course.admission+'</td>\n' +
            '<td style="text-align: center">'+course.selection_fee+'</td>\n' +
            '<td style="text-align: center">'+course.admission_fee+'</td>\n' +
            '<td style="text-align: center">'+course.tuition+'</td>\n' +
            '<td style="text-align: center">'+course.other_fee+'</td>\n' +
            '<td style="text-align: center">'+(course.selection_fee+course.admission_fee+course.tuition+course.other_fee)+'</td>\n' +
            '</tr>';
    });
    content = content + '</table>';
    $('#course_div').html(content);
}

function init_graduate(graduate_results) {
  var content = '<div style="text-align: center"><i class="fa fa-dot-circle-o space-name color-blue"><span>　升学成绩</span></i></div>';
  content = content + '<table class="table table-bordered">'+
      '<tr>\n' +
      '<th style="text-align: center">日期</th>\n' +
      '<th style="text-align: center">毕业人数</th>\n' +
      '<th style="text-align: center">大学院</th>\n' +
      '<th style="text-align: center">大学</th>\n' +
      '<th style="text-align: center">短期大学</th>\n' +
      '<th style="text-align: center">高等専門学校</th>\n' +
      '<th style="text-align: center">専修学校</th>\n' +
      '<th style="text-align: center">各種学校</th>\n' +
      '<th style="text-align: center">その他</th>\n' +
      '</tr>';
  $.each(graduate_results,function(j,graduate_result){
      content = content + '<tr>\n' +
      '<td style="text-align: center">'+graduate_result.date+'</td>\n' +
      '<td style="text-align: center">'+graduate_result.graduate_num+'</td>\n' +
      '<td style="text-align: center">'+graduate_result.graduate_school+'</td>\n' +
      '<td style="text-align: center">'+graduate_result.university+'</td>\n' +
      '<td style="text-align: center">'+graduate_result.junior_college+'</td>\n' +
      '<td style="text-align: center">'+graduate_result.technical_school+'</td>\n' +
      '<td style="text-align: center">'+graduate_result.special_training+'</td>\n' +
      '<td style="text-align: center">'+graduate_result.traning_school+'</td>\n' +
      '<td style="text-align: center">'+graduate_result.other+'</td>\n' +
      '</tr>'
  });
  content = content + '</table>';
  $('#graduate_div').html(content);
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

function init_jpt(jpt_results) {
  var num,total;
  var date = '';
      if(jpt_results && jpt_results[0] && jpt_results[0].date){
          date = jpt_results[0].date.substring(0,4);
      }
  var content = '<div style="text-align: center"><i class="fa fa-dot-circle-o space-name color-blue"><span>　'+date+'年度　日本語能力試験 受験状況（第1回、第2回試験合計）</span></i></div>';
  content = content + '<table class="table table-bordered">';
  content = content + '<tr>\n' +
        '        <th></th>\n' +
        '        <th style="text-align: center">N1</th>\n' +
        '        <th style="text-align: center">N2</th>\n' +
        '        <th style="text-align: center">N3</th>\n' +
        '        <th style="text-align: center">N4</th>\n' +
        '        <th style="text-align: center">N5</th>\n' +
        '        <th style="text-align: center">合计</th>\n' +
        '        </tr>';

  content = content + '<tr><th style="text-align: center">参加人数</th>';
  total = 0;
  for (var i=5;i>0;i--) {
      num = 0;
      $.each(jpt_results,function(j,jpt_result){
          if(jpt_result.level * 1 === i){
              num = jpt_result.examinees
          }
      });
      total = total + num;
      content = content + '<td style="text-align: center">'+num+'</td>'
  }
  content = content + '<td style="text-align: center">'+total+'</td></tr>';

  total = 0;
  content = content + '<tr><th style="text-align: center">合格人数</th>';
  for (var i=5;i>0;i--) {
      num = 0;
      $.each(jpt_results,function(j,jpt_result){
          if(jpt_result.level * 1 === i){
              num = jpt_result.certified
          }
      });
      total = total + num;
      content = content + '<td style="text-align: center">'+num+'</td>'
  }
  content = content + '<td style="text-align: center">'+total+'</td></tr></table>';
  $('#jpt_div').html(content);
}

function init_map() {
    var latitude = $('#jpt_div').attr('data-la') * 1.0,longitude = $('#jpt_div').attr('data-lo') * 1.0;
    var uluru = {lat: latitude, lng: longitude};
    var map = new google.maps.Map(document.getElementById('google_map'), {
        zoom: 15,
        center: uluru
    });
    var marker = new google.maps.Marker({
        position: uluru,
        map: map
    });
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
          'rgba(255, 99, 132, 0.5)',
          'rgba(54, 162, 235, 0.5)',
          'rgba(255, 206, 86, 0.5)',
          'rgba(75, 192, 192, 0.5)',
          'rgba(153, 102, 255, 0.5)',
          'rgba(255, 159, 64, 0.5)'
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
      scales: {
        xAxes: [{
          ticks: {
            beginAtZero:true,
            suggestedMax: 5
          }
        }]
      }
    }
  });

}
