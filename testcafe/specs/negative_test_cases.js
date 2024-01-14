import page from '../resources/PageObjectModel.js'; 
import {data} from '../resources/data.js';

fixture('Negativetest to do page')
    .page ('https://todomvc.com/examples/angular2/')

test('Test case 1: create new task 20 times', async t => {
    await t

        for (let i = 0; i < 20; i++) {
            await t
            .typeText(page.input_field,data.task1)
            .pressKey('enter')
          }

    await t
        .expect(page.todo_list.exists).ok()
        .expect(page.item_1.exists).ok()
        .expect(page.item_1.innerText).eql(data.task1)
        .expect(page.checkbox_task1.checked).eql(false)
        .expect(page.destroy_button_task1.exists).ok();
});

test('Test case 2: make edit and fail', async t => {
    await t
    .typeText(page.input_field,data.task1)
    .pressKey('enter')
    .doubleClick(page.item_1)
    .click(page.edit_item_1)
    .selectText(page.edit_item_1)
    .pressKey('delete')
    .pressKey('enter')

await t
    .expect(page.todo_list.exists).notOk()
    .expect(page.item_1.exists).notOk()
    .expect(page.destroy_button_task1.exists).notOk();
});

test('Test case 3: edit a task using blanks', async t => {
    await t
        .typeText(page.input_field,data.task1)
        .pressKey('enter')
        .doubleClick(page.item_1)
        .click(page.edit_item_1)
        .selectText(page.edit_item_1)
        .pressKey('delete')
        .typeText(page.edit_item_1,"   ")
        .pressKey('enter')

        await t
        .expect(page.todo_list.exists).notOk()
        .expect(page.item_1.exists).notOk()
        .expect(page.destroy_button_task1.exists).notOk();
});

test('Test case 4: create a task using special characters and code', async t => {
    await t
        .typeText(page.input_field,data.task_special)
        .pressKey('enter')
        .typeText(page.input_field,data.task_code)
        .pressKey('enter')

    await t
        .expect(page.todo_list.exists).ok()
        .expect(page.item_1.exists).ok()
        .expect(page.item_1.innerText).eql(data.task_special)
        .expect(page.checkbox_task1.checked).eql(false)
        .expect(page.destroy_button_task1.exists).ok();
});
