function logoutcall(){
  window.open("/user/user_logout"
		  , 'window_new', 'width=300,height=300,menubar=no,status=no,toolbar=no');
  setTimeout(function(){
  window.location.replace('/main');
  self.location.reload(true);
},800)
 
}