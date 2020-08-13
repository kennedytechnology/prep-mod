import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["newItemId", "newItemDetails", "detailRow"]

  connect() {
    this.updateDetails()
  }

  updateDetails(){
    var selectedNewItemId = this.newItemIdTarget.value
    var visibleDetails = this.newItemDetailsTargets.filter(function(el){return el.dataset["id"] == selectedNewItemId})
    var visibleDetailRows = this.detailRowTargets.filter(function(el){return document.getElementById("clinic_supply_inventory_ids_" + el.dataset["id"]).checked})


    this.newItemDetailsTargets.forEach(function(el){ el.classList.add("hidden") })
    this.detailRowTargets.forEach(function(el){ el.classList.add("hidden") })
    visibleDetails.forEach(function(el){ el.classList.remove("hidden") })
    visibleDetailRows.forEach(function(el){ el.classList.remove("hidden") })

  }

  addItem(){
    if(document.getElementById("clinic_supply_inventory_ids_" + this.newItemIdTarget.value).checked) {
      alert("You've already added this item to this clinic.")
    }
    document.getElementById("clinic_supply_inventory_ids_" + this.newItemIdTarget.value).checked = true
    this.updateDetails();
  }

  removeItem(event){
    document.getElementById("clinic_supply_inventory_ids_" + event.currentTarget.dataset.id).checked = false
    this.updateDetails();
  }

}