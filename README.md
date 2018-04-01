Final Year Project
==================

> The project focus on utilize **concurrent programming concepts** of **Go and Rust programming language** on data processing activities with **PostgreSQL database** as data storage. 

*** 

Table Of Contents 
=================

  * [Final Year Project Phase 1](#final-year-project-phase-1)
  * [Table Of Contents](#table-of-contents)
  * [Introduction](#introduction)
  * [Getting Started](#getting-started) 
    * [Documentation](#documentation)
    * [File Description](#file-description)
    * [Infrastructure Setup and Installation](#infrastructure-setup-and-installation)
  * [Highlight](#highlight)
    * [Software Resources](#software-resources)
    * [Performance Comparison Outcomes](performance-comparison-outcomes)
  * [About](#about) 
    * [Contributor](#contributor)
    * [Status](#status)
    
*** 

Introduction
============

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Go is an excellent language that possesses wide range of applicability. It has generous support for **concurrency** and **exploits multi-core with goroutines and channels**. Other than that, it owns **garbage collector** as the language automatically freed memory and resources after utilized the memory. It’s **simplicity** with standardized formatting and naming through several built-in packages with minimalistic language makes the code readable and maintainable.  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Data collection is conducted to obtain various free, consent and big datasets from UK government websites that contains up to 5865567 rows. Moreover, the big data acquired are checked, prepared and clean with **Devil Advocation Test** to verify data quality dimension include **Completeness**, **Uniqueness** and **Validity**.  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;These raw data are parsed and import from CSV files to PostgreSQL database with Go program. The **performance** of data retrieval from **CSV files** and **PostgreSQL database** are measured during the data processing. **Amount of queries, database table configurations and hardware configurations** were benchmarked to achieve **fairness** in performance comparison.   

In FYP Phase 1, we develop a **proof of concepts (POC)** that only process 300 rows of data in order to proof the implementation and design. Afterwards, the project will continue to implement with program that process all rows of data in phase 2.  

***

Getting Started
===============
Documentation
-------------
The documentation contains:-  
1. Introduction contains project brief description and project scope. 
2. Literature Review 
3. Project Design
4. Implementation Methodology 
5. Implementation Plan 
6. Results and Findings 
7. Comparison Discussion and Recommendations  

Download the document **[HERE](https://github.com/CodesAreHonest/fyp1-sequential-vs-concurrent/blob/master/doc/FYP1.pdf)**

File Description
-----------------  
The purpose of files contain in repository are explained in table below: 

| File Name        | Description | 
| ------------- |:-------------:|
| import-csv-psql.go        | This program import 300 rows of data from different raw CSV datasets into PostgreSQL database | 
| sequential-psql.go        | This program read 300 rows of data **sequentially** from different tables contain in PostgreSQL database      | 
| concurrent-psql.go        | This program read 300 rows of data **concurrently** from different tables contain in PostgreSQL database      | 
| sequential-read-csv.go    | This program read 300 rows of data **sequentially** from different raw CSV datasets contain in same node      | 
| concurrent-read-csv.go    | This program read 300 rows of data **concurrently** from different raw CSV datasets contain in same node      | 

Infrastructure Setup and Installation 
-------------------------------------
1. Install Go Programming Language according to the [Golang Official Documentation](https://golang.org/doc/install).  

2. Clone the sourcecode with Git: 
```sh 
$ git clone https://github.com/CodesAreHonest/fyp1-sequential-vs-concurrent.git
```

3. Change directory into the cloned src file and verified the contains file: 
```
$ cd ~/fyp1-sequential-vs-concurrent/src/FYP1/
$ ls -l 
-rw-rw-r-- 1 yinghua yinghua 5487 Sep 17 23:25 concurrent-psql.go
-rw-rw-r-- 1 yinghua yinghua 3585 Dec  8 13:50 concurrent-read-csv.go
-rw-rw-r-- 1 yinghua yinghua 5161 Dec  8 13:46 import-csv-psql.go
-rw-rw-r-- 1 yinghua yinghua 2308 Sep 18 13:29 importdb.go
-rw-rw-r-- 1 yinghua yinghua 4728 Sep 17 23:20 sequential-psql.go
-rw-rw-r-- 1 yinghua yinghua 3015 Dec  8 13:44 sequential-read-csv.go
```

4. Compile and run the go files: 
``` sh 
$ go build concurrent-psql.go 
$ time go run concurrent-psql.go 
```   

*** 

Highlight
=========
Software Resources
------------------
1. Linux Ubuntu 16.04.3 LTS 64-bit.  
2. Golang language compiler 1.8.3.  
3. Rust language compiler 1.20.0.  
4. PostgreSQL database 9.5.8.  
5. Eclipse for Parallel Application Developers Oxygen Release (4.7.0) IDE.  
6. TeXstudio 2.10.8.  
7. Visual Paradigm 14.1 free edition for non-commercial use.  

Performance Comparison Outcomes
------------------------------- 
The program is implemented with **Thread.sleep()** in several functions to proof the concurrency capabilities of Go programming language on data proccesing.  
  
The result of performance comparison of data retrieval on raw CSV files are shown in table below:  
  
| Elapsed Time       | sequential-read-csv.go | concurrent-read-csv.go |
| -------------      |:----------------------:| :--------------------: | 
| real               | 6.285s                 | 2.243s                 |
| user               | 0.316s                 | 0.264s                 |
| sys                | 0.056s                 | 0.044s                 |  

The result of performance comparison of data retrieval on PostgreSQL database are shown in table below: 

| Elapsed Time       | sequential-psql.go     | concurrent-psql.go     |
| -------------      |:----------------------:| :--------------------: | 
| real               | 6.252s                 | 2.268s                 |
| user               | 0.272s                 | 0.244s                 |
| sys                | 0.032s                 | 0.076s                 |  

*** 

About
=====
Contributor
-----------
- **Chai Ying Hua** 

Status
------
This project is still developing and maintaining as final year project and extend to Phase 2 in Multimedia University. 







