# Test using Testcafe

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
- Test case 1: create a new task 20 times
- Test case 2: edit and fail
- Test case 3: Edit a task using whitespace
- Test Case 4: Create a task using special characters and code


### Prerequisites

- Have Docker previously installed

### Usage

- Pull the image [testcafe/testcafe](dhttps://hub.docker.com/r/testcafe/testcafe)
- Run this command in terminal

```
ddocker run -v $(pwd)/specs:/tests -v $(pwd)/resources/:/resources -it testcafe/testcafe firefox
```

In case you want to run this local

It is necessary to have installed
- NodeJS (make sure npm is installed)
- [Testcafe](https://testcafe.io/documentation/402834/guides/basic-guides/install-testcafe) (npm install testcafe )

and run this
```
testcafe chrome specs/*.js

```

If you want screenshots when fail run this
```
testcafe chrome specs/*.js -s takeOnFails=true

```



