
let valueA = ""
let valueB = ""
let operator = ""

let display = document.querySelector(".display")

const buttonNumber = document.querySelectorAll(".buttonN")
const buttonOperator = document.querySelectorAll(".buttonO")
const buttonEqual = document.querySelector(".button-equal")
const buttonClear = document.querySelector(".button-clear")


for (let i = 0; i < buttonOperator.length; i++) {
    buttonOperator[i].addEventListener("click", () => {
        if (operator == ""){
            operator = buttonOperator[i].id
        }
        else if (operator != ""){
            if (operator === "+" ) {
                valueA = Number(valueA) + Number(valueB)
                display.textContent = valueA
                valueB = ""
                operator = buttonOperator[i].id
            }
            else if (operator === "-" ) {
                valueA = Number(valueA) - Number(valueB)
                display.textContent = valueA
                valueB = ""
                operator = buttonOperator[i].id
            }
            else if (operator === "*" ) {
                valueA = Number(valueA) * Number(valueB)
                display.textContent = valueA
                valueB = ""
                operator = buttonOperator[i].id
            }
            else if (operator === "/" ) {
                valueA = Number(valueA) / Number(valueB)
                valueA = valueA.toFixed(2)
                display.textContent = valueA
                valueB = ""
                operator = buttonOperator[i].id
            }
            else {
                display.textContent = valueA
            }
        }
    })
}

for (let i = 0; i < buttonNumber.length; i++) {
    buttonNumber[i].addEventListener("click", () => {
        if ( operator == "") {
            valueA += buttonNumber[i].id
            display.textContent = valueA
        }
        else if ( operator != ""){
            valueB += buttonNumber[i].id
            display.textContent = valueB
        }
    })
}

buttonEqual.addEventListener("click", () => {
    if (operator === "+" ) {
        valueA = Number(valueA) + Number(valueB)
        display.textContent = valueA
        valueB = ""
    }
    else if (operator === "-" ) {
        valueA = Number(valueA) - Number(valueB)
        display.textContent = valueA
        valueB = ""
    }
    else if (operator === "*" ) {
        valueA = Number(valueA) * Number(valueB)
        display.textContent = valueA
        valueB = ""
    }
    else if (operator === "/" ) {
        valueA = Number(valueA) / Number(valueB)
        valueA = valueA.toFixed(2)
        display.textContent = valueA
        valueB = ""
    }
    else {
        display.textContent = valueA
    }
})

buttonClear.addEventListener("click", () => {
    valueA = ""
    valueB = ""
    operator = ""
    display.textContent = "0"
})


function add(a, b) {
    console.log(a + b)
}
function subtract(a, b) {
    console.log(a - b)
}
function multiply(a, b) {
    console.log(a * b)
}
function divide(a, b) {
    console.log(a / b)
}

