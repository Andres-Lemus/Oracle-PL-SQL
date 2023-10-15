--insert into regions values(1002,'REGION2');
--insert into hr.regions values(1003,'REGION3');
/*update hr.regions set region_name='XXXX'
where region_id=1000;*/
/*insert into hr.regions values(1050,'REGIONS4');
UPDATE HR.REGIONS SET REGION_ID=1100 WHERE REGION_ID=1050;*/

--UPDATE REGIONS SET REGION_NAME=LOWER(REGION_NAME);
--INSERT INTO REGIONS VALUES(1090,'region89');

INSERT INTO REGIONS VALUES(1085,'region1085');
commit;

desc user_triggers;

select trigger_name, trigger_type, action_type, triggering_event, trigger_body from user_triggers;
select object_name, object_type, status from user_objects where object_type='TRIGGER';

ALTER TRIGGER TR1_REGION COMPILE;
SELECT * FROM USER_ERRORS;
ALTER TRIGGER TR1_REGION DISABLE;

select trigger_name, status from user_triggers;
ALTER TRIGGER TR1_REGION enable;

--DROP TRIGGER INS_EMPL;