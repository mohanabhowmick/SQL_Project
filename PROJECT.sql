---Q1.

CREATE DATABASE Tenant;


--Q2
--Q2.1
Create table Tenancy_histories
(
id INT IDENTITY(1,1),
profile_id int NOT NULL,
house_id int NOT NULL,
move_in_date date NOT NULL,
move_out_date date,
rent int NOT NULL,
Bed_type varchar(255),
move_out_reason varchar(255),
CONSTRAINT PK_Id
PRIMARY KEY (id)
)

--Q2.2
Create table Profiles
(
profile_id int IDENTITY(1,1),
first_name varchar(255),
last_name varchar(255),
email varchar(255) NOT NULL,
phone varchar(255) NOT NULL,
"city(hometown)" varchar(255),
pan_card varchar(255),
created_at date NOT NULL,
gender varchar(255) NOT NULL,
referral_code varchar(255),
marital_status varchar(255),
CONSTRAINT pk_Profile_id
PRIMARY KEY (profile_id)
)

--Q2.3
Create table Houses
(
house_id int IDENTITY(1,1),
house_type varchar(255),
bhk_details varchar(255),
bed_count int NOT NULL,
furnishing_type varchar(255),
Beds_vacant int NOT NULL,
CONSTRAINT pk_House_id
PRIMARY KEY (house_id)
)

--Q2.4

Create table Addresses
(
ad_id int IDENTITY(1,1),
name varchar(255),
description text,
pincode int,
city varchar(255),
house_id int NOT NULL,
CONSTRAINT pk_ad_id
PRIMARY KEY (ad_id)
)

--Q2.5

Create table Referrals
(
ref_id int IDENTITY(1,1),
"referrer_id(same as profile id)" int NOT NULL,
referrer_bonus_amount float,
referral_valid tinyint,
valid_from date,
valid_till date,
CONSTRAINT pk_ref_id
PRIMARY KEY (ref_id),
CONSTRAINT ck_ref_valid
CHECK(referral_valid IN ('0','1'))
)

--Q2.6

Create table Employment_details
(id int IDENTITY(1,1),
profile_id int NOT NULL,
latest_employer varchar(255),
official_mail_id varchar(255),
yrs_experience int,
Occupational_category varchar(255),
CONSTRAINT pk_id2
PRIMARY KEY (id)
);

--Adding Foreign keys:

ALTER table Tenancy_histories
ADD CONSTRAINT FK_profile_id
FOREIGN KEY (profile_id) REFERENCES Profiles(profile_id);

ALTER table Tenancy_histories
ADD CONSTRAINT FK_house_id
FOREIGN KEY (house_id) REFERENCES Houses(house_id);

--Adding FK to Addresses table:

ALTER table Addresses
ADD CONSTRAINT FK_house_id2
FOREIGN KEY (house_id) REFERENCES Houses(house_id);

--Adding FK to Referrals:

ALTER table Referrals
ADD CONSTRAINT "FK_referrer_id(same as profile id)"
FOREIGN KEY ("referrer_id(same as profile id)") REFERENCES Profiles(profile_id);

--Adding FK to Employment_details:

ALTER table Employment_details
ADD CONSTRAINT "FK_profile_id2"
FOREIGN KEY (profile_id) REFERENCES Profiles(profile_id);

--Q4

--Adding data to profiles table:
Select * from profiles

INSERT INTO Profiles (first_name,last_name,email, phone,"city(hometown)", created_at, gender, referral_code, marital_status)
Values('anusha','pariti','anusha.pariti@gmail.com','8105987404','Bangalore','4/16/2015','F','7L5FZW','Y')

INSERT INTO Profiles (first_name,last_name,email, phone,"city(hometown)", created_at, gender, referral_code, marital_status)
Select 'Ashish','Singh','ashish.singh@gmail.com','9876890463','Bangalore','5/23/2015','M','KF34MF','Y'
UNION ALL
Select 'Bhaskar','maheshwari','bhaskar.mah@gmail.com','9801834992','Bangalore','5/1/2015','M','5TYSHGF','N'

