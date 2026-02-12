{
  description = "Java Spring dev flake for CI536";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs, ... }: {
    devShells.x86_64-linux.default = let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in
      pkgs.mkShell {
        buildInputs = with pkgs; [
          jdk21
          spring-boot-cli
        ];
        shellHook = ''
          echo ""
          echo "Java version: $(java -version 2>&1 | head -n 1)"
          echo "Spring Boot CLI: $(spring --version)"
          echo ""
        '';
      };
  };
}
