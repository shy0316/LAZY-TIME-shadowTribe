setInterval(test,2000); 
var array=new Array(); 
var index=0; 
var array= new Array("Í¼Æ¬ËØ²Ä/1.jpg","Í¼Æ¬ËØ²Ä/2.jpg","Í¼Æ¬ËØ²Ä/3.jpg","Í¼Æ¬ËØ²Ä/4.jpg"); 
function test() 
{ var myimg=document.getElementById("imgs"); 
if(index==array.length-1) 
{ index=0; }else{ index++; } 
myimg.src=array[index]; 
} 