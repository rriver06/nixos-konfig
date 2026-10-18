{ pkgs, inputs, ...}:

{

  xdg.configFile."nixd/config.json".text = builtins.toJSON {
    nixpkgs = {
      expr = "import <nixpkgs> {}";
    };

    formatting = {
      command = [ "nixfmt" ];
    };

    options = {
      nixos = {
        expr = "(builtins.getFlake (\"path:\" + toString ../../.)).nixosConfigurations.Inspiron3501.options";
      };
      home-manager = {
        expr = "(builtins.getFlake (\"path:\" + toString ../../.)).homeConfigurations.Inspiron3501.options";
      };

    };
  };

}
