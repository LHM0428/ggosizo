create or replace procedure user_update
( 
	 	in_u_id in user_info.u_id%type,
		in_u_pass in user_info.u_pass%type,
		in_u_name in user_info.u_name%type,
		in_u_gender in user_info.u_gender%type,
		in_u_birth in user_info.u_birth%type,
		in_u_addr in user_info.u_addr%type,
		in_u_tel in user_info.u_tel%type,
		in_u_email in user_info.u_email%type
	)
IS  
	row_user user_info%rowtype;
BEGIN
--		DBMS_OUTPUT.ENABLE;		
		update user_info
		set
		u_pass = in_u_pass,
		u_name = in_u_name,
		u_gender = in_u_gender,
		u_birth = in_u_birth,
		u_addr = in_u_addr,
		u_tel = in_u_tel,
		u_email = in_u_email,
		u_logintime = sysdate
		where u_id = in_u_id;
			
		COMMIT;
		DBMS_OUTPUT.PUT_LINE('id : ' || in_u_id);
		DBMS_OUTPUT.PUT_LINE('pass : ' || in_u_pass);
		DBMS_OUTPUT.PUT_LINE('name : ' || in_u_name);
		DBMS_OUTPUT.PUT_LINE('brith: ' || in_u_birth);
END ;
/