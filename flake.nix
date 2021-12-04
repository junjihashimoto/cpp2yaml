{
  description = "A very basic flake";
  nixConfig = {
    bash-prompt = "\\[\\033[1m\\][dev-cpp2yaml]\\[\\033\[m\\]\\040\\w$\\040";
  };

  outputs = { self, nixpkgs }:
    let pkgs = nixpkgs.legacyPackages.x86_64-linux;
        stdenv = pkgs.stdenv;
        myPython = pkgs.python39.withPackages (ps: with ps;
          [ 
          ]);

    in {

    packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;

    defaultPackage.x86_64-linux = self.packages.x86_64-linux.hello;
    devShell.x86_64-linux = pkgs.mkShell {
      nativeBuildInputs = [pkgs.llvmPackages.clang-unwrapped.python];
    };
  };
}
