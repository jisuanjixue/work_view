import { Controller } from "@hotwired/stimulus";
import { createPopup } from "@picmo/popup-picker";
import { RichText } from "../classes/RichText";

export default class extends Controller {
    static targets = ["trixEditor", "pickerContainer"]
    connect() {
        const buttonString = `<button class="trix-button" id="emoji-picker" data-trix-action="popupPicker" tabindex="1">😀</button>`
        const emojiButton = this.emojiButtonTemplate(buttonString);
        let picker;
        let richText = new RichText(picker, emojiButton);
        picker = createPopup(
            {
                rootElement: this.pickerContainerTarget,
            },
            {
                // The element that triggers the popup
                triggerElement: emojiButton,
                // The element to position the picker relative to - often this is also the trigger element,
                referenceElement: emojiButton,
                // specify how to position the popup
                position: "bottom-start",
            }
        );
        picker.addEventListener("emoji:select", (event) => {
            this.trixEditorTarget.editor.insertString(event.emoji);
        });

        richText.setPicker(picker);
    }

    emojiButtonTemplate(buttonString) {
        const domParser = new DOMParser();
        const emojiButton = domParser
            .parseFromString(buttonString, "text/html")
            .querySelector("button");
        return emojiButton;
    }
}