# Test using Robot Framework

## Table of Contents
- [Getting Started](#getting-started)
- [Prerequisites](#prerequisites)
- [Usage](#usage)


### Getting Started

This is an exercise to conduct tests in this [TODOS page](https://todomvc.com/examples/angular2/)

These are the tests that are run in this folder using test cafe

Positive tests
- Test Case 1: Create a new task
- Test case 2: Edit a task
- Test Case 3: Check the task and mark it as done
- Test Case 4: Delete existing task
- Test Case 5: Add more than one task

Negative tests
- Test case 1: create more tan 20 taks with 1024 characters
- Test case 2: edit and fail task
- Test case 3: Edit a task using only blanks
- Test Case 4: Add new task using blancks
- Test Case 5: Create two task using spechial characters and code

### Prerequisites

- Have Docker previously installed

### Usage

- Pull the image [ppodgorsek/robot-framework](https://hub.docker.com/r/ppodgorsek/robot-framework#running-the-container)
- Run this command in terminal

```
docker run -v $(pwd)/logs:/var/log:Z -v $(pwd)/reports:/opt/robotframework/reports:Z -v $(pwd)/tests:/opt/robotframework/tests:Z -v $(pwd)/resources:/opt/robotframework/resources:Z -e BROWSER=chrome ppodgorsek/robot-framework 
```

In case you want to run this local

It is necessary to have installed
- Python
- Robot Framewor
- Selenium library

and change this in each file
```
***Settings***
Resource ${CURDIR}/../resources/page_object_model.robot
```
by
```
***Settings***
Resource ../resources/page_object_model.robot
```