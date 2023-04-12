import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  myFunction() {
    console.log("myFunction called");
    // document.getElementById("dropbtn").classList.toggle("show");
  }
}
