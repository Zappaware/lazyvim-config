return {
  "nosduco/remote-sshfs.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim", -- or "folke/snacks.nvim" or "ibhagwan/fzf-lua"
    "nvim-lua/plenary.nvim",
  },
  opts = {
    connections = {
      ssh_configs = {
        vim.fn.expand("$HOME") .. "/.ssh/config",
        "/etc/ssh/ssh_config",
      },
      ssh_known_hosts = vim.fn.expand("$HOME") .. "/.ssh/known_hosts",
      sshfs_args = {
        "-o reconnect",
        "-o ConnectTimeout=5",
      },
    },
    mounts = {
      base_dir = vim.fn.expand("$HOME") .. "/.sshfs/",
      unmount_on_exit = true,
    },
    handlers = {
      on_connect = {
        change_dir = true,
      },
      on_disconnect = {
        clean_mount_folders = false,
      },
    },
    ui = {
      picker = nil, -- nil = auto, or force "telescope", "snacks", "fzf-lua"
      confirm = {
        connect = true,
        change_dir = false,
      },
    },
    log = {
      enabled = false,
      truncate = false,
      types = {
        all = false,
        util = false,
        handler = false,
        sshfs = false,
      },
    },
  },
  config = function(_, opts)
    require("remote-sshfs").setup(opts)

    -- Load Telescope extension if you're using Telescope
    require("telescope").load_extension("remote-sshfs")
  end,
}
