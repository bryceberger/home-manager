{pkgs, ...}: let
  fish = import ./mod.nix {inherit pkgs;};
in {
  xdg.configFile = {
    "fish/conf.d/02-tide-vars.fish".text = fish.setVars {
      tide_aws_bg_color = "normal";
      tide_aws_color = "yellow";
      tide_aws_icon = "";
      tide_character_color = "brgreen";
      tide_character_color_failure = "brred";
      tide_character_icon = "❯";
      tide_character_vi_icon_default = "❮";
      tide_character_vi_icon_replace = "▶";
      tide_character_vi_icon_visual = "V";
      tide_chruby_bg_color = "normal";
      tide_chruby_color = "red";
      tide_chruby_icon = "";
      tide_cmd_duration_bg_color = "normal";
      tide_cmd_duration_color = "brblack";
      tide_cmd_duration_decimals = "0";
      tide_cmd_duration_icon = "";
      tide_cmd_duration_threshold = "3000";
      tide_context_always_display = "false";
      tide_context_bg_color = "normal";
      tide_context_color_default = "yellow";
      tide_context_color_root = "bryellow";
      tide_context_color_ssh = "yellow";
      tide_context_hostname_parts = "1";
      tide_crystal_bg_color = "normal";
      tide_crystal_color = "brwhite";
      tide_crystal_icon = "⬢";
      tide_docker_bg_color = "normal";
      tide_docker_color = "blue";
      tide_docker_default_contexts = "'default'  'colima'";
      tide_docker_icon = "";
      tide_git_bg_color = "normal";
      tide_git_bg_color_unstable = "normal";
      tide_git_bg_color_urgent = "normal";
      tide_git_color_branch = "$green";
      tide_git_color_conflicted = "brred";
      tide_git_color_dirty = "$yellow";
      tide_git_color_operation = "brred";
      tide_git_color_staged = "bryellow";
      tide_git_color_stash = "brgreen";
      tide_git_color_untracked = "$blue";
      tide_git_color_upstream = "brgreen";
      tide_git_icon = "";
      tide_git_truncation_length = "24";
      tide_go_bg_color = "normal";
      tide_go_color = "brcyan";
      tide_go_icon = "";
      tide_java_bg_color = "normal";
      tide_java_color = "yellow";
      tide_java_icon = "";
      tide_jobs_bg_color = "normal";
      tide_jobs_color = "green";
      tide_jobs_icon = "";
      tide_kubectl_bg_color = "normal";
      tide_kubectl_color = "blue";
      tide_kubectl_icon = "⎈";
      tide_left_prompt_frame_enabled = "false";
      tide_left_prompt_items = "'pwd'  'git'  'newline'  'character'";
      tide_left_prompt_prefix = "";
      tide_left_prompt_separator_diff_color = "' '";
      tide_left_prompt_separator_same_color = "' '";
      tide_left_prompt_suffix = "' '";
      tide_nix_shell_bg_color = "normal";
      tide_nix_shell_color = "brblue";
      tide_nix_shell_icon = "";
      tide_node_bg_color = "normal";
      tide_node_color = "green";
      tide_node_icon = "⬢";
      tide_os_bg_color = "normal";
      tide_os_color = "brwhite";
      tide_os_icon = "";
      tide_php_bg_color = "normal";
      tide_php_color = "blue";
      tide_php_icon = "";
      tide_private_mode_bg_color = "normal";
      tide_private_mode_color = "brwhite";
      tide_private_mode_icon = "﫸";
      tide_prompt_add_newline_before = "true";
      tide_prompt_color_frame_and_connection = "brblack";
      tide_prompt_color_separator_same_color = "brblack";
      tide_prompt_icon_connection = "─";
      tide_prompt_min_cols = "34";
      tide_prompt_pad_items = "false";
      tide_pwd_bg_color = "normal";
      tide_pwd_color_anchors = "$blue";
      tide_pwd_color_dirs = "$teal";
      tide_pwd_color_truncated_dirs = "$gray";
      tide_pwd_icon = "";
      tide_pwd_icon_home = "";
      tide_pwd_icon_unwritable = "";
      tide_pwd_markers = ".bzr .citc .git .hg .node-version .python-version .ruby-version .shorten_folder_marker .svn .terraform Cargo.toml composer.json CVS go.mod package.json";
      tide_right_prompt_frame_enabled = "false";
      tide_right_prompt_items = "status cmd_duration context jobs node rustc java php go kubectl toolbox terraform aws nix_shell crystal";
      tide_right_prompt_prefix = "' '";
      tide_right_prompt_separator_diff_color = "' '";
      tide_right_prompt_separator_same_color = "' '";
      tide_right_prompt_suffix = "";
      tide_rustc_bg_color = "normal";
      tide_rustc_color = "$red";
      tide_rustc_icon = "";
      tide_shlvl_bg_color = "normal";
      tide_shlvl_color = "yellow";
      tide_shlvl_icon = "";
      tide_shlvl_threshold = "1";
      tide_status_bg_color = "normal";
      tide_status_bg_color_failure = "normal";
      tide_status_color = "green";
      tide_status_color_failure = "red";
      tide_status_icon = "✔";
      tide_status_icon_failure = "✘";
      tide_terraform_bg_color = "normal";
      tide_terraform_color = "magenta";
      tide_terraform_icon = "";
      tide_time_bg_color = "normal";
      tide_time_color = "brblack";
      tide_time_format = "";
      tide_toolbox_bg_color = "normal";
      tide_toolbox_color = "magenta";
      tide_toolbox_icon = "⬢";
      tide_vi_mode_bg_color_default = "normal";
      tide_vi_mode_bg_color_insert = "normal";
      tide_vi_mode_bg_color_replace = "normal";
      tide_vi_mode_bg_color_visual = "normal";
      tide_vi_mode_color_default = "white";
      tide_vi_mode_color_insert = "cyan";
      tide_vi_mode_color_replace = "green";
      tide_vi_mode_color_visual = "yellow";
      tide_vi_mode_icon_default = "D";
      tide_vi_mode_icon_insert = "I";
      tide_vi_mode_icon_replace = "R";
      tide_vi_mode_icon_visual = "V";
      tide_virtual_env_bg_color = "normal";
      tide_virtual_env_color = "cyan";
      tide_virtual_env_icon = "";
    };
  };
}
