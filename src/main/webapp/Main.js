const notifBar = document.getElementById("notifBar");
const taskBar = document.getElementById("taskBar");
const desktop = document.getElementById("desktop");
const main = document.getElementById("main");
let appsContainer = document.getElementById("appsContainer");

const notifDialog = document.getElementById("notif-dialogs");

let dialogs = document.getElementsByClassName("dialogs");
let D = document.getElementsByClassName("Desktop")[0];

if (document.body.contains(D)) {
  D.style.backgroundImage = "url(" + localStorage.getItem("selectedBackground") + ")";
}
// Load Desktop:
if (document.body.contains(desktop)) {
  addEventListener("load", desktop.click());
}


const notifIcons = document.getElementsByClassName("notifIcons");
const notifDisplay = document.getElementsByClassName("display2");

function ShowDesktopDialog(e) {
  let Xpos = e.clientX;
  let Ypos = e.clientY;
  let place = document.getElementsByClassName("desktop-dialog")[0];
  place.style.display = "flex";
  place.innerHTML = `
    <div class="opts" data-bs-toggle="modal" data-bs-target="#myModal">
        <img src="Icons/brush-svgrepo-com.svg" alt="">
        <span>Customize</span>
      </div>
      <div class="opts">
        <img src="Icons/refresh-svgrepo-com.svg" alt="" onclick="location.reload();">
        <span>Refresh</span>
      </div>
      <div class="opts">
        <img src="Icons/setting-svgrepo-com.svg" alt="">
        <span>Settings</span>
      </div>
      <div class="opts" style="border-bottom: none">
        <img src="Icons/console-svgrepo-com.svg" alt="">
        <span>Open in Console</span>
      </div>
    `;
  place.style.top = Ypos + "px";
  place.style.left = Xpos + "px";
  // console.log("X-axis: " + Xpos + ", Y-axis: " + Ypos);
}


function showUserInfo() {
  notifDialog.style.display = "flex";
  // notifIcons[0].className+= " enabled";
}



function showDateTime(param) {
  const date = new Date();
  let d = date.toDateString() + " | " + date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
  param.setAttribute("title", d);
  param.setAttribute("data-bs-toggle", "tooltip")
  param.setAttribute("data-bs-placement", "right")
}
// For Tooltip:
var tooltipTriggerList = [].slice.call(
        document.querySelectorAll('[data-bs-toggle="tooltip"]')
      );
      var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl);
      });
let id = null;

function closeClock() {
  console.log("in");
  clearInterval(id);
  id = null;
}

function showDateTimeFull() {
  date = new Date();
  let t = date.toLocaleTimeString();
  let d = date.toDateString();

  notifDialog.style.display = "flex";

  notifDialog.innerHTML =
    `
  <div class="display1">
        <h3>Date/Time:</h3>
        <img src="Icons/close-svgrepo-com.svg" onclick="closeClock();closeDialog(this);">
        <hr />
      </div>
      <div class="display2" style="margin-top: 50px;">
        <h2 style="display:flex;justify-content:center;align-items:center;">${t}</h2>
        <h4 style="display:flex;justify-content:center;align-items:center;">${d}</h4>
      </div>
  `;

  if (id == null) {
    id = setInterval(showDateTimeFull, 1000);
  }
}


function showBatterySaving() {
  notifDialog.style.display = "flex";

  notifDialog.innerHTML =
    `
  <div class="display1">
    <div class="form-check form-switch">
      <label class="form-check-label" for="batterySaver">Battery Saver</label>
      <input class="form-check-input" onclick='enableBatterySaver()' type="checkbox" id="batterySaver" />
    </div>
      <img src="Icons/close-svgrepo-com.svg" onclick="closeDialog(this);">
      <hr />
    </div>
    <div class="display2"></div>
  `;
}

function enableBatterySaver(){

}

function showBluetooth() {
  notifDialog.style.display = "flex";

  notifDialog.innerHTML = `
  <div class="display1">
        <div class="form-check form-switch">
          <label class="form-check-label" for="bluetooth">Bluetooth</label>
          <input class="form-check-input" onclick='enableBluetooth()' type="checkbox" id="bluetooth" />
        </div>
        <img src="Icons/close-svgrepo-com.svg" onclick="closeDialog(this);">
        <hr />
      </div>
      <div class="display2"></div>
  `;
}
function enableBluetooth() {

}

