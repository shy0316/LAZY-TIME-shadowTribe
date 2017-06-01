 startList=function(){          
	 if(document.all&&document.getElementById){   
  	     navroot=document.getElementById("nav");   
     for(i=0;i<navroot.childNodes.length;i++){
       node=navroot.childNodes[i];
       if(node.Name=="LI"){            
	   node.onmouseover=function(){    
	   this.className+="over";         
	   }	   
	    node.onmouseout=function(){
		this.className=this.className.replace("over"."");
         
       }
     }
   }
}
windows.onload=startList;   