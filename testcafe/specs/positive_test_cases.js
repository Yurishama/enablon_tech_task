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

test('Test case 2: edit task', async t => {
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

test('Test case 3: check task and mark as done', async t => {
    await t
        .typeText(page.input_field,data.task1)
        .pressKey('enter')
        .click(page.checkbox_task1)

    await t
        .expect(page.todo_list.exists).ok()
        .expect(page.item_1.exists).ok()
        .expect(page.clean_completed_button.exists).ok()
        .expect(page.checkbox_task1.checked).eql(true)
        .expect(page.destroy_button_task1.exists).ok();
});

test('Test case 4: delete exists task', async t => {
    await t
        .typeText(page.input_field,data.task1)
        .pressKey('enter')
        .hover(page.item_1)
        .click(page.destroy_button_task1)

    await t
        .expect(page.todo_list.exists).notOk()
        .expect(page.item_1.exists).notOk()
        .expect(page.clean_completed_button.exists).notOk()
});

test('Test case 5: add more than one task', async t => {
    await t
        .typeText(page.input_field,data.task1)
        .pressKey('enter')
        .typeText(page.input_field,data.task2)
        .pressKey('enter')


        await t
        .expect(page.todo_list.exists).ok()
        .expect(page.item_1.exists).ok()
        .expect(page.item_1.innerText).eql(data.task1)
        .expect(page.checkbox_task1.checked).eql(false)
        .expect(page.destroy_button_task1.exists).ok();
});
