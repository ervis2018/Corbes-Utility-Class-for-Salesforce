import { LightningElement } from 'lwc';

export default class BubbleExample extends LightningElement {
    handleClick(event) {
        console.log('Clicked on the container for bubble!');
        // Check if the event target is a box element
        if (event.target.classList.contains('box')) {
            // Get the background color of the box element
            const color = window.getComputedStyle(event.target).backgroundColor;

            // Log the background color to the console
            console.log(`Clicked on a ${color} box!`);
        }
        console.log('Clicked on the container for bubble!');
    }

    renderedCallback() {
        setTimeout(() => {
            const parent = this.template.querySelector('.parent');
            const child = this.template.querySelector('.child');
    
            parent.addEventListener('click', function() {
                console.log('Click event handled by parent element');
            });
    
            child.addEventListener('click', function() {
                console.log('Click event handled by child element');
            });
        }, 0);

    }
}
