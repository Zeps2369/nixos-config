{ host, ... }:
let custom = {
  font = "JetBrainsMono Nerd Font";
  font_size = "18px";
  font_weight = "bold";
  text_color = "#FBF1C7";
  background_0 = "#1D2021";
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
  opacity = "1";
  indicator_height = "2px";
};
in 
{
  programs.waybar.settings.mainBar = with custom; {
    position= "bottom";
    layer= "top";
    height= 30;
    margin-top= 0;
    margin-bottom= 0;
    margin-left= 0;
    margin-right= 0;
    modules-left= [
        "custom/launcher" 
        "hyprland/workspaces"
        "tray"
    ];
    modules-center= [
        "clock"
    ];
    modules-right= [
        "cpu"
        "memory"
        (if (host == "desktop") then "disk" else "")
        "pulseaudio" 
        "network"
        "battery"
        "custom/notification"
    ];
    clock= {
        calendar = {
          format = { today = "<span color='#98971A'><b>{}</b></span>"; };
        };
        format = "  {:%H:%M}";
        tooltip= "true";
        tooltip-format= "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        format-alt= "  {:%d/%m}";
    };
    "hyprland/workspaces"= {
        active-only= false;
        disable-scroll= true;
        format = "{icon}";
        on-click= "activate";
        format-icons= {
            "1"= "I";
            "2"= "II";
            "3"= "III";
            "4"= "IV";
            "5"= "V";
            "6"= "VI";
            "7"= "VII";
            "8"= "VII";
            "9"= "IX";
            sort-by-number= true;
        };
        persistent-workspaces = {
            "1"= [];
            "2"= [];
            "3"= [];
            "4"= [];
            "5"= [];
        };
    };
    cpu= {
        format= "<span foreground='${mauve}'> </span> {usage}%";
        format-alt= "<span foreground='${mauve}'> </span> {avg_frequency} GHz";
        interval= 2;
    };
    memory= {
        format= "<span foreground='${mauve}'>󰟜 </span>{}%";
        format-alt= "<span foreground='${mauve}'>󰟜 </span>{used} GiB"; # 
        interval= 2;
    };
    disk = {
        # path = "/";
        format = "<span foreground='${mauve}'>󰋊 </span>{percentage_used}%";
        interval= 60;
    };
    network = {
        format-wifi = "<span foreground='${mauve}'> </span> {signalStrength}%";
        format-ethernet = "<span foreground='${mauve}'>󰀂 </span>";
        tooltip-format = "Connected to {essid} {ifname} via {gwaddr}";
        format-linked = "{ifname} (No IP)";
        format-disconnected = "<span foreground='${mauve}'>󰖪 </span>";
    };
    tray= {
        icon-size= 20;
        spacing= 8;
    };
    pulseaudio= {
        format= "{icon} {volume}%";
        format-muted= "<span foreground='${mauve}'> </span> {volume}%";
        format-icons= {
            default= ["<span foreground='${mauve}'> </span>"];
        };
        scroll-step= 5;
        on-click= "pamixer -t";
    };
    battery = {
        format = "<span foreground='${mauve}'>{icon}</span> {capacity}%";
        format-icons = [" " " " " " " " " "];
        format-charging = "<span foreground='${mauve}'> </span>{capacity}%";
        format-full = "<span foreground='${mauve}'> </span>{capacity}%";
        format-warning = "<span foreground='${mauve}'> </span>{capacity}%";
        interval = 5;
        states = {
            warning = 20;
        };
        format-time = "{H}h{M}m";
        tooltip = true;
        tooltip-format = "{time}";
    };
    "custom/launcher"= {
        format= "";
        on-click= "rofi -show drun";
        on-click-right= "wallpaper-picker"; 
        tooltip= "false";
    };
    "custom/notification" = {
        tooltip = false;
        format = "{icon} ";
        format-icons = {
            notification = "<span foreground='red'><sup></sup></span>  <span foreground='${red}'></span>";
            none = "  <span foreground='${red}'></span>";
            dnd-notification = "<span foreground='red'><sup></sup></span>  <span foreground='${red}'></span>";
            dnd-none = "  <span foreground='${red}'></span>";
            inhibited-notification = "<span foreground='red'><sup></sup></span>  <span foreground='${red}'></span>";
            inhibited-none = "  <span foreground='${red}'></span>";
            dnd-inhibited-notification = "<span foreground='red'><sup></sup></span>  <span foreground='${red}'></span>";
            dnd-inhibited-none = "  <span foreground='${red}'></span>";
        };
        return-type = "json";
        exec-if = "which swaync-client";
        exec = "swaync-client -swb";
        on-click = "swaync-client -t -sw";
        on-click-right = "swaync-client -d -sw";
        escape = true;
    };
  };
}
