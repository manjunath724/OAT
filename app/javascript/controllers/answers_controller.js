import { Controller } from "stimulus"

export default class extends Controller {
  // Read more about targets in the Stimulus reference guide: https://stimulusjs.org/reference/targets
  static targets = ["answerList"]

  // The connect lifecycle method runs each time our controller is connected to the DOM
  // Read more about lifecycle methods in the Stimulus reference guide: https://stimulusjs.org/reference/lifecycle-callbacks
  connect() {
    // console.log("We're connected!")
  }

  createSuccess(event) {
    const [data, status, xhr] = event.detail
    const target = event.target

    // Create a wrapper div to hold our newly created comment
    const newAnswer = document.createElement("div")

    // Add our animation class to the wrapper div and set the innerHTML to the comment rendered by the server
    newAnswer.classList.add("fade-in-left")
    newAnswer.innerHTML = xhr.response

    // Add our wrapped comment to the beginning of the comment list
    target.parentNode.append(newAnswer)
    target.remove()

    // After the animation finishes (in 0.6 seconds), remove our animation class
    // If we don't remove the animation class, adding another comment will cause every comment added since our initial page load to animate together
    setTimeout(() => {
      newAnswer.classList.remove("fade-in-left")
    }, 600);
  }
}
