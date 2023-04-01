import { LightningElement } from 'lwc';

export default class AppendHTML extends LightningElement {

    
    handleClick() {
        // create a new list item element
        var newElement = document.createElement("li");
    
        // set the content of the new element using innerHTML
        newElement.innerHTML = "New list item";
    
        // get a reference to the unordered list element
        var existingNode = this.template.querySelector('.myList');
    
        // append the new element to the unordered list
        try {
            existingNode.appendChild(newElement);
        } catch (error) {
            alert(error);
        }
        
      }


      handleParagraph() {
        // get a reference to the title element
        var titleElement = this.template.querySelector('.myTitle');
    
        // get a reference to the paragraph element
        var paragraphElement = this.template.querySelector('.myParagraph');
    
        // update the title and paragraph elements
        if (titleElement && paragraphElement) {
          titleElement.innerHTML = "New title";
          paragraphElement.innerHTML = "New text";
        } else {
          console.error("Element not found in template");
        }
      }
}