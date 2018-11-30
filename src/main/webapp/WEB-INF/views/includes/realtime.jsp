<%@ page contentType="text/html; charset=utf-8" %>

<!-- 
/**
 * 실시간 주식순위를 위한 파일
 */

 -->

<style type="text/css">
* {margin:0;padding:0;}
#scroll {height:20px;}


/* <h6>KOSPI <span style="color:red">+0.42%</span> &nbsp; &nbsp; KOSDAQ <span style="color:blue">-0.12%</span></h6> */

</style>
<script type="text/javascript">
function textScroll(scroll_el_id) {
    this.objElement = document.getElementById(scroll_el_id);
    this.objElement.style.position = 'relative';
    this.objElement.style.overflow = 'hidden';

    this.objLi = this.objElement.getElementsByTagName('li');
    this.height = this.objElement.offsetHeight; // li 엘리먼트가 움직이는 높이(외부에서 변경가능)
    this.num = this.objLi.length; // li 엘리먼트의 총 갯수
    this.totalHeight = this.height*this.num; // 총 높이
    this.scrollspeed = 2; // 스크롤되는 px
    this.objTop = new Array(); // 각 li의 top 위치를 저장
    this.timer = null;
    
    for(var i=0; i<this.num; i++){
        this.objLi[i].style.position = 'absolute';
        this.objTop[i] = this.height*i;
        this.objLi[i].style.top = this.objTop[i]+"px";
        this.objLi[i].style.right = 0;
    }
}

textScroll.prototype.move = function(){
    for(var i=0; i<this.num; i++) {
        this.objTop[i] = this.objTop[i] - this.scrollspeed;
        this.objLi[i].style.top = this.objTop[i]+"px";
    }
    if(this.objTop[0]%this.height == 0){
        this.jump();
    }else{
        clearTimeout(this.timer);
        this.timer = setTimeout(this.name+".move()",50);
    }
}

textScroll.prototype.jump = function(){
    for(var i=0; i<this.num; i++){
        if(this.objTop[i] == this.height*(-2)){
            this.objTop[i] = this.objTop[i] + this.totalHeight;
            this.objLi[i].style.top = this.objTop[i]+"px";
        }
    }
    clearTimeout(this.timer);
    this.timer = setTimeout(this.name+".move()",3000);
}

textScroll.prototype.start = function() {
    this.timer = setTimeout(this.name+".move()",3000);
}
</script>


<!-- li 엘리먼트들이 position:absolute 되므로 ul 엘리먼트에는 height 값이 있어야 합니다 --> 
<ul id="scroll">
    <li><a href="">1 &nbsp; &nbsp; 삼성전자</a></li>
    <li><a href="">2 &nbsp; &nbsp; SK하이닉스</a></li>
    <li><a href="">3 &nbsp; &nbsp; 하나금융지주</a></li>
    <li><a href="">4 &nbsp; &nbsp; 대한항공</a></li>
    <li><a href="">5 &nbsp; &nbsp; KOSTA</a></li>
    <li><a href="">6 &nbsp; &nbsp; 우리집</a></li>
    <li><a href="">7 &nbsp; &nbsp; 윤형철</a></li>
    <li><a href="">8 &nbsp; &nbsp; 유예겸</a></li>
    <li><a href="">9 &nbsp; &nbsp; 남수현</a></li>
    <li><a href="">10 &nbsp; &nbsp; 우호진</a></li>
</ul>

<script type="text/javascript">
var real_search_keyword = new textScroll('scroll'); // 스크롤링 하고자하는 ul 엘리먼트의 id값을 인자로 넣습니다
real_search_keyword.name = "real_search_keyword"; // 인스턴스 네임을 등록합니다
real_search_keyword.start(); // 스크롤링 시작
</script>



