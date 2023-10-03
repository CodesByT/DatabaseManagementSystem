create database Hospital;

use Hospital;

create table Patient(
	PatientID varchar (15) primary key,
	p_name varchar (15),
	Age int check (Age>=15),
	Gender varchar(5),
	Address varchar(20),
	Disease varchar(10),
	DoctorID varchar(15),
	Doc_id varchar(15),
	FOREIGN KEY (Doc_id) REFERENCES Doctor(DoctorID)
#   check (Age>=18),
#	PRIMARY KEY (PatientID)
);
# ----------------------------------------------------------------
create table Patient(
	PatientID varchar (15),
	p_name varchar (15),
	Age int,
	Gender varchar(5) unique,
	Address varchar(20),
	Disease varchar(10),
	DoctorID varchar(15),
    CONSTRAINT CHK_Patient CHECK (Age>=18),
    CONSTRAINT pk_Patient Primary key (PatientID),
    CONSTRAINT fk_Patient Foreign key (DoctorID) references Doctor(DoctorID)
);
# ----------------------------------------------------------------
create table Patient(
	PatientID varchar (15),
	p_name varchar (15),
	Age int,
	Gender varchar(5) ,
	Address varchar(20),
	Disease varchar(10),
	DoctorID varchar(15)
);
ALTER TABLE Patient ADD PRIMARY KEY(PatientID);
ALTER TABLE Patient ADD FOREIGN KEY(DoctorID) references Doctor(Doctorid);
ALTER TABLE Patient ADD CONSTRAINT fk_patient FOREIGN KEY(DoctorID) references Doctor(Doctorid);
ALTER TABLE Patient ADD CONSTRAINT pk_patient PRIMARY KEY(PatientID);
ALTER TABLE Patient ADD CONSTRAINT uniq_patient UNIQUE KEY (Address);
ALTER TABLE Patient ADD CHECK (Age>=18);
ALTER TABLE Patient ADD Constraint chk_person Check (Age>=18);
ALTER TABLE Patient DROP check age;
ALTER TABLE Patient Drop CONSTRAINT chk_person;
ALTER TABLE Patient Drop CONSTRAINT fk_patient;
ALTER TABLE Patient Drop CONSTRAINT pk_patient;
ALTER TABLE Patient MODIFY Gender char(50); 				# CHANGE DATATYPE OF ANY COLUMN
ALTER TABLE Patient MODIFY Disease varchar(10) not null;	# Change Constraint
ALTER TABLE Patient MODIFY Address varchar(20) unique;		# Change Constraint

# ----------------------------------------------------------------
CREATE TABLE Doctor(
	DoctorID varchar (15) primary key,
	d_name varchar (15) not null,
	Age int check (Age>=20),
	Gender char ,
	Address varchar(20)
);
ALTER TABLE Doctor Add DoctorWard varchar(15);
ALTER TABLE Doctor Add PRIMARY KEY (DoctorID);
ALTER TABLE Doctor Add COLUMN extra int;
ALTER TABLE Doctor DROP COLUMN extra;
ALTER TABLE Doctor MODIFY extra char;
ALTER TABLE Doctor CHANGE COLUMN extra exVar varchar(10);
ALTER TABLE Doctor RENAME COLUMN exVar to extraVae;


# ----------------------------------------------------------------
CREATE TABLE Lab (
	LabID varchar (15) primary key,
	TestDate date,
	TestAmount varchar(20),
	PatientID varchar(15),
	DoctorID varchar(15),
    extra_att varchar(10),
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);
ALTER TABLE Lab RENAME HospitalLab;						    # Change table name using alter
ALTER TABLE HospitalLab RENAME Lab;
ALTER TABLE Lab RENAME COLUMN TestAmount to Amount ; 	    # Change Column name using alter	
ALTER TABLE Lab MODIFY Amount double;					    # Change datatype of column
ALTER TABLE Lab Add LabNo varchar (10);					    # Add a new column
ALTER TABLE Lab CHANGE COLUMN TestAmount TAmount char(10);  # Change name and datatype of a column in single query
ALTER TABLE Lab Drop extra_att;							    # Delete a Column

# ----------------------------------------------------------------
CREATE TABLE HospitalRoom (
	RoomID varchar (15) PRIMARY KEY,
	RoomAllocationDate date,
	RoomType varchar(20),
	RoomStatus varchar(5)
);
ALTER TABLE HospitalRoom RENAME Room;
ALTER TABLE Room RENAME column RoomAllocationDate to RoomAllocatDate;
ALTER TABLE Room RENAME HRoom;
ALTER TABLE HRoom CHANGE COLUMN RoomStatus RStatus varchar(10);

# ----------------------------------------------------------------
CREATE TABLE PatientBill  (
	BillID varchar (15) ,
	BillDate date,
    BillTax int DEFAULT 100,
	Amount varchar(20),
	PatientID varchar(15)
    
);
ALTER TABLE PatientBill ALTER BillTax SET DEFAULT 100;
ALTER TABLE PatientBill ADD FOREIGN KEY (PatientID) REFERENCES Patient(PatientID);
ALTER TABLE PatientBill Add primary key (BillID,PatientID); 	# Composite Primary Key

# ----------------------------------------------------------------

TRUNCATE TABLE PATIENT; 	# The TRUNCATE TABLE command deletes the data inside a table, but not the table itself.
describe Patient;
describe Doctor;
describe Lab;
describe HospitalLab;
describe HospitalRoom;
describe Room;
describe PatientBill;

drop table Doctor;
drop table Lab;
drop table  HospitalRoom;
drop table  Room;
drop table  PatientBill;
drop table Patient;			# The DROP TABLE command deletes a table in the database.
# DELETE FROM Patient;
drop database Hospital;

