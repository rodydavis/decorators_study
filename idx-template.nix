{pkgs, branch ? "decorators", repo ? "https://github.com/loic-sharma/flutter", ...}: {
    packages = [
        pkgs.curl
        pkgs.gnutar
        pkgs.xz
        pkgs.git
        pkgs.busybox
    ];
    bootstrap = ''
        mkdir "$out"
        cp -a -rf ${./.}/. "$out/"
        chmod -R +w "$out"
        rm "$out/idx-template.nix"
        rm "$out/idx-template.json"
        rm "$out/dev.nix"
        mkdir -p "$out/flutter"
        git clone -b "${branch}" "${repo}" "$out/flutter/"
        mkdir "$out"/.idx
        cp ${./dev.nix} "$out"/.idx/dev.nix
        install --mode u+rw ${./dev.nix} "$out"/.idx/dev.nix
        chmod -R u+w "$out"
    '';
}