local obsidian = require('obsidian')

obsidian.setup({
  workspaces = {
    {
      name = "personal",
      path = "~/cristian-linux/vaults/personal",
    },
    {
      name = "knowledge-vault",
      path = "~/cristian-linux/vaults/knowledge-vault",
    },
    {
      name = "compsci-uni",
      path = "~/cristian-linux/vaults/compsci-uni",
    },
  }
})
