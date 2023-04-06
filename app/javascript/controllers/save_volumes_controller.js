import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="save-volumes"
export default class extends Controller {
  static targets = ["form"]

  connect() {
    console.log("hello controller")
  }

  send(event) {
    event.preventDefault();
    console.log("sending");
    fetch(this.formTarget.action, {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: new FormData(this.formTarget)
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data)
      })
  }
}
