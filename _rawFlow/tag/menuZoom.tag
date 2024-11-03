<!-- src/menuZoom.riot -->
<menuZoom>
  <!-- TODO
LLAMAR VARIABLES CSS DEL PROYECTO
RECONOCIMIENTO EN CODIGO
CONVERTIR EN TAG
INSERTAR EN WORKBENCH 
-->
  <script>
    function plusToggle() {
      var plus = document.getElementById("plus");
      plus.classList.toggle("plus--active");
    }
    //
    function changeMode(tagOb) {
      element = document.getElementById(tagOb);
      // Get the current value of the 'modo' attribute
      const currentModo = element.getAttribute("modo");

      // Toggle between 'lock' and 'unlock' values
      const newModo = currentModo === "unlock" ? "lock" : "unlock";

      // Set the new value of the 'modo' attribute
      element.setAttribute("modo", newModo);

      // Optionally, update the class to visually represent the change
      if (newModo === "lock") {
        element.classList.remove("unlock");
        element.classList.add("lock");
        element.innerHTML = `<img id="lockImg" src="./lock.svg">`;
        //editor.editor_mode = 'fixed';
      } else {
        element.classList.remove("lock");
        element.classList.add("unlock");
        element.style.backgound = "red";
        element.innerHTML = `<img id="lockImg" src="./unlock.svg">`;
        //editor.editor_mode = 'edit';
      }

      console.log(`Modo changed to: ${newModo}`);
    }
  </script>

  <style>
    :root {
      --plus-unit: 50px;
    }

    .plus {
      width: var(--plus-unit);
      cursor: pointer;
      transition: all 0.3s ease 0s;
      height: var(--plus-unit);
      background: #5fecd9;
      border-radius: 50%;
      display: flex;
      position: relative;
    }

    .plus__line {
      width: 6px;
      height: calc(var(--plus-unit) * 0.5);
      background: #000000;
      border-radius: calc(var(--plus-unit) * 0.1);
      position: absolute;
      left: calc(50% - 3px);
      top: calc(50% - calc(var(--plus-unit) * 0.25));
    }

    .plus__line--h {
      transform: rotate(90deg);
    }

    .plus__line--v {
      display: flex;
      align-items: center;
      justify-content: space-around;
      overflow: hidden;
      transition: all 0.4s ease 0s;
    }

    .plus__link {
      color: #ffffff;
      font-size: calc(var(--plus-unit) * 0.3);
      opacity: 0;
      visibility: hidden;
      transition: 0.3s ease 0s;
      transform: scale(0.5);
    }

    .plus--active {
      height: calc(var(--plus-unit) * 0.32);
      border-radius: calc(var(--plus-unit) * 0.3);
    }

    .plus--active img {
      height: calc(var(--plus-unit) * 0.5);
    }

    .plus--active .plus__line--v {
      height: calc(var(--plus-unit) * 0.65);
      top: calc(-100% - calc(var(--plus-unit) * 0.6));
      padding: 0 5px;
      box-sizing: border-box;
      width: calc(var(--plus-unit) * 4);
      border-radius: calc(var(--plus-unit) * 0.6);
      left: calc(50% - calc(var(--plus-unit) * 2));
    }

    .plus--active .plus__link {
      opacity: 1;
      visibility: visible;
      transform: scale(1);
      transition-delay: 0.05s;
    }

    .theContainer {
      display: flex;
      width: 100%;
      height: 100%;
      left: 85vw;
      top: 85vh;
      position: absolute;
      z-index: 100;
    }

    html,
    body {
      height: 100%;
      overflow: hidden;
    }
  </style>
  <div class="theContainer">
    <div class="plus" id="plus">
      <div class="plus__line plus__line--v">
        <a href="#a" id="lock" class="plus__link ion-person">
          <img id="lockImg" src="./unlock.svg" />
        </a>
        <a href="#b" class="plus__link ion-images">
          <img id="fixItImg" src="./fixIt.svg" />
        </a>
        <a href="#c" class="plus__link ion-music-note">
          <img id="zoomInImg" src="./zoomIn.svg" />
        </a>
        <a href="#d" class="plus__link ion-location">
          <img id="zoomOutImg" src="./zoomOut.svg" />
        </a>
      </div>
      <div class="plus__line plus__line--h"></div>
    </div>
  </div>
  <script>
    // EVENT LISTENERS
    document.getElementById("lock").addEventListener("click", function () {
      changeMode("lock");
    });
    document.getElementById("lockImg").addEventListener("click", function () {
      changeMode("lock");
    });
    //
    plus.addEventListener("click", plusToggle);
  </script>
</menuZoom>
