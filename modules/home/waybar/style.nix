{ ... }:
let custom = {
  font = "JetBrainsMono Nerd Font";
  font_size = "18px";
  font_weight = "bold";
  text_color = "#CDD6F4";
  background_0 = "#11111b";
  background_1 = "#282828";
  border_color = "#928374";
  red = "#CC241D";
  green = "#98971A";
  yellow = "#FABD2F";
  blue = "#458588";
  magenta = "#B16286";
  cyant = "#689D6A";
  orange = "#D65D0E";
  mauve = "#CBA6F7";
  Lavender = "#B4BEFE";
  opacity = "0.98";
  indicator_height = "2px";
};
in 
{
  programs.waybar.style = with custom; ''
    * {
      border: none;
      border-radius: 0px;
      padding: 0;
      margin: 0;
      font-family: ${font};
      font-weight: ${font_weight};
      opacity: ${opacity};
      font-size: ${font_size};
    }

    window#waybar {
      background: rgba(29, 32, 33, 0.5);
    }

    tooltip {
      background: ${background_1};
      border: 1px solid ${border_color};
    }
    tooltip label {
      margin: 5px;
      color: ${text_color};
    }

    #workspaces {
      padding-left: 15px;
    }
    #workspaces button {
      color: ${mauve};
      padding-left:  5px;
      padding-right: 5px;
      margin-right: 10px;
      border-bottom: ${indicator_height} solid ${background_0};
    }
    #workspaces button.empty {
      color: ${text_color};
    }
    #workspaces button.active {
      color: ${mauve};
      border-bottom: ${indicator_height} solid ${mauve};
    }

    #clock {
      color: ${text_color};
      border-bottom: ${indicator_height} solid ${background_0};
    }

    #tray {
      margin-left: 10px;
      color: ${text_color};
    }
    #tray menu {
      background: ${background_1};
      border: 1px solid ${border_color};
      padding: 8px;
    }
    #tray menuitem {
      padding: 1px;
    }

    #pulseaudio, #network, #cpu, #memory, #disk, #battery, #custom-notification {
      padding-left: 5px;
      padding-right: 5px;
      margin-right: 10px;
      color: ${text_color};
    }

    #cpu {
      border-bottom: ${indicator_height} solid ${mauve};
    }
    #memory {
      border-bottom: ${indicator_height} solid ${mauve};
    }
    #disk {
      border-bottom: ${indicator_height} solid ${mauve};
    }

    #pulseaudio {
      margin-left: 15px;
      border-bottom: ${indicator_height} solid ${mauve};
    }
    #network {
      border-bottom: ${indicator_height} solid ${mauve};
    }
    #battery {
      border-bottom: ${indicator_height} solid ${mauve};
    }

    #custom-notification {
      margin-left: 15px;
      padding-right: 2px;
      margin-right: 5px;
      border-bottom: ${indicator_height} solid ${mauve};
    }

    #custom-launcher {
      font-size: 20px;
      color: ${text_color};
      font-weight: bold;
      margin-left: 15px;
      padding-right: 10px;
      border-bottom: ${indicator_height} solid ${background_0};
    }
  '';
}
