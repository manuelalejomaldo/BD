/*
Exercice 5.
Manuel Alejandro Maldonado
*/

/*
pour verifier le contenue de table EMPLOYES
*/
select * from EMPLOYES;
/*
Question 1
*/
SELECT NOM, SALAIRE from EMPLOYES WHERE no_service = 10;


/*
Question 2
*/
SELECT NOM, SALAIRE from EMPLOYES WHERE no_service = 10 or no_service = 20;

/*
Question 3
*/
SELECT NOM, SALAIRE, commission from EMPLOYES WHERE commission is not null;

/*
Question 4
*/
SELECT NOM, SALAIRE, commission from EMPLOYES WHERE commission is not null or commission = 0;


/*
Question 5
*/
SELECT NOM, SALAIRE from EMPLOYES WHERE job = 'MANAGER' and SALAIRE > 2500;

/*
Question 6
*/
SELECT NOM, SALAIRE from EMPLOYES WHERE SALAIRE >= 1500 and SALAIRE <= 2000;

/*
Exercices pratiques sur les SELECT avec opérateurs
*/

/*
QUESTION 1
*/
SELECT NOM, SALAIRE from EMPLOYES WHERE SALAIRE BETWEEN 1500 and 2000;

/*
QUESTION 2
*/
SELECT NOM from EMPLOYES WHERE NOM LIKE '%L%';
SELECT NOM from EMPLOYES WHERE NOM LIKE '%LL%';

/*
QUESTION 3
*/
SELECT NOM FROM EMPLOYES WHERE NOM LIKE '___l%';

/*
QUESTION 4
*/
SELECT NOM  FROM EMPLOYES WHERE JOB IN ('MANAGER','VENDEUR','EMPLOYE');
SELECT nom,job 
FROM employes 
WHERE JOB IN ('MANAGER','VENDEUR','EMPLOYE');    
    /*
    QUESTION 5
    */
SELECT NOM , 
	CASE JOB
		when 'MANAGER' THEN 'CADRE'
        when 'PRESIDENT' THEN 'CADRE'
		ELSE 'NO CADRE'
	END AS Position
	FROM EMPLOYES;
    
    
/*
QUESTION 6
*/

SELECT NOM, SALAIRE,
	SALAIRE >= 3000 IS TRUE AS "Haute salaire",
    salaire < 3000 IS TRUE AS "Bas salaire"
FROM EMPLOYES;

/*
Question 7 
*/

select Nom, salaire
from employes
where binary(nom) = 'Deleglise';

select Nom, salaire
from employes
where binary(nom) = 'DELEGLISE';

/*
qUESTION 8
*/

SELECT nom, 
	CASE No_service 
		WHEN 10 THEN 'DIX'
		WHEN 20 THEN 'Vight'
		WHEN 30 THEN 'Trente' end AS ServiceLettre
FROM EMPLOYES;

/*
Question 9
*/

select nom
from employes
where nom regexp 'E$';

/*
Question 10
*/

select nom, job, (SALAIRE + ifnull(commission,0))*12 as 'Revenu annuel'
from employes
where job = 'VENDEUR';

select nom, job, (SALAIRE + ifnull(commission,0))*12 as 'Revenu annuel'
from employes
where job = 'VENDEUR' or job ='employe' ;

/*
Question11
*/