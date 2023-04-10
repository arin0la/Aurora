import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="set-volume"
export default class extends Controller {
  static targets = ["audio"]

  connect() {

    this.audioTargets.forEach((ele) => {
      ele.volume = ele.dataset.volume / 100;
      console.log(ele.volume);
    })
  }

  playmix() {
    this.audioTargets.forEach((ele) => {
      ele.play();
    })
  }
}