INSERT INTO Profiles (first_name,last_name,email, phone,"city(hometown)", created_at, gender, referral_code, marital_status)
Select 'Garima','yadav','garima0191@gmail.com','81059237004','Bangalore','10/20/2015','F','5G5FQW','N'
UNION ALL
Select 'Tanvi','mann','tanvi.mann1907@gmail.com','9178352769','Bangalore','2/16/2015','F','JSH48B','N'
UNION ALL
Select 'Harish','sahai','harish294all@gmail.com','9876548763','Bangalore','11/11/2015','M','MKGI2W','Y'
UNION ALL
Select 'Kamal','gera','kamal0094@gmail.com','8105987404','Bangalore','10/31/2015','M','MK34ER','N'
UNION ALL
Select 'Tushar','kapoor','tushar.kapoor21@gmail.com','8926537154','Pune','12/12/2015','M','KLF12E','N'
UNION ALL
Select 'Shivshankar','das','sankar.shiva730@gmail.com','9801834992','Pune','10/6/2015','M','3RE5TY','Y'
UNION ALL
Select 'Aditi','jain','aditi.jain@sproxil.com','9873123456','Pune','6/11/2015','F','5TPL4E','N'
UNION ALL
Select 'Deepa','sudhakar','sudhakar.deepa@gmail.com','7896785432','Pune','9/15/2015','F','4RTYUIO','Y'
UNION ALL
Select 'Umang','parejiya','uparejiya@gmail.com','7896543674','Pune','7/18/2015','M','6TY4WE','N'
UNION ALL
Select 'Mitali','gupta','mitali.gupta80@gmail.com','8796751238','Pune','3/24/2015','F','5RTYU3','Y'
UNION ALL
Select 'Manisha','Yadav','maniyadav88@gmail.com','9867845182','Delhi','1/27/2015','F','LKGHY6','N'
UNION ALL
Select 'Shivani','godha','shivani_go@nid.edu','9878673428','Delhi','2/19/2015','F','8NM4R','Y'
UNION ALL
Select 'Rajan','pandey','raajanpandey@gmail.com','8987647811','delhi','9/4/2015','M','5TYUIO','N'
UNION ALL
Select 'Roosena','manuel','roseenasimimanuel@gmail.com','9875623345','Delhi','4/13/2015','F','6TYHU','Y'
UNION ALL
Select 'Prabhjot','gill','prabhjotgill09@gmail.com','9800786688','Delhi','12/30/2015','M','GHJK34','N'
UNION ALL
Select 'Ankita','sharma','ankita.anku96@gmail.com','9988789656','Delhi','8/17/2015','F','TH67TY','Y'
UNION ALL
Select 'Karan','Singh','karan.singh@gmail.com','8976665768','Delhi','9/15/2015','M','LRF34F','N'

--Inserting Rows to Referral table

INSERT INTO Referrals(referrer_bonus_amount,referral_valid,valid_from,valid_till,"referrer_id(same as profile id)")
Values (2500,1,'7/5/2015','9/5/2015',2)

SELECT * from Referrals

INSERT INTO Referrals(referrer_bonus_amount,referral_valid,valid_from,valid_till,"referrer_id(same as profile id)")
Select 2500,1,'7/5/2015','9/5/2015',3
UNION ALL
Select 1000,0,'12/13/2015','2/13/2016',5
UNION ALL
Select 2500,0,'4/25/2016','6/24/2016',6
UNION ALL
Select 1000,1,'7/1/2015','9/1/2015',10
UNION ALL
Select 2500,1,'5/12/2015','7/12/2015',12
UNION ALL
Select 2500,0,'8/5/2015','10/5/2015',13
UNION ALL
Select 1000,1,'2/5/2016','4/5/2016',20
UNION ALL
Select 2500,0,'8/12/2015','9/12/2015',2
UNION ALL
Select 1000,1,'2/18/2016','4/18/2016',5
UNION ALL
Select 1500,1,'6/19/2016','8/19/2016',20
UNION ALL
Select 2500,0,'11/15/2015','1/15/2016',9
UNION ALL
Select 1000,1,'2/1/2016','4/1/2016',13
UNION ALL
Select 1000,1,'4/25/2016','6/24/2016',5

