# Test of a website that creates a to-do list

This is an exercise to conduct tests in this [TODOS page](https://todomvc.com/examples/angular2/)
Basically, these tests review the main functionality of this page, which is to create a list of tasks to do.

## Table of Contents
- [Getting Started](#getting-started)
- [Prerequisites](#prerequisites)
- [Usage](#usage)
- [Contact](#contact)


### Getting Started
These tests are executed in two different frameworks:
 - [Testcafe](https://testcafe.io/) (Javascript) 
 - [Robot framework](https://robotframework.org/) (Python)

Both frameworks help to automate tests easily. Each framework is separated by folders.


├── robot_framework
│   ├── reports     
│   ├── resources      
│   └── test  
│       ├── negative test cases
│       └── positive test cases             
└── testcafe    
   ├── resources      
   ├── screenshots  
   └── specs  
       ├── negative test cases
       └── positive test cases 

Inside each folder, there is a subfolder named "resources" where the object model of the page is stored. The selectors/locators for the objects with which the page interacts are referenced there, and the data used for testing is also located in that folder.

In the future, as a good practice, I could use improved selectors and locators. Additionally, I could consider incorporating libraries such as "fake" or "faker" to assist in generating random data that can support the tests.

There are also folders named "tests," where two scripts are housed: positive tests and negative tests.

Speaking of reports, each framework has its own way of reporting the final status of the tests. Personally, I like to use Allure report. At the moment, I cannot find the configurations to use this type of report yet.


### Prerequisites
It is necessary to have [Docker](https://www.docker.com/) installed. 

I try to configure this project so that it can be executed using Docker on any machine with any operating system, without the need to install anything prior, other than having Docker.

In previous companies where I have worked, I prefer my tests to be executed within containers because this later helps with the configurations needed in tools like Jenkins or TeamCity.


### Usage
Each folder contains its own readme where instructions for using each framework come.

### Contact
email: yurishama@gmail.com


