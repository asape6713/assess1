CREATE TABLE contactsb(
    id integer PRIMARY KEY,
    first_name varchar(50),
    last_name varchar(50),
    title varchar(50), 
    organization varchar (50))




INSERT INTO public.contacts(
	id, first_name, last_name, title, organization)
	VALUES (1, 'Erik', 'Eriksson', 'Teacher', 'Utbildning AB'),
    (2,'Anna', 'Sundh','' ,'' ),
    (3,'Goran', 'Bregovic', 'Coach', 'Dalens IK'),
    (4, 'Ann_marie', 'Bergqvist', 'Cousin','' ),
    (5, 'Herman', 'Appelkvist','' ,'' );

---1.5 Add two more rows into the contact table, where one of them contains your 
own name. 
INSERT INTO public.contacts(
id, first_name, last_name, title, organization)
VALUES(6,'Anna', 'Hansson', 'Cousin', ''),
(7,'Åsa', 'Ericsson', '','');
    
    
INSERT INTO public.items(
    contact, contact_id, contact_type_id, contact_category_id)
    VALUES ('011-12 33 45', 3,2,1),
            ('goran@infoab.se',3,1,2),
            ('010-88 55 44', 4,2,1),
            ('eriks57@hotmail.com', 1,1,1),
            ('@annapanna99',2,2,1),
            ('077-563578',2,4,1),
            ('070-156 22 78', 3,2,2);
ALTER TABLE contact_types
ADD UNIQUE (id);
ALTER TABLE items
ADD FOREIGN KEY (contact_type_id) REFERENCES contact_types(id);
ALTER TABLE items
ADD FOREIGN KEY (contact_category_id) REFERENCES contact_categories(id);
ALTER TABLE contact_categories
ADD UNIQUE (id);
ALTER TABLE contacts
ADD UNIQUE (id);
ALTER TABLE items
ADD FOREIGN KEY (contact_id) REFERENCES contacts(id);

INSERT INTO public.contact_types(
    id,  contact_type)
    VALUES (1, 'Email'),
    (2, 'Phone'),
    (3,'Skype'),
    (4,'Instagram');
    
    
INSERT INTO public.contact_categories(
    id,  contact_category)
    VALUES (1, 'Home'),
    (2,'Work'),
    (3, 'Fax');

SELECT *
FROM contacts;
--1.6 Create a query that lists if there are unused contact_types 
SELECT contact_type_id
FROM items
where contact_type_id IN(SELECT id FROM contact_types);

--1.7 Create a view view_contacts that lists the columns: first_name, last_name, 
--contact, contact_type, contact_category.
CREATE VIEW public.view_contacts
WITH (
  security_barrier=true
) AS
CREATE view_contacts AS 
SELECT first_name,last_name, i.contact, i.contact_type, i.contact_category
FROM contacts c
INNER JOIN items i ON c.contacts = i.contact_id;

ALTER TABLE public.view_contacts
    OWNER TO postgres;                 