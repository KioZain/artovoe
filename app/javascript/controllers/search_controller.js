import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    static targets = ['query','submit'];


    initialize(){
        console.log("search init")

    }
    connect(){
        console.log("Search controller connected")
    }



    getSearch(e){
        e.preventDefault();
        const url = this.element.action;
        const query = this.queryTarget.value 
        // console.log(this.element.action);

        window.location.href = `${url}?query=${query}`
    }
}