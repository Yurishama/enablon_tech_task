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
    #none is a fake variable
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

test case 3: check item or task mark like done
	Open Browser							${url_base}						chrome
	Maximize Browser Window
	#preconditions: have at leats one task to check
	Wait Until Page Contains Element     	${input_field}
	Page Should Contain						${page_header_text}
	Element Should Not Be Visible     		${todo_list}
	Input new_task   						${task_1}
	Element Should Be Visible				${todo_list}
	Page Should Contain						${task_1}
	Page Should Contain Checkbox			${checkbox_task1} 

	# acctions/steeps: check the task
	Select Checkbox							${checkbox_task1} 
	#assertions and validations
	#Some elements change like text "item or items lef" after click checkbox
	Page Should Contain Checkbox			${checkbox_task1} 
	Checkbox Should Be Selected				${checkbox_task1}
	Page Should Contain Button				${destroy_button_task1}
	Element Should Be Visible				${todo_count}
	Element Should Be Visible				${clean_completed_button}
	Page Should Not Contain			 		${todo_account_text} 
	Element Should Be Visible				${todo_count}
	Page Should Not Contain					${todo_account_item1_text}
	Close Browser	

#This keywords operates as a function. 
#I've created a function to input task for example. 
# I believe that incorporating functions in your tests can enhance the clarity of your code
*** Keywords ***
Input new_task
	[Arguments]				${task_1}
	Input Text     			${input_field}    	${task_1}
	Press Keys   			${input_field}   	ENTER