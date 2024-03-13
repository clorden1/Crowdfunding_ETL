--Create Database 'crowdfunding_db'
--This statement must be ran from a query of the server
CREATE DATABASE crowdfunding_db
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

--The following code can be ran from inside a query in the 'crowdfunding_db' database
--Table Schema 
--Exported from QuickDBD: https://www.quickdatabasediagrams.com/
CREATE TABLE "category" (
    "category_id" varchar(4)   NOT NULL,
    "category" varchar(12)   NOT NULL,
    CONSTRAINT "pk_category" PRIMARY KEY (
        "category_id"
     )
);

CREATE TABLE "subcategory" (
    "subcategory_id" varchar(8)   NOT NULL,
    "subcategory" varchar(20)   NOT NULL,
    CONSTRAINT "pk_subcategory" PRIMARY KEY (
        "subcategory_id"
     )
);

CREATE TABLE "contacts" (
    "contact_id" int   NOT NULL,
    "first_name" varchar(12)   NOT NULL,
    "last_name" varchar(13)   NOT NULL,
    "email" varchar(42)   NOT NULL,
    CONSTRAINT "pk_contacts" PRIMARY KEY (
        "contact_id"
     )
);

CREATE TABLE "campaign" (
    "cf_id" int   NOT NULL,
    "contact_id" int   NOT NULL,
    "company_name" varchar(33)   NOT NULL,
    "description" varchar(53)   NOT NULL,
    "goal" float   NOT NULL,
    "pledged" float   NOT NULL,
    "outcome" varchar(10)   NOT NULL,
    "backers_count" int   NOT NULL,
    "country" varchar(2)   NOT NULL,
    "currency" varchar(3)   NOT NULL,
    "launch_date" date   NOT NULL,
    "end_date" date   NOT NULL,
    "category_id" varchar(4)   NOT NULL,
    "subcategory_id" varchar(8)   NOT NULL,
    CONSTRAINT "pk_campaign" PRIMARY KEY (
        "cf_id"
     )
);

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_contact_id" FOREIGN KEY("contact_id")
REFERENCES "contacts" ("contact_id");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_category_id" FOREIGN KEY("category_id")
REFERENCES "category" ("category_id");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_subcategory_id" FOREIGN KEY("subcategory_id")
REFERENCES "subcategory" ("subcategory_id");

--Select each table to verify successful table creation
SELECT * FROM category;
SELECT * FROM subcategory;
SELECT * FROM contacts;
SELECT * From campaign;

--import .csv files into each table
--ABOSULTE PATH MUST BE USED HERE. USE THE PATH WHERE YOUR .CSV'S ARE STORED LOCALLY
COPY category FROM 'C:\Users\cpord\Desktop\Class_Project\Project_2\Crowdfunding_ETL\Starter_Files\Resources\category.csv' CSV HEADER;
COPY subcategory FROM 'C:\Users\cpord\Desktop\Class_Project\Project_2\Crowdfunding_ETL\Starter_Files\Resources\subcategory.csv' CSV HEADER;
COPY contacts FROM 'C:\Users\cpord\Desktop\Class_Project\Project_2\Crowdfunding_ETL\Starter_Files\Resources\contacts.csv' CSV HEADER;
COPY campaign FROM 'C:\Users\cpord\Desktop\Class_Project\Project_2\Crowdfunding_ETL\Starter_Files\Resources\campaign.csv' CSV HEADER;
--Alternatively the above data can be imported via point in click in pgAdmin

--Select all data from each table to verify import
SELECT * FROM category;
SELECT * FROM subcategory;
SELECT * FROM contacts;
SELECT * From campaign;