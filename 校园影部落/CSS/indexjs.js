setInterval(test,2000); 
var array=new Array(); 
var index=0; 
var array= new Array("ͼƬ�ز�/1.jpg","ͼƬ�ز�/2.jpg","ͼƬ�ز�/3.jpg","ͼƬ�ز�/4.jpg"); 
function test() 
{ var myimg=document.getElementById("imgs"); 
if(index==array.length-1) 
{ index=0; }else{ index++; } 
myimg.src=array[index]; 
} 