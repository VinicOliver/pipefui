import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  add() {
    const field = document.getElementsByClassName('field')
    const indexLastElement = field.length - 1
    const indexNextElement = (Number(field[indexLastElement].dataset.index) + 1)
    const newField = field[0].cloneNode(true)

    newField.innerHTML = newField.innerHTML.replaceAll('0', indexNextElement)
    newField.dataset.index = indexNextElement
    document.getElementById('fields').appendChild(newField)
  }

  remove(event) {
    let index = event.target.dataset.index
    let element = document.querySelector('div.field[data-index="' + index + '"]');

    element.style.display = 'none'    
    document.getElementById(`destroy_field_${index}`).value = true
  }
}
