registerShortcut(
  "ResizePick720p",
  "Select window to resize to 1280x720",
  "Meta+Ctrl+3",
  () => {
    const window = workspace.activeWindow;
    if (!window) {
      console.log("No active window");
      return;
    }
    const g = window.frameGeometry;
    window.frameGeometry = {
        x: g.x,
        y: g.y,
        width: 1280,
        height: 720
    };
  }
);
