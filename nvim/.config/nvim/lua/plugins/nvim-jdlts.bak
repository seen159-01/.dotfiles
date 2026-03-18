return {
    {
        "mfussenegger/nvim-jdtls",
        opts = function(_, opts)
            -- Prefer a local marker so monorepos don't steal the root
            opts.root_dir = function(path)
                return vim.fs.root(path, {
                    ".jdtls-root",
                    "pom.xml",
                    "build.gradle",
                    "settings.gradle",
                    ".git",
                })
            end
        end,
    },
}
