function init_university_index() {
    $(document).on("click", "#bt_search", function(){
        refresh_university_index_data();
    });
    refresh_university_index_data();
}

function refresh_university_index_data() {
    var text = 'all';
    if($("#search_text").val()){
        text = $("#search_text").val();
    }
    var type = $("#search_select").find("option:selected").val();
    $.ajax({
        url: "universitys/index_data?text="+text+"&type="+type,
        success:function(response){
            init_cards(JSON.parse(response.data),type)
        },
        error:function(response){
            console.log("get university data error");
        },
        complete:function(response){
        }
    });
}

function init_cards(data,type) {
    var content='';
    $.each(data,function(i,item){
        content = content + '<div class="card text-center" style="min-width: 15%;margin: 10px">\n' +
            '  <div class="card-body">\n' +
            '    <a href="/universitys/'+item.id+'?type='+type+'" class="card-title" ' +
            'style="text-decoration: none;cursor: pointer">'+item.name+'</a>\n' +
            '  </div>\n' +
            '</div>';
    });
    $('#card_container').html(content);
}