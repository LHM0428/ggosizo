drop table notice_file;
create table notice_file(
	nn_path varchar2(150) primary key,
	nn_no number references notice(notice_no),
	nn_regdate date default sysdate
);