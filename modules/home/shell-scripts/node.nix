{pkgs, ...}: let
  drizzle-starter = pkgs.writeShellScriptBin "drizzle-starter" ''
    pnpm add drizzle-orm @libsql/client @t3-oss/env-nextjs dotenv clsx zod
    pnpm add -D drizzle-kit daisyui tsx
  '';
  trpc-starter = pkgs.writeShellScriptBin "trpc-starter" ''
    pnpm add @trpc/server@next @trpc/client@next @trpc/react-query@next @trpc/next@next @tanstack/react-query@latest drizzle-orm @libsql/client @t3-oss/env-nextjs dotenv clsx zod
    pnpm add -D drizzle-kit daisyui tsx
  '';
in {
  home.packages = [
    drizzle-starter
    trpc-starter
  ];
}
