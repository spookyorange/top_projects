let container = document.querySelector(".container")



let gridRowColumn = 16


times = gridRowColumn * gridRowColumn

container.style = `display: grid; grid-template-columns: repeat(${gridRowColumn}, 1fr); grid-template-rows: repeat(${gridRowColumn}, 1fr); width: 50vh; height: 50vh; margin-left: auto; margin-right: auto; margin-top: 3%;`


for ( i = 0; i < times; i++ ) {
    let i = document.createElement("div")
    i.style = "border: black solid 1px"
    container.appendChild(i)
    i.addEventListener("mouseover", () => {
        i.style.backgroundColor = "black"
    })
}


let btn = document.querySelector(".btn")

btn.addEventListener("click", () => {
    container.innerHTML = ""
    gridRowColumn = prompt("y * y : y = ?", "16")
    if ( gridRowColumn < 80) {
        times = gridRowColumn * gridRowColumn

        container.style = `display: grid; grid-template-columns: repeat(${gridRowColumn}, 1fr); grid-template-rows: repeat(${gridRowColumn}, 1fr); width: 50vh; height: 50vh; margin-left: auto; margin-right: auto; margin-top: 3%;`


            for ( i = 0; i < times; i++ ) {
                let i = document.createElement("div")
                i.style = "border: black solid 1px"
                container.appendChild(i)
                i.addEventListener("mouseover", () => {
                    i.style.backgroundColor = "black"
                })
            }
    }
    else {
        alert("enter a valid value")
    }


})
