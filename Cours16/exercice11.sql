create USER "admindb"@"%" identified by "123456";
grant all privileges on *.* to "admindb"@"%" with grant option;
show grants for "admindb"@"%";

show grants for "a.boily"@"%";
show grants for "f.roy"@"%";