--Inserting data into Employment_details

INSERT INTO Employment_details(latest_employer,official_mail_id,yrs_experience,Occupational_category,profile_id)
Values ('Sabre','mehdi.hasan@sabre.com',1,'Working',1)

SELECT * FROM Employment_details

INSERT INTO Employment_details(latest_employer,official_mail_id,yrs_experience,Occupational_category,profile_id)
Select 'hindustan unilever','rags.ramgas@gmail.com',2,'Working',2
UNION ALL
Select 'Technicolor','jigna.thacker@technicolor.com',1,'Working',3

INSERT INTO Employment_details(Occupational_category,profile_id)
Values ('Student',4)


INSERT INTO Employment_details(latest_employer,official_mail_id,yrs_experience,Occupational_category,profile_id)
Select 'GE Healthcare','ruchita.save@ge.com',3,'Working',5
UNION ALL
Select 'Aditya birla','shubhi.bajpai@adityabirla.com',3,'Working',6

INSERT INTO Employment_details(Occupational_category,profile_id)
Select 'Student',7
UNION ALL
Select 'Student',8
UNION ALL
Select 'Student',9

INSERT INTO Employment_details(latest_employer,official_mail_id,yrs_experience,Occupational_category,profile_id)
Values('huawei Technologies','gunjan19wadhwa@gmail.com',4,'Working',10)

INSERT INTO Employment_details(Occupational_category,profile_id)
Select 'Student',11

INSERT INTO Employment_details(latest_employer,official_mail_id,yrs_experience,Occupational_category,profile_id)
Select 'Centurylink India','PreetInder.Sodhi@centurylink.com',2,'Working',12
UNION ALL
Select 'SAP Labs India','udit.singh@sap.com',2,'Working',13
UNION ALL
Select 'NestAway','deepak@nestaway.com',1,'Working',14

INSERT INTO Employment_details(Occupational_category,profile_id)
Select 'Student',15
UNION ALL
Select 'Student',16

INSERT INTO Employment_details(latest_employer,official_mail_id,yrs_experience,Occupational_category,profile_id)
Select 'Microsoft','t-akmeh@microsoft.com',2,'Working',17
UNION ALL
Select 'Cognizant','bhavranjan.pandey@cognizant.com',2,'Working',18

INSERT INTO Employment_details(Occupational_category,profile_id)
Select 'Student',19

INSERT INTO Employment_details(latest_employer,official_mail_id,yrs_experience,Occupational_category,profile_id)
Select 'Tiny Mogul Games','sanchit@hike.in',3,'Working',20

--Inserting data to Houses Table:

INSERT INTO Houses(house_type,bhk_details,bed_count,furnishing_type,Beds_vacant)
Values('Apartment','3 BHK',5,'unfurnished',2)

Select*from Houses

INSERT INTO Houses(house_type,bhk_details,bed_count,furnishing_type,Beds_vacant)
Select 'Apartment','3 BHK',3,'unfurnished',1
UNION ALL
Select 'Apartment','3 BHK',6,'fully-furnished',4
UNION ALL
Select 'Apartment','2 BHK',2,'fully-furnished',0
UNION ALL
Select 'Independent','4 BHK',4,'fully-furnished',2
UNION ALL
Select 'Apartment','3 BHK',3,'semifurnished',1
UNION ALL
Select 'Apartment','3 BHK',3,'semifurnished',0
UNION ALL
Select 'Apartment','2 BHK',4,'fully-furnished',1
UNION ALL
Select 'Independent','1 BHK',2,'unfurnished',0
UNION ALL
Select 'Independent','3 BHK',3,'fully-furnished',1
UNION ALL
Select 'Apartment','1 BHK',1,'unfurnished',0
UNION ALL
Select 'Independent','1 BHK',2,'unfurnished',1
UNION ALL
Select 'Independent','2 BHK',4,'unfurnished',2
UNION ALL
Select 'Apartment','3 BHK',3,'fully-furnished',0
UNION ALL
Select 'Independent','1 BHK',2,'unfurnished',1
UNION ALL
Select 'Apartment','3 BHK',3,'fully-furnished',0
UNION ALL
Select 'Independent','3 BHK',3,'fully-furnished',1
UNION ALL
Select 'Independent','2 BHK',2,'fully-furnished',1
UNION ALL
Select 'Independent','3 BHK',3,'fully-furnished',1
UNION ALL
Select 'Independent','1 BHK',2,'unfurnished',2

