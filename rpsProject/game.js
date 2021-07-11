
let rockPaperScissors = ["Rock", "Paper", "Scissors"];



var playerSelect // = "scIssOrS"


let rock = document.querySelector(".rock")
let paper = document.querySelector(".paper")
let scissors = document.querySelector(".scissors")

rock.addEventListener("click", () => {
    playerSelect = "Rock"
})
paper.addEventListener("click", () => {
    playerSelect = "Paper"
})
scissors.addEventListener("click", () => {
    playerSelect = "Scissors"
})



let countForComp = 0
let countForPlay = 0


const countPlayer = document.querySelector(".count-player")
const countComputer = document.querySelector(".count-computer")
countComputer.innerHTML = countForComp
countPlayer.innerHTML = countForPlay









var computerSelect 

function computerPlay(){
    computerSelect = rockPaperScissors[Math.floor(Math.random()*3)]
}

let announcement = document.querySelector(".announcement")


function exampleGame(playerSelect, computerSelect) {
    if (playerSelect === computerSelect) {
        announcement.innerHTML = "Draw !"
    }
    else if (playerSelect == "Scissors" && computerSelect == "Rock") {
        announcement.innerHTML = `You lose ! ${computerSelect} beats ${playerSelect}`
        countForComp += 1
        countComputer.innerHTML = countForComp
    }
    else if (playerSelect == "Scissors" && computerSelect == "Paper") {
        announcement.innerHTML =`You win ! ${playerSelect} beats ${computerSelect}`
        countForPlay += 1
        countPlayer.innerHTML = countForPlay
    }
    else if (playerSelect == "Paper" && computerSelect == "Rock") {
        announcement.innerHTML = `You win ! ${playerSelect} beats ${computerSelect}`
        countForPlay += 1
        countPlayer.innerHTML = countForPlay
    }
    else if (playerSelect == "Paper" && computerSelect == "Scissors") {
        announcement.innerHTML = `You lose ! ${computerSelect} beats ${playerSelect}`
        countForComp += 1
        countComputer.innerHTML = countForComp
    }
    else if (playerSelect == "Rock" && computerSelect == "Paper") {
        announcement.innerHTML = `You lose ! ${computerSelect} beats ${playerSelect}`
        countForComp += 1
        countComputer.innerHTML = countForComp
    }
    else if (playerSelect == "Rock" && computerSelect == "Scissors") {
        announcement.innerHTML = `You win ! ${playerSelect} beats ${computerSelect}`
        countForPlay += 1
        countPlayer.innerHTML = countForPlay
    }
}

let winner = document.querySelector(".winner")

function coun() {
    if( countForComp == 5 ) {
        winner.textContent = "Computer won ! f5 to start again"
    }
    else if ( countForPlay == 5 ) {
        winner.textContent = "Player won ! f5 to start again"
    }
}


function game(){
    computerPlay()
    exampleGame(playerSelect, computerSelect)
    coun()
}

let buton = document.querySelector(".buton")
buton.addEventListener("click", () => {
    game(playerSelect, computerSelect)
})
let buotn = document.querySelector(".buotn")
buotn.addEventListener("click", () => {
    game(playerSelect, computerSelect)
})
let botun = document.querySelector(".botun")
botun.addEventListener("click", () => {
    game(playerSelect, computerSelect)
})


