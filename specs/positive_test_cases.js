import page from '../resources/PageObjectModel.js'; 
import {data} from '../resources/data.js';

fixture('Positive test todo page')
    .page ('https://todomvc.com/examples/angular2/')
    .beforeEach(async t => {
        await t.maximizeWindow()
    })

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

});
