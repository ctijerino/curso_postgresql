select * from "tblzonas";
create table nuevas_zonas as table tblzonas;
select * from nuevas_zonas;
create table nuevas_zonas2 as table tblzonas with no data;
select * from nuevas_zonas2;
create table nuevas_zonas3 as select * from tblzonas where "COD_ZON">0;
select * from nuevas_zonas3;
select * into nuevas_zonas4 from "nuevas_zonas" where "COD_ZON">1;
