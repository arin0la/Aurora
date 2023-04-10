import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="set-volume"
export default class extends Controller {
  static targets = ["audio"]

  connect() {
    this.audioTargets.forEach((ele) => {
      // divide by 100 because it was stored as integer
      ele.volume = ele.dataset.volume / 100;
      console.log(ele.volume);
    })
  }

  playmix() {
    this.audioTargets.forEach(audio => audio.play())
  }
}
