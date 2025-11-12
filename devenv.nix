{ pkgs, lib, config, inputs, ... }:

{
  enterShell = ''
    source $UV_PROJECT_ENVIRONMENT/bin/activate
  '';

  languages.python = {
    enable = true;
    uv.enable = true;
    uv.sync.enable = true;
  };
}
