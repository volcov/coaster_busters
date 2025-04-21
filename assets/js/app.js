// Required imports
import { Socket } from "phoenix";
import { LiveSocket } from "phoenix_live_view";

// LiveSocket configuration
let csrfToken = document
  .querySelector("meta[name='csrf-token']")
  ?.getAttribute("content");
let liveSocket = new LiveSocket("/live", Socket, {
  params: { _csrf_token: csrfToken },
});

// Connect if there are LiveView elements on the page
liveSocket.connect();

// For debugging purposes
window.liveSocket = liveSocket;
