import page from '../resources/PageObjectModel.js'; 
import {data} from '../resources/data.js';

fixture('Positive test todo page')
    .page ('https://todomvc.com/examples/angular2/')

test('Test case 1: create a new task', async t => {

    await t
        .maximizeWindow()
        .typeText(page.input_field,data.task1)
        .pressKey('enter')

    await t
        .expect(page.todo_list.exists).ok()
        .expect(page.item_1.exists).ok()
        .expect(page.item_1.innerText).eql(data.task1)
        .expect(page.checkbox_task1.checked).eql(false)
        .expect(page.destroy_button_task1.exists).ok();

});

test('Test case 2: modificar a task', async t => {

    await t
        .typeText(page.input_field,data.task1)
        .pressKey('enter')
        .doubleClick(page.item_1)
        .click(page.edit_item_1)
        .selectText(page.edit_item_1)
        .pressKey('delete')
        .typeText(page.edit_item_1,data.task2)
        .pressKey('enter')


    await t
        .expect(page.todo_list.exists).ok()
        .expect(page.item_1.exists).ok()
        .expect(page.item_1.innerText).eql(data.task2)
        .expect(page.checkbox_task1.checked).eql(false)
        .expect(page.destroy_button_task1.exists).ok();
});