--Adding data to Tenancy_histories:

INSERT INTO Tenancy_histories(move_in_date,move_out_date,rent,Bed_type,move_out_reason,house_id,profile_id)
Values ('2/12/2015','4/30/2016',7500,'bed','MOVE_OUT',5,1)

Select *  from Tenancy_histories

INSERT INTO Tenancy_histories(move_in_date,rent,Bed_type,house_id,profile_id)
Values('6/5/2015',11000,'room',2,2)
GO
INSERT INTO Tenancy_histories(move_in_date,move_out_date,rent,Bed_type,move_out_reason,house_id,profile_id)
Values ('10/28/2015','11/28/2016',12000,'room','RENT_CHANGE',4,3)



INSERT INTO Tenancy_histories(move_in_date,rent,Bed_type,house_id,profile_id)
Values('4/26/2015',8000,'bed',1,4)
GO
INSERT INTO Tenancy_histories(move_in_date,move_out_date,rent,Bed_type,move_out_reason,house_id,profile_id)
Values ('5/15/2015','12/27/2015',9000,'bed','MOVE_OUT',3,5)
GO
INSERT INTO Tenancy_histories(move_in_date,rent,Bed_type,house_id,profile_id)
Values('12/25/2015',10200,'room',8,6)
GO
INSERT INTO Tenancy_histories(move_in_date,rent,Bed_type,house_id,profile_id)
Values('11/20/2015',6500,'bed',6,7)
GO
INSERT INTO Tenancy_histories(move_in_date,move_out_date,rent,Bed_type,move_out_reason,house_id,profile_id)
Values ('11/10/2015','12/31/2016',7200,'bed','MOVE_OUT',7,8)
GO
INSERT INTO Tenancy_histories(move_in_date,rent,Bed_type,house_id,profile_id)
Values('10/15/2015',7500,'bed',9,9)
GO
INSERT INTO Tenancy_histories(move_in_date,rent,Bed_type,house_id,profile_id)
Values('6/20/2015',7500,'bed',10,10)
GO
INSERT INTO Tenancy_histories(move_in_date,move_out_date,rent,Bed_type,move_out_reason,house_id,profile_id)
Values ('8/29/2015','6/14/2016',8000,'bed','INTERNAL_TRANSFER',19,11)
GO
INSERT INTO Tenancy_histories(move_in_date,rent,Bed_type,house_id,profile_id)
Values('2/24/2015',11000,'room',15,12)
GO
INSERT INTO Tenancy_histories(move_in_date,rent,Bed_type,house_id,profile_id)
Values('2/25/2015',12000,'room',12,13)
GO
INSERT INTO Tenancy_histories(move_in_date,move_out_date,rent,Bed_type,move_out_reason,house_id,profile_id)
Values ('1/7/2016','12/30/2016',13500,'room','MOVE_OUT',18,14)
GO
INSERT INTO Tenancy_histories(move_in_date,rent,Bed_type,house_id,profile_id)
Values('4/7/2015',6500,'bed',13,15)
GO
INSERT INTO Tenancy_histories(move_in_date,rent,Bed_type,house_id,profile_id)
Values('4/23/2015',6500,'bed',17,16)
GO
INSERT INTO Tenancy_histories(move_in_date,rent,Bed_type,house_id,profile_id)
Values('2/10/2015',10500,'room',14,17)
GO
INSERT INTO Tenancy_histories(move_in_date,move_out_date,rent,Bed_type,move_out_reason,house_id,profile_id)
Values ('10/16/2015','9/4/2016',8000,'bed','MOVE_OUT',16,18)
GO
INSERT INTO Tenancy_histories(move_in_date,rent,Bed_type,house_id,profile_id)
Values('9/26/2015',7500,'bed',20,19)
GO
INSERT INTO Tenancy_histories(move_in_date,rent,Bed_type,house_id,profile_id)
Values('9/30/2015',9500,'bed',11,20)

