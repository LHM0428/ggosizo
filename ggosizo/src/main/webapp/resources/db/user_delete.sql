create or replace procedure user_delete
( 
	 	in_u_id in user_info.u_id%type,
		in_u_pass in user_info.u_pass%type
 )
IS
	
BEGIN
--		DBMS_OUTPUT.ENABLE;

		DBMS_OUTPUT.PUT_LINE('id : ' || in_u_id);
		DBMS_OUTPUT.PUT_LINE('pass : ' || in_u_pass);
		
		delete from user_info where u_id =in_u_id and u_pass=in_u_pass;
		COMMIT;
		DBMS_OUTPUT.PUT_LINE( 'delete success ' );
		
END ;
/