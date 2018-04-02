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

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Big datasets with total of 5865567 rows are obtained from **[UK Government Website](https://data.gov.uk)** with **data collection** and verify with **data validation** to inspect the quality and logical weakness in data contents. The raw datasets in CSV format will be backup and import into PostgreSQL database with **data transformation**. The defects discovered such as inconsistency, incorrect and duplication in large datasets are eliminated with **data encoding**, **data normalization** and **data cleaning**. Ultimately, the unnormalized and unorganized data will be migrated into normalized table as new storage with **data migration** to establish excellent relational database management system freed from anomalies.  

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

| Repositories       | Description | 
| ------------- |:-------------:|

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
This project is still developing and maintaining as final year project and extend to Phase 2 in Multimedia University. 