function showWifi() {
  notifDialog.style.display = "flex";

  notifDialog.innerHTML = `
  <div class="display1">
        <div class="form-check form-switch">
          <label class="form-check-label" for="wifi">Wifi</label>
          <input class="form-check-input" onclick='enableWifi()' type="checkbox" id="wifi" />
        </div>
        <img src="Icons/close-svgrepo-com.svg" onclick="closeDialog(this);">
        <hr />
      </div>
      <div class="display2"></div>
  `;
}

function enableWifi() {

}

function closeDialog(param) {
  if (param.parentElement.className == "display1") {
    param.parentElement.parentElement.style.display = 'none';
  }
  param.parentElement.style.display = 'none';
}

function showMoreOptionsDialog() {
  let dialog = document.getElementById("moreOpts");
  dialog.style.display = "flex";
}

function showPowerOpts() {
  let dialog = document.getElementById("powerOpts");
  dialog.style.display = "flex";
}

function closeAllApps() {
  let appsIcons = document.getElementsByClassName("app-icons");
  for (let i = 0; i < appsIcons.length; i++) {
    appsIcons[i].className = appsIcons[i].className.replace(" active", "");
    console.log(appsIcons[i].className);
  }

}

// AppContainer Showing variable:
let ac = 0;
let id2 = null;
let pos = -470;
function openAppsContainer() {
  let btn = document.getElementById("appsContainerBtn");
  if (ac == 0) {
    btn.className += " active";
    id2 = setInterval(ContainerIn, 1);
    ac = 1;
  }
  else {
    btn.className = btn.className.replace(" active", "");
    id2 = setInterval(ContainerOut, 1);
    ac = 0;
  }

  function ContainerIn() {
    if (pos == 70) {
      clearInterval(id2);
    }
    else {
      pos += 5;
      appsContainer.style.bottom = pos + "px";
    }
  }
  function ContainerOut() {
    if (pos == -470) {
      clearInterval(id2);
    }
    else {
      pos -= 5;
      appsContainer.style.bottom = pos + "px";
    }
  }
}

function touch() {
  notifDialog.style.display = "none";
  appsContainer.style.display = "none";
  powerOpts = document.getElementById("powerOpts");
  moreOptions = document.getElementById("moreOptions");
  powerOpts.style.display = "none";
  moreOptions.style.display = "none";
}

function updateState(elem, target = "msg") {

  if (target == "msg") {
    elem.className = "x";
    elem.className = "msg";
  }
  else if (target == "bar1") {
    elem.id = "x";
    elem.id = "notifBar";
  }
  else if (target == "bar2") {
    elem.id = "x";
    elem.id = "taskBar";
  }
}
// Variables that point to thae taskbar special functionalities.
let f1 = 0, f2 = 0;
function pinTabs(param) {
  let msg = document.getElementById("msg");
  if (f1 == 0) {
    param.className += " enabled";
    taskBar.style.bottom = 0;
    notifBar.style.left = 0;
    updateState(msg);
    msg.innerText = "Pinned. Click Again to unpin.";
    f1 = 1;
  }
  else {
    msg.innerText = "Unpinned.";
    location.reload();
    f1 = 0;
  }
}
let c = 0;
function showTabs() {
  if (c == 2) {
    notifBar.style.left = "0px";
  }
  var key = event.key;
  if (key == "Escape") {
    window.close()
  }
}
function hideTabs(param) {
  let msg = document.getElementById("msg");
  if (f2 == 0) {
    param.className += " enabled";
    taskBar.style.bottom = "-70px";
    notifBar.style.left = "-90px";
    updateState(msg);
    msg.innerText = "Tabs Hidden. Press Esc twice to make them visible.";
    let inside = 0;
    document.addEventListener("keydown", showTabs());
    f2 = 1;
  }
  else {
    msg.innerText = "Unpinned.";
    location.reload();
    f2 = 0;
  }
}


function openApp(evt) {
  let apps = document.getElementsByClassName("apps");

  for (let c = 0; c < apps.length; c++) {
    apps[c].children[0].className = apps[c].children[0].className.replace(
      " active",
      ""
    );
  }
  evt.currentTarget.children[0].className += " active";
}

function selectBackground(param) {
  let src = param.getAttribute("src");
  localStorage.setItem("selectedBackground", src);

  console.log(localStorage.getItem("selectedBackground"));

  D.style.backgroundImage = "url(" + src + ")";
}