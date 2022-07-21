import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static values = {
    key: String,
  };

  fire(event) {
    if (event.key == this.keyValue) {
      this.element.click();
    }
  }
}