--Adding data to Address table:

INSERT INTO Addresses(name,description,city,pincode,house_id)
Values('Zaanz appartment','Sterling BrookSide, Opp. Kundalahalli Colony, ITPL Main Rd','bangalore',560037,1)

Delete from Addresses

Select * from Addresses



INSERT INTO Addresses(name,description,city,pincode,house_id)
Select 'stag saptgiri','No.44,Ground floor,20th cross,Sector 2 HSR Layout,Bangalore.','bangalore',560102,2
UNION ALL
Select 'sri sai enclave','No.44,First floor,20th cross,Sector 2 HSR Layout.','bangalore',560102,3
UNION ALL
Select 'orchids building','D-208, Balaji Pristine Whitefield Main Road','bangalore',560066,4
UNION ALL
Select 'Fella homes','#11,Annaiya Reddy Rd, Narayana Reddy Layout,Phase 2, Electronic City','bangalore',560100,5
UNION ALL
Select 'Juniper appartments','# 595/1, 1st Floor,1st A main, Domlur Layout','bangalore',560038,6
UNION ALL
Select 'UDB Building','Flat No: T1 Deccan Field Appartment Kunadanhalli main road','bangalore',560037,7
UNION ALL
Select 'Apoorva society','Flat No-202, Apoorva Apartment No-296 Vyalikaval House Building Cooperative Society Ltd Nagavara','Delhi',561202,8
UNION ALL
Select 'Stag saptgiri','Flat No-202, stag saptgiri No-26 phase2 Cooperative Society','Delhi',560045,9
UNION ALL
Select 'VaK Residency','302,#473 VAK Residency, B-Block, AECS Layout Kundalahalli,','Delhi',456738,10
UNION ALL
Select 'Sunshine hills','Flat no 3, water ville apartment R.galli','Delhi',100234,11
UNION ALL
Select 'Sri Sai appartment','2nd House, No-80/289, Sri Hari Darshan Nilaya, Ground Floor, Bellandur','Delhi',560107,12
UNION ALL
Select 'Barvika Residency','B105, 1st floor, B block, Barvika Residency','Delhi',5610023,13
UNION ALL
Select 'Nestaway building','#157, 4th Cross, 1st Main Road, Lower Palace Orchard','Delhi',546783,14
UNION ALL
Select 'Windsor Plaza','#301, Windsor Plaza,ITPL','Pune',560025,15
UNION ALL
Select 'Indira society','No. 502, Indira Meadows, Arunodaya Colony','Pune',302017,16
UNION ALL
Select 'Sri Krishna Society','Flat No-211 Sri Krishna sai enclave, Hoodi village, beside Vivekananda Ashram, Mahadevapura post','Pune',560025,17
UNION ALL
Select 'uniworld','D1-1201, Uniworld Garden 2','Pune',543678,18
UNION ALL
Select 'Vinayaka residency','49, House 1 lathangi 2nd main vinayaka housing layout, RMV 2nd stage bhoopasandra','Pune',560094,19
UNION ALL
Select 'Sun city appartments','Majeera Diamond Towers,malad-west','Pune',5600263,20

--Q1


Select Top 1 DATEDIFF(month,move_in_date,move_out_date) AS Dated,p.profile_id,p.first_name,p.last_name,p.phone,
move_in_date,move_out_date
From Tenancy_histories as th
LEFT JOIN
Profiles as p
ON
p.profile_id=th.profile_id
where DATEDIFF(month,move_in_date,move_out_date) IS NOT NULL
Order by DATEDIFF(month,move_in_date,move_out_date) DESC;

--Q2

Select first_name,last_name,email,phone,marital_status
from Profiles
where marital_status='Y' and profile_id IN
(Select profile_id
From Tenancy_histories
Where rent>9000)

