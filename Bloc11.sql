create DATABASE bdpaul;
use bdpaul;
create user Paul@localhost identified by 'iut';
select Host, user	from mysql.user;
select Host, user, Select_priv, Insert_priv, Delecte_priv
	from mysql.user;