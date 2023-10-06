<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>

<!-- summernote css/js -->
<script src="/js/summernote/summernote-lite.js"></script>
<script src="/js/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="/css/summernote/summernote-lite.css">

<div class="container">
	<div class="py-5 text-center">
		<h1>글작성 페이지</h1>
	</div>
	
	<form action="/blog/${principal.userId}/board/write" method="post">
	<input type="hidden" name="userId" value="${principal.id}">
	  <div class="form-group">
	    <label for="boardTitle">제목</label>
	    <input type="text" id="boardTitle" name="boardTitle" class="form-control" placeholder="글 제목을 입력하세요.">
	  </div>
	  <div class="form-group">
	    <label for="boardCategory">카테고리</label>
	    <select id="boardCategory" name="boardCategory">
		    <c:choose>
		    	<c:when test="${empty categoryList}">
			    	<option value="">---</option>
		    	</c:when>
		    	<c:otherwise>
		    		<c:forEach var="category" items="${categoryList}">
					    <option value="${category.categoryName}">${category.categoryName}</option>
		    		</c:forEach>
		    	</c:otherwise>
		    </c:choose>
	    </select>
	  </div>
	  <div class="form-group">
	  	<div class="input-group">
		    <div class="input-group-text">
	    	  <label>공개<input type="radio" name="boardPublic" value="1" checked="checked"></label>
	    	  <label>비공개<input type="radio" name="boardPublic" value="0"></label>
		    </div>
		</div>
		
		<!-- <div class="input-group mb-3">
		  <div class="input-group-prepend">
		    	<label for="boardPublic">비공개 설정</label>
		    	<input type="checkbox" id="boardPublic" name="boardPublic" onchange="YnCheck(this)" value="1">
		    </div>
		</div> -->
	  </div>
	  
	  
	  <!-- 섬네일 start -->
	  <div class="form-group">
	  	<input name="uploadFiles" type="file" multiple>
	  	<button class="uploadBtn">업로드</button>
	  </div>
	  <div class="uploadResult">
	  </div>
	  <!-- 섬네일 end -->
	  
	  <textarea id="summernote" name="boardContent" placeholder="글 내용을 입력하세요."></textarea>
	  <button type="submit" class="btn btn-primary">게시글 등록</button>
	  <button type="button" class="btn btn-secondary" onclick="history.back()">취소</button>
	</form>

</div>

<script>
$('#summernote').summernote({
	  // 에디터 높이
	  height: 500,
	  // 에디터 한글 설정
	  lang: "ko-KR",
	  // 에디터 로딩 후 포커스 설정
	  focus : true,
	  toolbar: [
		    // 글꼴 설정
		    ['fontname', ['fontname']],
		    // 글자 크기 설정
		    ['fontsize', ['fontsize']],
		    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
		    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
		    // 글자색
		    ['color', ['forecolor','color']],
		    // 표만들기
		    ['table', ['table']],
		    // 글머리 기호, 번호매기기, 문단정렬
		    ['para', ['ul', 'ol', 'paragraph']],
		    // 줄간격
		    ['height', ['height']],
		    // 그림첨부, 링크만들기, 동영상첨부
		    ['insert',['picture','link','video']],
		    // 코드보기, 확대해서보기, 도움말
		    ['view', ['codeview','fullscreen', 'help']]
		  ],
		  // 추가한 글꼴
		fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
		 // 추가한 폰트사이즈
		fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
	});
</script>


<script>
	function show_uploaded_images(arr) {
	    console.log(arr);
	    var divArea = $(".uploadResult");
	    for (var i = 0; i < arr.length; i++) {
	        // console.log(arr[i].thumbnailURL);
	        divArea.append("<img src = '/display?fileName=" + arr[i].thumbnailURL + "'>");
	    }
	}
	
	$('.uploadBtn').click(function () {
	    var formData = new FormData();
	    var inputFile = $("input[type = 'file']");
	    var files = inputFile[0].files;
	
	    for (var i = 0; i < files.length; i++) {
	        console.log(files[i]);
	        formData.append("uploadFiles", files[i]);
	
	    }
	    formData.append("w", width);
	    formData.append("h", height);
	    formData.append("type", "board");
	    console.log(formData)
	    
	    // 실제 업로드 부분
	    // upload ajax
	    $.ajax({
	        url: '/uploadAjax',
	        processData: false,
	        contentType: false,
	        data: formData,
	        type: 'POST',
	        dataType: 'json',
	        success: function (result) {
	            show_uploaded_images(result.uploadResultDTOList);
	
	            console.log(result.originalURL);
	            console.log(result.thumbnailURL);
	        },
	        error: function (jqXHR, textStatus, errorThrown) {
	            console.log(textStatus);
	        }
	    }); //$.ajax
	})

</script>

<!-- <script type="text/javascript">
	function YnCheck(obj) {
		var checked = obj.checked;
		if (checked) {
			obj.value = "0";
		} else {
			obj.value = "1";
		}
	};
</script> -->

<%@ include file="/WEB-INF/view/layout/footer.jsp"%>