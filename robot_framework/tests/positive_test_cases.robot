*** Settings ***
Resource    ${CURDIR}/../resources/page_object_model.robot
Library     SeleniumLibrary
Library		OperatingSystem

*** Test Cases ***
test case 1: create a new task
	Open Browser							${url_base}						chrome
	Maximize Browser Window
	#Use 'wait until an element is visible' or 'wait until the page contains'—this is better than using sleeps or waits in the code.

	#preconditions: have a clean page without task
	Wait Until Page Contains Element     	${input_field}
	Page Should Contain						${page_header_text}
	#Validate doesn't exist a previus to do list
	Element Should Not Be Visible     		${todo_list}

	# actions/steeps add a new task
	Input new_task   						${task_1}

	#asertions and validations
	Element Should Be Visible				${todo_list}
	Page Should Contain						${task_1}
	Page Should Contain Checkbox			${checkbox_task1} 
	Checkbox Should Not Be Selected			${checkbox_task1}
	Page Should Contain Button				${destroy_button_task1}
	Element Should Be Visible				${todo_count}
	Page Should Contain						${todo_account_item1_text}
	Page Should Contain			 			${todo_account_text} 
    Close Browser

test case 2: Edit a task
	Open Browser							${url_base}						chrome
	Maximize Browser Window
	#preconditions; have at lets one task
	Wait Until Page Contains Element     	${input_field}
	Page Should Contain						${page_header_text}
	Element Should Not Be Visible     		${todo_list}
	Input new_task   						${task_1}
	
	#actions/steeps: edit the task
	Double Click Element					${item_1}
	Click Element  							${edit_item_1}
	Double Click Element					${edit_item_1}
	Press Keys								${None}							DELETE
	Input Text  							${edit_item_1} 					${task_2}
	Press Keys   							${edit_item_1}   				ENTER

	# assertions and validations
	Page Should Contain						${task_2}
	Page Should Not Contain					${task_1}
	Page Should Contain Checkbox			${checkbox_task1} 
	Checkbox Should Not Be Selected			${checkbox_task1}
	Page Should Contain Button				${destroy_button_task1}
	Element Should Be Visible				${todo_count}
	Close Browser
