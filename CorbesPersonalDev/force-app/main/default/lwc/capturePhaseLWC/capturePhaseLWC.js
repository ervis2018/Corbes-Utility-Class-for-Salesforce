import { LightningElement } from 'lwc';

export default class CapturePhaseLWC extends LightningElement {
    handleButtonClick(event) {
        event.stopPropagation(); // Prevent the event from bubbling up
        console.log('Button clicked');
    }

    handleGrandParentClick() {
        console.log('Grandparent clicked (bubble phase)');
    }

    handleParentClick() {
        console.log('Parent clicked (bubble phase)');
    }

    renderedCallback() {
        const grandParent = this.template.querySelector('.grandParent');
        const parent = this.template.querySelector('.parent');
        const child = this.template.querySelector('.child');

        grandParent.addEventListener('click', this.handleGrandParentCapture.bind(this), { capture: true });
        parent.addEventListener('click', this.handleParentCapture.bind(this), { capture: true });
        child.addEventListener('click', this.handleChildCapture.bind(this), { capture: true });
    }

    handleGrandParentCapture(event) {
        console.log('Grandparent clicked (capture phase)');
    }

    handleParentCapture(event) {
        console.log('Parent clicked (capture phase)');
    }

    handleChildCapture(event) {
        console.log('Child clicked (capture phase)');
    }

    disconnectedCallback() {
        const grandParent = this.template.querySelector('.grandParent');
        const parent = this.template.querySelector('.parent');
        const child = this.template.querySelector('.child');

        grandParent.removeEventListener('click', this.handleGrandParentCapture.bind(this), { capture: true });
        parent.removeEventListener('click', this.handleParentCapture.bind(this), { capture: true });
        child.removeEventListener('click', this.handleChildCapture.bind(this), { capture: true });
    }
}