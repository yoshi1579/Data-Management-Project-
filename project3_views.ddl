drop view Teaching_Assistant_view;
drop view Professor_view;

create view Teaching_Assistant_view as
SELECT
        faculty_id,
        first_name,
        last_name,
        email_address,
        department_id,
        hourly_salary,
        type
FROM Faculty where type = 'Teacher_Assistant' ;

create or replace TRIGGER Teaching_Assistant_trigger
     INSTEAD OF insert ON Teaching_Assistant_view
     FOR EACH ROW
BEGIN
    insert into Faculty(
      first_name,
      last_name,
      email_address,
      department_id,
      hourly_salary,
      type)
    VALUES (
        :NEW.first_name,
        :NEW.last_name,
        :NEW.email_address,
        :NEW.department_id,
        :NEW.hourly_salary,
        'Teacher_Assistant') ;
END;
/

create view Professor_view as
SELECT
        faculty_id,
        first_name,
        last_name,
        email_address,
        department_id,
        yearly_salary,
        type
FROM Faculty where type = 'Professor' ;

create or replace TRIGGER Professor_trigger
     INSTEAD OF insert ON Professor_view
     FOR EACH ROW
BEGIN
    insert into Faculty(
      first_name,
      last_name,
      email_address,
      department_id,
      yearly_salary,
      type)
    VALUES (
        :NEW.first_name,
        :NEW.last_name,
        :NEW.email_address,
        :NEW.department_id,
        :NEW.yearly_salary,
        'Professor') ;
END;
/
