/**
 * index.jsp : search page
 */
$(document).ready(function() {
	$(".button-collapse").sideNav();
	
	$("#search_clear").click(function(){
		document.getElementById("search").value="";
		$("#search").focus();
	});
	
	$("#search_keyword").click(function(){
		var keyword = $("#search").val();
		if(keyword != ""){
			$('#form-action').submit();
		}/*else{
			Materialize.toast("검색어를 입력하세요.", 1200);
		}*/
	});

	$.getJSON("http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json?key=fbfb0ceafa07f356234a048e8614c3a7&itemPerPage=10", function(movieJson){
		var movieData = new Object();		
		for(var i=0, item; item=movieJson.movieListResult.movieList[i]; i++) {
			var movieNm = item.movieNm;
			movieData[movieNm] = null;
		}
		var parsedJson = JSON.stringify(movieData);
		//console.log(parsedJson);
		
		$('input.autocomplete').autocomplete({
			data : parsedJson
//			data : {
//				'apple' : null,
//				'banana' : null,
//				'fineApple' : null
//			}
		});
	});		
	
	// the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
    $('.modal-trigger').leanModal({
    	
    });
});

function page_move(s_page, s_name){
	var f = document.frm_page;
	f.keyword.value = s_name; 
	f.pageNum.value = s_page; 
	f.submit();
}

//movielist modal
function mymodal(title, eng_title){
	$('#iframe').attr('src', 'resources/movieDetail.jsp?dtitle=' + title + '&eng_title=' + eng_title);
	$('#modal_title').text(title);
	$('#modal1').openModal();
}













