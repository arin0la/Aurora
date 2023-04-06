import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="save-volumes"
export default class extends Controller {
  static targets = ["form"]

  connect() {
    console.log("hello controller")
    document.querySelectorAll("audio").forEach((ele) => {
      ele.volume = 0
    })
  }

  send(event) {
    event.preventDefault();
    const volumes = {};
    document.querySelectorAll("audio").forEach((ele) => {
      console.log("a")
      volumes[`${ele.id}`] = ele.volume
    })
    console.log(volumes);
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