--Q3

--Write a query to display profile id, full name, phone, email id, city , house id, move_in_date ,
--move_out date, rent, total number of referrals made, latest employer and the occupational
--category of all the tenants living in Bangalore or Pune in the time period of jan 2015 to jan
--2016 sorted by their rent in descending order

Select a.city,a.house_id,
th.move_in_date,th.move_out_date,th.rent,
p.profile_id,p.first_name,p.last_name,p.phone,p.email,
ed.latest_employer,ed.Occupational_category,
COUNT(r.referral_valid) OVER (PARTITION BY "referrer_id(same as profile id)") AS Referral_Count

FROM Addresses as a
LEFT JOIN
Tenancy_histories as th
ON
a.house_id=th.house_id

 LEFT JOIN
Profiles as p
ON
p.profile_id=th.profile_id
 
LEFT JOIN
Employment_details as ed
ON
ed.profile_id=p.profile_id

LEFT JOIN
Referrals as r
ON
r.[referrer_id(same as profile id)]=p.profile_id

WHERE (city='Bangalore' or city='Pune')

AND
(th.move_out_date<='2016-01-01')

ORDER BY rent desc;


--Q5

Select a.city,SUM(th.rent) as RentfromCity, COUNT(a.city) as Total_cities
FROM Addresses as a
LEFT JOIN Tenancy_histories as th
ON a.house_id=th.house_id
Group by a.city

--Total rent generated from all the cities:

--Select SUM(rent) as Total_rent from Tenancy_histories ;




--Q6 Create a view 'vw_tenant' find
--profile_id,rent,move_in_date,house_type,beds_vacant,description and city of tenants who
--shifted on/after 30th april 2015 and are living in houses having vacant beds and its address.

Create  view 
vw_tenant AS
Select th.profile_id,th.rent,th.move_in_date,h.house_type, h.Beds_vacant,a.description, a.name,a.city,
a.pincode
From Tenancy_histories as th
LEFT JOIN
Houses h
ON
h.house_id=th.house_id
LEFT JOIN
Addresses as a
ON
a.house_id=th.house_id
WHERE (th.move_in_date='4/30/2015' OR
th.move_in_date between '4/30/2015' and '1/7/2016')
AND
h.Beds_vacant !=0;

Select * from vw_tenant

--Q8

Select p.profile_id,p.first_name,p.last_name,p.phone,th.rent,
IIF(th.rent>10000,'A',IIF(th.rent BETWEEn 7500 and 10000,'B','C')) AS 'Customer Segment'
From Profiles as p
LEFT JOIN
Tenancy_histories as th
ON
p.profile_id=th.profile_id


--Q9

Select p.profile_id,p.first_name,p.last_name,p.email,p.phone,
r.referral_valid,
th.house_id,
h.house_type,h.bhk_details,h.bed_count,h.furnishing_type,h.Beds_vacant,
a.city

FROM Profiles as p
LEFT JOIN Referrals as r
ON
p.profile_id=r.[referrer_id(same as profile id)]

LEFT JOIN Tenancy_histories as th
ON
th.profile_id=p.profile_id

LEFT JOIN Houses as h
ON
th.house_id=h.house_id

LEFT JOIN Addresses as a
ON
a.house_id=th.house_id

WHERE r.referral_valid IS NULL;

--Q10

Select TOP 1 h.bed_count,h.house_type,h.bhk_details,h.furnishing_type,h.house_id,
a.name,a.description,a.city,a.pincode
from Houses as h
LEFT JOIN 
Addresses as a
ON
h.house_id=a.house_id
order by h.bed_count DESC;

--Q7

--Write a code to extend the valid_till date for a month of tenants who have referred more than two times



Select "referrer_id(same as profile id)",valid_till,COUNT(referral_valid) OVER(Partition by "referrer_id(same as profile id)") 
AS Count_Ref_ID

FROM Referrals

Update Referrals
SET valid_till=DATEADD(MONTH,1,valid_till)

WHERE "referrer_id(same as profile id)"=5





