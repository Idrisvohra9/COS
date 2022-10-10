let Contacts = document.getElementById("Contacts");
const ContactArr = [];
const Contact = {
  CName: "",
  Cno: "",
};

// This array stores recent calls:
const RecentCallsArr = [];

let addContact = document.getElementById("addContact");
let moreOpts = document.getElementById("moreOpts");

let Contact_page = document.getElementById("C");
let Name = document.getElementById("Name");
let Num = document.getElementById("Number");

// Tabs Stuff:
document.getElementsByClassName("tabs")[2].click();
let tabContents = document.getElementsByClassName("tab-contents");

for(c= 1;c<tabContents.length;c++){
  tabContents[c].style.display = "none";
}

// n is the Num of contacts the ContactArr will contain. Every time a new contact is added the value of n will be incremented by 1.
let n = 0;
let n2 = 0;
document.addEventListener("load", DefaultContact());

function DefaultContact() {
  Name.value = "Jay Dave";
  Num.value = "929292922";
  makeNewContacts();

}

function openTab(e) {
  let tabs = document.getElementsByClassName("tabs");
  let c = document.getElementById("c");
  let r = document.getElementById("r");
  let k = document.getElementById("k");
  let currnt = e.currentTarget;  

  if(currnt.innerText == "Recent"){
    c.style.display = "none";
    k.style.display = "none";
    r.style.display = "";
  }

  else if(currnt.innerText == "Keypad"){
    c.style.display = "none";
    r.style.display = "none";
    k.style.display = "";
  }

  else{
    r.style.display = "none";
    k.style.display = "none";
    c.style.display = "";
  }
  for (let i = 0; i < tabs.length; i++) {
    tabs[i].className = tabs[i].className.replace(" active", "");
  }

  // console.log(currnt);
  currnt.className += " active";
}

function SearchContacts() {
  let hide1 = document.getElementsByClassName("subHeads")[0];
  let hide2 = document.getElementsByClassName("Users-contact")[0];

  hide1.style.display = "none";
  hide2.style.display = "none";
  var input, filter, CName, CNum;
  input = document.getElementById("search");

  filter = input.value.toUpperCase();

  c = document.getElementsByClassName("contact");

  for (let i = 0; i < c.length; i++) {
    CName = c[i].children[1].innerHTML;
    CNum = c[i].children[2].innerHTML;

    if (CName.toUpperCase().indexOf(filter) > -1 || CNum.toUpperCase().indexOf(filter) > -1) {
      c[i].style.display = "";
    } else {
      c[i].style.display = "none";
    }
  }
  if (input.value == "") {
    hide1.style.display = "flex";
    hide2.style.display = "flex";
  }
}

function EnterKeySave(e) {
  if (e.key == "Enter") {
    Save();
  }
}

function showAddContactDialog() {
  let dialog = document.getElementById("addContact");
  dialog.style.display = "flex";
}
// the Back function takes a parameter which we will pass the parentNode of the button means the dialog itself and it will remove it from the specific div containers.

function Back(param) {
  param.style.display = "none";
}

function Save() {
  // if the Name or Num field are empty it throws an warningMsg:
  let warningMsg = document.getElementById("warningMsg");
  if (Name.value == "" || Num.value == "") {
    warningMsg.innerHTML +=
      "The fields cannot be empty.";
  }
  else {
    makeNewContacts();
  }
}



function makeNewContacts() {

  Contact.CName = Name.value;
  Contact.Cno = "+91 " + Num.value;
  ContactArr[n] = Contact;

  Contacts.innerHTML +=
    `
    <div class="contact">
    <img src="Images/people.svg" alt="People" id="people" />
    <span id="name">${ContactArr[n].CName}</span>
    <span id="number">${ContactArr[n].Cno}</span>
    <div class="ContactOpts">
      <img src="Images/call.svg" alt="call" id="call" class="innerBtns" onclick="call(this)"/>
      <img
        src="Images/info-svgrepo-com.svg"
        alt="info"
        id="info"
        class="innerBtns"
        onclick="Info(this)"
        />
    </div>
  </div>`;

  Name.value = "";
  Num.value = "";
  n++;
}
function showMoreOptionsDialog() {
  let dialog = document.getElementById("MO");
  // <!-- svg is for the back arrow -->
  dialog.innerHTML =
    `
    <div id='moreOpts'>
    <span>About</span>
    <span>Sort</span>
    <span>Select</span>
    <span>Call</span>
    <span onclick='Back(this.parentNode)'>
    <img src='Images/back.svg' class='backArrow'/>
    Back</span>
    </div>`;
}
function call(param) {

  let currentName = param.parentNode.parentNode.children[1].innerHTML;
  let currentNum = param.parentNode.parentNode.children[2].innerHTML;
  let calling = document.getElementById("showCalling");

  // This will make it so it calls only one person at a time.
  calling.innerHTML = "";
  calling.style.display = "flex";
  calling.innerHTML +=
    `
      <div id="placeName">${currentName}</div>
      <div id="placeNum">${currentNum}</div>
      <img src="Images/speaker-svgrepo-com.svg" alt="" class="btns">
      <img src="Images/video-video-call-camera-record-svgrepo-com.svg" alt="" class="btns">
      <img src="Images/call.svg" alt="" class="btns EndCall" onclick="EndCall()">
  `;
}

function EndCall() {
  let calling = document.getElementById("showCalling");
  calling.innerHTML = "";
  calling.style.display = "none";
}

function Info(param) {

}


// Logic for entering the number preesed frim keys to the keypadField:

let keys = document.getElementsByClassName("keys");
let keypadField = document.getElementById("keypadField");

for(let i = 0; i < keys.length; i++) {
  keys[i].addEventListener("click", function(event) {

    keypadField.value += event.target.innerText;
  });
}

function BackSpace(){
  keypadField.value = keypadField.value.substring(0, keypadField.value.length-1);
  // console.log(keypadField.innerHTML.length-1);
}
