Final Year Project
==================

> The project focus on utilize **concurrent programming concepts** of **Go and Rust programming language** on activities in Data Processing Cycles with **PostgreSQL database** as data storage. 

*** 

Table Of Contents 
=================

  * [Final Year Project](#final-year-project)
  * [Table Of Contents](#table-of-contents)
  * [Introduction](#introduction)
  * [Getting Started](#getting-started) 
    * [Documentation](#documentation)
  * [List of Programs](#list-of-programs)
    * [FYP Phase 1](#FYP-Phase-1)
    * [FYP Phase 2](#FYP-Phase-2)
  * [Software Resources](#software-resources)
  * [About](#about) 
    * [Contributor](#contributor)
    * [Status](#status)
    
*** 

Introduction
============

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The project focus on implementation and utilization of Go and Rust programming language on data processing cycle with PostgreSQL database as data storage. These languages’ paradigm, characteristic and focus are used to build program in data preparation, data retrieval, data processing and data storage.  The data process cycle is shown as below: 

<p align="center"><img src="FYP-Phase2/FYP2-Documentation-1141328508/FYP2/Chapter3/FYP2-data-process-cycle-flowchart.png"/></p>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Big datasets with total of 5865567 rows are obtained from **[UK Government Website](https://data.gov.uk)** with **data collection** and verify with **data validation** to inspect the quality and logical weakness in data contents. The specification of data are shown as follow: 

| No  | Name of Datasets | Rows | Columns | Size | 
| --- |----------------|:----:|:-------:|:-------:|
| 01  | Education        | 21   | 32707   | 4.2 MB|
| 02  | Company          | 55   | 3595702 | 1.8 GB |
| 03  | Postcode         | 35   | 1754882 | 667.5 MB|

The raw datasets in CSV format will be backup and import into PostgreSQL database with **data transformation**. The defects discovered such as inconsistency, incorrect and duplication in large datasets are eliminated with **data encoding**, **data normalization** and **data cleaning**. Ultimately, the unnormalized and unorganized data will be migrated into normalized table as new storage with **data migration** to establish excellent relational database management system freed from anomalies.  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Go and Rust programs are developed to support data processing activities such as **data transformation**, **data cleaning** and **data migration**. The processing execution’s performance of program developed from different concurrent programming language and programming style will be compared and discussed in detail.  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PL/pgSQL scripts will be developed to create database entity’s data structure, objects, schemas and perform **data migration** within PostgreSQL database. The lightweight scripts will execute multiple written query simultaneously to perform database creation, manipulation and control eﬃciently.  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The project successfully prove concurrent programming has better performance and throughput on data processing compare to sequential programming. Data duplication, data inconsistencies and data incompleteness had successfully eliminated to establish high data quality.

***

Getting Started
===============
Documentation
-------------
The documentation contains:-  
1. Introduction  
2. Literature Review  
3. Project Design  
4. Implementation Methodology  
5. Implementation Plan  
6. Results and Findings  
7. Discussion   
8. Conclusion  

Download the document **[HERE](https://github.com/CodesAreHonest/final-year-project/blob/master/FYP-Phase2/FYP2-Documentation-1141328508/main.pdf)**

*** 

List of programs
================

FYP Phase1
----------
FYP Phase 1 is conducted in one semester to demonstrate the proof-of-concept (POC) and prototype of the projects. The program files are stored in FYP-Phase1/src/FYP1 directory and tabulated in table below: 

| File Name        | Description | 
| ------------- |:-------------:|
| import-csv-psql.go        | Transform 300 rows of data in CSV from files into PostgreSQL database | 
| sequential-psql.go        | Retrieve 300 rows of data **sequentially** from different tables contain in PostgreSQL database      | 
| concurrent-psql.go        | Retrieve 300 rows of data **concurrently** from different tables contain in PostgreSQL database      | 
| sequential-csv.go    | Retrieve 300 rows of data **sequentially** from different raw CSV datasets      | 
| concurrent-csv.go    | Retrieve 300 rows of data **concurrently** from different raw CSV datasets      |

FYP Phase2
---------
FYP Phase 2 is conducted in another semester to develop and implement the proposed idea of the final year project. The program files are stored in different repositories: 

| No | Repositories       | Description | 
| ---| :-------------: |-------------|
| 01 | [Data Encoding](https://github.com/CodesAreHonest/final-year-project/blob/master/FYP-Phase2/FYP2-appendix/data-encoding/01_company_data_encoding_runtime.txt)| The execution steps to perform text substitution line-by-line baed on the text patterns of regular expression provided in commands. Conversion of records or fields into specialized format. | 
| 02 | [Education Data Queries](https://github.com/CodesAreHonest/education-data-queries)| The PL/pgSQL scripts are written for data transformation, normalization table creation and data migration of UK Education data with 32707 rows. | 
| 03 | [Postcode Data Queries](https://github.com/CodesAreHonest/postcode-data-queries)| The PL/pgSQL scripts are written for data transformation, normalization table creation and data migration of UK Postcode data with 1754882 rows. | 
| 04 | [Company Data Queries](https://github.com/CodesAreHonest/company-data-queries)| The PL/pgSQL scripts are written for data transformation, normalization table creation and data migration of UK Postcode data with 3595702 rows. | 
| 05 | [Go-Read-PSQL](https://github.com/CodesAreHonest/go-read-psql)| The Go program retrieve 5865567 of data with average of 36 columns from three different tables in PostgreSQL database with sequential and concurrent execution. | 
| 06 | [Go-Read-CSV](https://github.com/CodesAreHonest/go-read-csv)| The Go program retrieve 5865567 of data with average of 36 columns from three different raw CSV files with sequential and concurrent execution. | 
| 07 | [Rs-Read-PSQL](https://github.com/CodesAreHonest/rs-read-psql)| The Rust program retrieve 5865567 of data with average of 36 columns from three different tables in PostgreSQL database with sequential and concurrent execution. | 
| 08 | [Rs-Read-CSV](https://github.com/CodesAreHonest/rs-read-csv) | The Rust program retrieve 5865567 of data with average of 36 columns from three different raw CSV files with sequential and concurrent execution. | 
| 09 | [Go-Migrate-Postcode](https://github.com/CodesAreHonest/go-migrate-postcode) | The Go program migrate 1754882 rows from unnormalized postcode table to normalized table in PostgreSQL database. | 
| 10 | [Go-Migrate-Company](https://github.com/CodesAreHonest/go-migrate-company) | The Go program migrate 3595702 rows from unnormalized company table to normalized table in PostgreSQL database. | 

***

Software Resources
==================
1. Linux Ubuntu 16.04.3 LTS 64-bit.  
2. Golang language compiler 1.8.3.  
3. Rust language compiler 1.20.0.  
4. PostgreSQL database 9.5.8.  
5. Eclipse for Parallel Application Developers Oxygen Release (4.7.0) IDE.  
6. TeXstudio 2.10.8.  
7. Visual Paradigm 14.1 free edition for non-commercial use.  

*** 

About
=====

Contributor
-----------
- **Chai Ying Hua** 

Status
-------
This project is submitted as Final Year Project to Multimedia University. 







