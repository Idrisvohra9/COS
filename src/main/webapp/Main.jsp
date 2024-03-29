<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@page
import="jakarta.servlet.*,jakarta.servlet.http.*,java.io.*, java.util.*"%>
<!DOCTYPE html>

<html lang="en-IN">
  <head>
    <title>COS Desktop</title>
    <meta charset="utf-8" />

    <meta name="viewport" content="width=device-width" />

    <!-- favicon -->
    <link rel="icon" type="image/x-icon" href="Icons/favicon_icon.png" />

    <!-- Bootstrap responsive CSS Stuff -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
      type="text/javascript"
    ></script>

    <!-- Stylesheet -->
    <link rel="stylesheet" href="Main.css" />

    <!-- Custom font: -->
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css?family=Satisfy"
    />
  </head>
  <body id="main">
    <!-- notification bar -->
    <div id="notifBar">
      <img src="Icons/notifBarGold.svg" alt="" class="notifBarGold" />
      <div class="notifIcons-content">
        <img
          src="Icons/user-svgrepo-com.svg"
          alt=""
          class="notifIcons"
          data-bs-toggle="tooltip"
          data-bs-placement="right"
          title="User"
          onclick="showUserInfo()"
        />
        <img
          src="Icons/calendar-date-svgrepo-com.svg"
          alt=""
          class="notifIcons"
          onmouseover="showDateTime(this)"
          onclick="showDateTimeFull(this)"
        />
        <img
          src="Icons/battery-svgrepo-com.svg"
          alt=""
          class="notifIcons"
          data-bs-toggle="tooltip"
          data-bs-placement="right"
          title="Battery: 40%"
          onclick="showBatterySaving()"
          id="battery"
        />
        <img
          src="Icons/bluetooth-svgrepo-com.svg"
          alt=""
          class="notifIcons"
          data-bs-toggle="tooltip"
          data-bs-placement="right"
          title="Bluetooth"
          onclick="showBluetooth();"
        />
        <img
          src="Icons/wifi-svgrepo-com.svg"
          alt=""
          class="notifIcons"
          data-bs-toggle="tooltip"
          data-bs-placement="right"
          title="Wifi"
          onclick="showWifi();"
        />
        <img
          src="Icons/more-svgrepo-com.svg"
          alt=""
          class="notifIcons"
          data-bs-toggle="tooltip"
          data-bs-placement="right"
          title="More Options"
          onclick="showMoreOptionsDialog();"
        />
        <img
          src="Icons/power button.svg"
          alt=""
          class="notifIcons"
          style="width: 40px; height: 40px; padding: 0px"
          data-bs-toggle="tooltip"
          data-bs-placement="right"
          title="Power"
          onclick="showPowerOpts();"
        />
      </div>
    </div>

    <!-- taskbar -->
    <div id="taskBar">
      <div class="mainBtns">
        <img
          src="Icons/back-svgrepo-com.svg"
          alt=""
          class="app-icons"
          onclick="history.back();"
          data-bs-toggle="tooltip"
          data-bs-placement="top"
          title="Back"
        />
        <a
          onclick="this.setAttribute('href','desktop.html');closeAllApps();"
          target="Frame"
          data-bs-toggle="tooltip"
          data-bs-placement="top"
          title="Home"
        >
          <img src="Icons/home-two-svgrepo-com.svg" alt="" class="app-icons" />
        </a>
        <img
          src="Icons/apps-2-svgrepo-com.svg"
          alt=""
          class="app-icons"
          id="appsContainerBtn"
          onclick="openAppsContainer();"
          data-bs-toggle="tooltip"
          data-bs-placement="top"
          title="Apps"
        />
      </div>

      <div class="pinnedApps">
        <a
          onclick="this.setAttribute('href','Applications/COS Console.html');openApp(event)"
          class="apps"
          target="Frame"
          data-bs-toggle="tooltip"
          data-bs-placement="top"
          title="COS Console"
        >
          <img src="Icons/console-svgrepo-com.svg" alt="" class="app-icons" />
        </a>
        <a
          onclick="this.setAttribute('href','Applications/notes.html');openApp(event)"
          class="apps"
          target="Frame"
          onclick="openApp(event)"
          data-bs-toggle="tooltip"
          data-bs-placement="top"
          title="Notes"
        >
          <img src="Icons/note-svgrepo-com.svg" alt="" class="app-icons" />
        </a>
        <a
          onclick="this.setAttribute('href','Applications/Contact Book/index.html');openApp(event)"
          class="apps"
          target="Frame"
          onclick="openApp(event)"
          data-bs-toggle="tooltip"
          data-bs-placement="top"
          title="Contact Book"
        >
          <img src="Icons/contacts-svgrepo-com.svg" alt="" class="app-icons" />
        </a>
        <a
          onclick="this.setAttribute('href','Applications/File_Manager_/index.html');openApp(event)"
          class="apps"
          target="Frame"
          onclick="openApp(event)"
          data-bs-toggle="tooltip"
          data-bs-placement="top"
          title="File Manager"
        >
          <img
            src="Icons/files-folder-svgrepo-com.svg"
            alt=""
            class="app-icons"
          />
        </a>
        <a
          onclick="this.setAttribute('href','Applications/COS_Browser.jsp');openApp(event)"
          class="apps"
          target="Frame"
          onclick="openApp(event)"
          data-bs-toggle="tooltip"
          data-bs-placement="top"
          title="COS Browser"
        >
          <img src="Icons/browser-svgrepo-com.svg" alt="" class="app-icons" />
        </a>
      </div>
      <div class="sideFuntional">
        <img
          src="Icons/push-pin-svgrepo-com.svg"
          alt=""
          class="SF"
          onclick="pinTabs(this)"
          data-bs-toggle="tooltip"
          data-bs-placement="top"
          title="Pin Tabs"
        />
        <img
          src="Icons/visibility-svgrepo-com.svg"
          alt=""
          class="SF"
          onclick="hideTabs(this)"
          data-bs-toggle="tooltip"
          data-bs-placement="top"
          title="Tabs Visibility"
        />
      </div>
    </div>

    <a
      href="desktop.html"
      style="visibility: hidden"
      target="Frame"
      id="desktop"
    ></a>
    <!-- Dialog containers -->
    <div id="notif-dialogs">
      <div class="display1">
        <h3>User Info:</h3>
        <img src="Icons/close-svgrepo-com.svg" onclick="closeDialog(this);" />
        <hr />
      </div>
      <div class="display2">
        <ul>
        <% String Username = (String)session.getAttribute("Username");
           int Id = (int) session.getAttribute("ID");
        %>
          <li>Name: <%= Username  %></li>
          <li>Uid: <%= "00"+Id %></li>
          <li>Group: Admin</li>
          <li>Permissions: All~</li>
          <li>Authority: <span style="color: red">root~</span></li>
        </ul>
      </div>
    </div>

    <div id="moreOpts">
      <img
        src="Icons/close-svgrepo-com.svg"
        onclick="closeDialog(this);"
        style="position: absolute; top: 0; right: 0"
        alt=""
      />
      <div>Notifications:</div>
      <div class="notif">No new Notifications.</div>
      <a onclick="this.setAttribute('href','Settings.html')">
        <img src="Icons/setting-svgrepo-com.svg" alt="" /> <span>Settings</span>
      </a>
      <a onclick="this.setAttribute('href','LockScreen.jsp')">
        <img src="Icons/user-svgrepo-com.svg" alt="" /> <span>Change User</span>
      </a>
    </div>

    <div id="powerOpts">
      <img
        src="Icons/close-svgrepo-com.svg"
        onclick="closeDialog(this);"
        style="position: absolute; top: 0; right: 0"
        alt=""
      />
      <a onclick="this.setAttribute('href','Sleep_Mode.html')">
        <img src="Icons/sleep-svgrepo-com.svg" alt="" /> <span>Sleep mode</span>
      </a>
      <a onclick="this.setAttribute('href','ShutDown.html')">
        <img src="Icons/power button.svg" alt="" /> <span>Shut down</span>
      </a>
      <a onclick="this.setAttribute('href','LockScreen.jsp')">
        <img src="Icons/lock-svgrepo-com.svg" alt="" /> <span>Lock</span>
      </a>
      <a
        style="border: none"
        onclick="this.setAttribute('href','ShutDown.html')"
      >
        <img src="Icons/refresh-svgrepo-com.svg" alt="" /> <span>Restart</span>
      </a>
    </div>

    <div id="appsContainer">
      <h2 style="align-self: flex-start">Apps</h2>

      <a
        onclick="this.setAttribute('href','Applications/COS Console.html')"
        target="Frame"
      >
        <img src="Icons/console-svgrepo-com.svg" alt="" class="app-icons" />
        <span>COS Console</span>
      </a>
      <a
        onclick="this.setAttribute('href','Applications/notes.html')"
        target="Frame"
      >
        <img src="Icons/note-svgrepo-com.svg" alt="" class="app-icons" />
        <span>Notes</span>
      </a>
      <a
        onclick="this.setAttribute('href','Applications/Contact Book/index.html')"
        target="Frame"
      >
        <img src="Icons/contacts-svgrepo-com.svg" alt="" class="app-icons" />
        <span>Contact Book</span>
      </a>
      <a
        onclick="this.setAttribute('href','Applications/Calculator/index.html')"
        target="Frame"
      >
        <img src="Icons/calculator-svgrepo-com.svg" alt="" class="app-icons" />
        <span>Calculator</span>
      </a>

	  <a onclick="this.setAttribute('href','Applications/Todo_list/index.jsp')" target="Frame">
        <img src="Icons/todo-svgrepo-com.svg" alt="" class="app-icons" />
        <span>TODO</span>
      </a>
      
      <a onclick="this.setAttribute('href','Applications/File_Manager_/index.html')" target="Frame">
        <img
          src="Icons/files-folder-svgrepo-com.svg"
          alt=""
          class="app-icons"
        />
        <span>File Manager</span>
      </a>

	 <a onclick="this.setAttribute('href','Applications/ScreenTime.jsp')" target="Frame">
        <img src="Icons/screen-svgrepo-com.svg" alt="" class="app-icons" />
        <span>Screen Time</span>
      </a>
      
      <a onclick="this.setAttribute('href','Applications/COS_Browser.jsp')" target="Frame">
        <img src="Icons/browser-svgrepo-com.svg" alt="" class="app-icons" />
        <span>COS Browser</span>
      </a>
      <a
        onclick="this.setAttribute('href','Applications/WebCam_App.html')"
        target="Frame"
      >
        <img src="Icons/camera-svgrepo-com.svg" alt="" class="app-icons" />
        <span>WebCam App</span>
      </a>
      <a
        onclick="this.setAttribute('href','Applications/Paint_app/index.html')"
        target="Frame"
      >
        <img src="Icons/paint-svgrepo-com.svg" alt="" class="app-icons" />
        <span>Paint</span>
      </a>
      <div class="inDevelopment">
        <h3>In Development:</h3>
        <a>
          <img src="Icons/store-svgrepo-com.svg" alt="" class="app-icons" />
          <span>COS Store</span>
        </a>
        <a>
          <img
            src="Icons/video-games-joystick-svgrepo-com.svg"
            alt=""
            class="app-icons"
          />
          <span>Game Zone</span>
        </a>
        <a>
          <img
            src="Icons/paint-brush-paintbrush-svgrepo-com.svg"
            alt=""
            class="app-icons"
          />
          <span>Theme Store</span>
        </a>
        <a>
          <img src="Icons/robot-svgrepo-com.svg" alt="" class="app-icons" />
          <span>COS Assistant</span>
        </a>
        <a>
          <img src="Icons/bluebook-svgrepo-com.svg" alt="" class="app-icons" />
          <span>User Manual</span>
        </a>
        <a>
          <img
            src="Icons/bug-shield-svgrepo-com.svg"
            alt=""
            class="app-icons"
          />
          <span>Bug Report</span>
        </a>
      </div>
    </div>

    <!-- Dialogs container ends -->

    <!-- Message display -->
    <div id="msg"></div>

    <iframe src="" class="mainFrame" name="Frame"></iframe>

    <!-- JS -->
    <script src="Main.js"></script>

    <!-- For tooltip -->
  </body>
</html>
