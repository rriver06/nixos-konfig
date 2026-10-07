{ config, pkgs, lib, ... }:

{

  # Modifies user.reg files from Wine/Proton automatically.
  home.activation.disableWineDecorations = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    fix_wine_reg() {
      local reg_file="$1"
      if [ -f "$reg_file" ]; then
        # Verifies if selection already exists to prevent duplication.
        if ! grep -q '\[Software\\\\Wine\\\\X11 Driver\]' "$reg_file"; then
          echo -e '\n[Software\\\\Wine\\\\X11 Driver]\n"Decorated"="N"' >> "$reg_file"
        else
          # If selection exists, but not the Decorated key, add it.
          if ! grep -q '"Decorated"' "$reg_file"; then
            sed -i '/\[Software\\\\Wine\\\\X11 Driver\]/a "Decorated"="N"' "$reg_file"
          fi
        fi
      fi
    }

    $DRY_RUN_CMD echo "Disabling window decorations on Wine prefixes..."

    # 1. Default wine prefix (~/.wine)
    fix_wine_reg "$HOME/.wine/user.reg"

    # 2. Every steam game prefix (Proton compatdata)
    for reg in $HOME/.local/share/Steam/steamapps/compatdata/*/pfx/user.reg; do
      fix_wine_reg "$reg"
    done
  '';

}
