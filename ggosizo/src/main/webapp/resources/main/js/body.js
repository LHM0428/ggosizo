
/* When the user clicks on the button, 
		toggle between hiding and showing the dropdown content */
/*var c;
		function myFunction(check) {
			c=check;
			if(check==1){
				document.getElementById("myDropdown1").classList.add("show");
				document.getElementById("myDropdown2").classList.remove("show");
				document.getElementById("myDropdown3").classList.remove("show");
				document.getElementById("myDropdown4").classList.remove("show");
			}else if(check==2){
				document.getElementById("myDropdown1").classList.remove("show");
				document.getElementById("myDropdown2").classList.add("show");
				document.getElementById("myDropdown3").classList.remove("show");
				document.getElementById("myDropdown4").classList.remove("show");
			}else if(check==3){
				document.getElementById("myDropdown1").classList.remove("show");
				document.getElementById("myDropdown2").classList.remove("show");
				document.getElementById("myDropdown3").classList.add("show");
				document.getElementById("myDropdown4").classList.remove("show");
			}else if(check==4){
				document.getElementById("myDropdown1").classList.remove("show");
				document.getElementById("myDropdown2").classList.remove("show");
				document.getElementById("myDropdown3").classList.remove("show");
				document.getElementById("myDropdown4").classList.add("show");
			}else{
				c=null;
			}
		}
	
		// Close the dropdown menu if the user clicks outside of it
		$(document).ready(function(){
			$('#dropdownmenu').click(function(event){
				alert(event.currentTarget===this);
			});
		});
		document.getElementById("dropdownmenu").onclick = function(event) {
		  if (!(event.target.id == ('dropbtn'+c))) {
		    var dropdowns = document.getElementsByClassName("dropdown-content"+c);
		    var i;
		    for (i = 0; i < dropdowns.length; i++) {
		      var openDropdown = dropdowns[i];
		      if (openDropdown.classList.contains('show')) {
		        openDropdown.classList.remove('show');
		      }
		    }
		  }
		}
		  else if (!event.target.matches('.dropbtn2')) {
				
			    var dropdowns = document.getElementsByClassName("dropdown-content2");
			    var i;
			    for (i = 0; i < dropdowns.length; i++) {
			      var openDropdown = dropdowns[i];
			      if (openDropdown.classList.contains('show')) {
			        openDropdown.classList.remove('show');
			      }
			    }
		  }else if (!event.target.matches('.dropbtn3')) {
					
				var dropdowns = document.getElementsByClassName("dropdown-content3");
				var i;
				for (i = 0; i < dropdowns.length; i++) {
				  var openDropdown = dropdowns[i];
				  if (openDropdown.classList.contains('show')) {
				    openDropdown.classList.remove('show');
				  }
				}
		  }else if (!event.target.matches('.dropbtn4')) {
				
				var dropdowns = document.getElementsByClassName("dropdown-content4");
				var i;
				for (i = 0; i < dropdowns.length; i++) {
				  var openDropdown = dropdowns[i];
				  if (openDropdown.classList.contains('show')) {
				    openDropdown.classList.remove('show');
				  }
				}
		  }
		  
		  }

		
		//-------------------------------------------------슬라이드이미지 기능
		var slideIndex = 1;
		//showSlides(slideIndex);
		currentSlide(1);
	function plusSlides(n) {
	  showSlides(slideIndex += n);
	}
	
	function currentSlide(n) {
	  showSlides(slideIndex = n);
	}
	
	function showSlides(n) {
	  var i;
	  var slides = document.getElementsByClassName("mySlides");
	  var dots = document.getElementsByClassName("dot");
	  if (n > slides.length) {slideIndex = 1}    
	  if (n < 1) {slideIndex = slides.length} ;
	  for (i = 0; i < slides.length; i++) {
	      slides[i].style.display = "none";  
	  }
	  for (i = 0; i < dots.length; i++) {
	      dots[i].className = dots[i].className.replace(" active", "");
	  }
	  slides[slideIndex-1].style.display = "block";  
	  dots[slideIndex-1].className += " active";
	}
*/