import { Selector} from 'testcafe';

class Page{
    constructor () {
        this.input_field = Selector('body > todo-app > section > header > input');
        this.todo_list = Selector('body > todo-app > section > section > ul');
        this.checkbox_task1 = Selector('body > todo-app > section > section > ul > li > div > input');
        this.item_1 = Selector('body > todo-app > section > section > ul > li > div > label');
        this.item1_list = Selector('label').withText('Walk with doggy')
        this.destroy_button_task1 = Selector('body > todo-app > section > section > ul > li > div > button');
        this.edit_item_1 = Selector('body > todo-app > section > section > ul > li > input')
        this.clean_completed_button = Selector('footer button').withText('Clear completed')

    }
}

export default new Page();


/*** Variables ***
${url_base}                 https://todomvc.com/examples/angular2/
${page_header_text}         todos
${input_field}              xpath=/html/body/todo-app/section/header/input
${todo_list}                xpath=/html/body/todo-app/section/section/ul
${task_1}                   Exercise
${task_2}                   Yoga session
${item_1}                   xpath=/html/body/todo-app/section/section/ul/li/div/label
${edit_item_1}              xpath=/html/body/todo-app/section/section/ul/li/input
${checkbox_task1}           xpath=/html/body/todo-app/section/section/ul/li/div/input
${destroy_button_task1}     xpath=/html/body/todo-app/section/section/ul/li/div/button
${todo_count}               xpath=/html/body/todo-app/section/footer/span
${todo_account_text}        item left
${todo_account_item1_text}        1 item left
${todo_account_item0_text}        0 items left
${clean_completed_button}   xpath=/html/body/todo-app/section/footer/button
${blanks}                   "       "
${special_charters}         |°¬!|""#$%&/()=¬${/}
${nodejs_code}              console.log("test")
*/