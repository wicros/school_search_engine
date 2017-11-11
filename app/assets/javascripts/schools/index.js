function init_school_home() {
    $(document).on("click", "#bt_search", function(){
        refresh_school_data();
    });
    refresh_school_data();
}

function refresh_school_data() {
    var text = $('#search_text').val();
    var prefecture = $("#search_select").find("option:selected").val();

    $.ajax({
        url: "schools/index_data?text="+text+"&prefecture="+prefecture,
        success:function(response){
            init_cards(JSON.parse(response.school_data))
        },
        error:function(response){
            console.log("get home school error");
        },
        complete:function(response){
        }
    });
}

function init_cards(school_data) {
    var content='';
    $.each(school_data,function(i,school_item){
         content = content + '<div class="card text-center" style="min-width: 25%;max-width: 30%">\n' +
                             '  <img class="school-image card-img-top" src="http://18.179.9.62/'+school_item.img_url+'" alt="school image">\n' +
                             '  <div class="card-body">\n' +
                             '    <h4 class="card-title">'+school_item.name+'</h4>\n' +
                             '    <p class="card-text">'+school_item.description+'</p>\n' +
                             '    <a href="/schools/'+school_item.id+'" class="btn btn-primary" ' +
                                  'style="text-decoration: none;color: #fff;cursor: pointer">学校详情</a>\n' +
                             '  </div>\n' +
                             '</div>';
    });
    $('#card_container').html(content);
}