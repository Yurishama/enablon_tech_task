*** Settings ***
Resource    ${CURDIR}/../resources/page_object_model.robot
Library     SeleniumLibrary
Library		OperatingSystem

*** Test Cases ***
test case 1: create more than 20 task with 1024 characters
	Open Browser							${url_base}						chrome
	Maximize Browser Window
	#Use wait until an element is visible or wait until the page contains this is better than using sleeps or waits in the code.
	#preconditions: have a clean page without task
	Wait Until Page Contains Element     	${input_field}
	Page Should Contain						${page_header_text}
	#Validate doesn't exist a previus to do list
	Element Should Not Be Visible     		${todo_list}

	# actions/steps add a new task
    FOR    ${number}    IN RANGE    20
        Input new_task   					${task_1024_characters}
    END

	#asertions and validations
	Element Should Be Visible				${todo_list}
	Page Should Not Contain					${task_1}
	Page Should Contain Checkbox			${checkbox_task1} 
	Checkbox Should Not Be Selected			${checkbox_task1}
	Page Should Contain Button				${destroy_button_task1}
	Element Should Be Visible				${todo_count}
	Close Browser


test case 2: validate edit and fail task
	Open Browser							${url_base}					chrome
	Maximize Browser Window
	#Preconditions have at least one task to edit
	Wait Until Page Contains Element     	${input_field}
	Page Should Contain						${page_header_text}
	Element Should Not Be Visible     		${todo_list}
	Input new_task   						${task_1}

	#steps
	Double Click Element					${item_1}
	Click Element  							${edit_item_1}
	Double Click Element					${edit_item_1}
	Press Keys								${None}							DELETE
	Press Keys   							${edit_item_1}   				ENTER

	#Validations/assertions
	Element Should Not Be Visible     		${todo_list}
	Page Should Not Contain					${task_2}
	Page Should Not Contain					${task_1}
	Page Should Not Contain Checkbox		${checkbox_task1} 
	Close Browser

test case 3: Edit a task using only blanks
	Open Browser							${url_base}						chrome
	Maximize Browser Window
	#preconditions; have at lets one task
	Wait Until Page Contains Element     	${input_field}
	Page Should Contain						${page_header_text}
	Element Should Not Be Visible     		${todo_list}
	Input new_task   						${task_1}
	
	#actions/steps: edit the task
	Double Click Element					${item_1}
	Click Element  							${edit_item_1}
	Double Click Element					${edit_item_1}
	Press Keys								${None}							DELETE
	Press Keys   							${None}   						SPACE
	#Input Text  							${edit_item_1} 					${blanks} 
	Press Keys   							${edit_item_1}   				ENTER

	# assertions and validations
	Page Should Not Contain					${task_2}
	Page Should Not Contain					${task_1}
	Page Should Not Contain Checkbox		${checkbox_task1} 
	Element Should Not Be Visible     		${todo_list}
	Sleep			5s
	Close Browser

test case 4: add a task using blanks
	Open Browser							${url_base}						chrome
	Maximize Browser Window
	#preconditions: have a clean page without task
	Wait Until Page Contains Element     	${input_field}
	Page Should Contain						${page_header_text}
	#Validate doesn't exist a previus to do list
	Element Should Not Be Visible     		${todo_list}

	# actions/steps add a new task
	Input new_task   						${blanks} 

	#asertions and validations
	Element Should Be Visible				${todo_list}
	Page Should Not Contain					${task_1}
	Page Should Contain Checkbox			${checkbox_task1} 
	Checkbox Should Not Be Selected			${checkbox_task1}
	Page Should Contain Button				${destroy_button_task1}
	Element Should Be Visible				${todo_count}
	Page Should Contain						${todo_account_item1_text}
	Page Should Contain			 			${todo_account_text} 
	Close Browser

test case 5: create two task using special characters and code
	Open Browser							${url_base}						chrome
	Maximize Browser Window
	#preconditions: have two tasks
	Wait Until Page Contains Element     	${input_field}
	Page Should Contain						${page_header_text}
	Element Should Not Be Visible     		${todo_list}
	Input new_task   						${special_charters} 
	Input new_task   						${nodejs_code}
	Input new_task   						${special_charters} ${nodejs_code}

	#actions/steps
	Select Checkbox							${checkbox_task1} 

	#assertions and validationes
	Element Should Be Visible 	    		${todo_list}
	Page Should Contain						${special_charters} ${nodejs_code}
	Page Should Contain Checkbox			${checkbox_task1} 
	Element Should Be Visible				${todo_count}
	Close Browser

#This keywords operates as a function. 
#I've created a function to input task for example. 
# I believe that incorporating functions in your tests can enhance the clarity of your code
*** Keywords ***
Input new_task
	[Arguments]				${task_1}
	Input Text     			${input_field}    	${task_1}
	Press Keys   			${input_field}   	ENTER
