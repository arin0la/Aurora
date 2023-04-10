import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="save-volumes"
export default class extends Controller {
  static targets = ["form", "volumesData", "sound"]


  connect() {
    console.log("hello controller")
    console.log(this.volumesDataTarget)
    document.querySelectorAll("audio").forEach((ele) => {
      ele.volume = 0;
      ele.autoplay = true;
      ele.play();
      console.log("playing")
    })
  }

  change() {
    const volumes = {};
    this.soundTargets.forEach((ele) => {
      volumes[`${ele.id}`] = ele.volume
    });
    this.volumesDataTarget.value = JSON.stringify(volumes);
    console.log(this.volumesDataTarget)
  }

  send(event) {
    event.preventDefault();
    const volumes = {};
    document.querySelectorAll("audio").forEach((ele) => {
      console.log("a")
      volumes[`${ele.id}`] = ele.volume
    })
    console.log(volumes);
    this.volumesDataTarget.value = JSON.stringify(volumes);
    console.log(this.volumesDataTarget);
  }
}
