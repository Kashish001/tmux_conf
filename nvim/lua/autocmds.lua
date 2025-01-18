require "nvchad.autocmds"
local autocmd = vim.api.nvim_create_autocmd

autocmd("FileType", {
  pattern = "cpp", -- Trigger only for C++ files
  callback = function()
    vim.keymap.set({ "n", "v" }, "<C-b>", function()
      -- Save the current file
      vim.cmd ":w"

      -- Variables for the file and output
      local filename = vim.fn.expand "%"
      local output = vim.fn.expand "%:r" -- Binary name (file without extension)

      -- Commands for compilation and execution with timeout and output size limit
      local compile_cmd = string.format(
        [[g++ -std=c++20 %s -o %s && ./%s | head -c 1048576; echo && echo "Press any key to exit..." && read line && exit]],
        filename,
        output,
        output
      )

      -- Open a terminal in a vertical split
      -- vim.cmd "vsplit | terminal" -- Open a terminal split
      -- vim.cmd "wincmd L" -- Move the terminal to the right
      require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" }

      -- Run the compilation and execution command interactively
      vim.api.nvim_feedkeys("" .. compile_cmd .. "\n", "n", false) -- Switch to terminal input mode and send the command
    end, { noremap = true, silent = true, buffer = true })
  end,
})

-- autocmd("FileType", {
--   pattern = "cpp", -- Trigger only for C++ files
--   callback = function()
--     vim.keymap.set({ "n", "v" }, "<C-b>", function()
--       -- Save the current file
--       vim.cmd ":w"
--
--       -- Variables for the file and output
--       local filename = vim.fn.expand "%"
--       local output = vim.fn.expand "%:r" -- Binary name (file without extension)
--
--       -- Commands for compilation and execution with timeout and output size limit
--       local compile_cmd = string.format(
--         [[g++ -std=c++20 %s -o %s && ./%s && echo && echo Press ENTER to continue && read line && exit]],
--         filename,
--         output,
--         output
--       )
--
--       -- Open a terminal in a vertical split
--       -- vim.cmd "vsplit | terminal" -- Open a terminal split
--       -- vim.cmd "wincmd L" -- Move the terminal to the right
--       require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" }
--
--       -- Run the compilation and execution command interactively
--       vim.api.nvim_feedkeys("" .. compile_cmd .. "\n", "n", false) -- Switch to terminal input mode and send the command
--     end, { noremap = true, silent = true, buffer = true })
--   end,
-- })

-- autocmd("BufEnter", {
--   pattern = "term://*",
--   callback = function()
--     vim.cmd "startinsert"
--   end,
-- })

-- autocmd("FileType", {
--   pattern = "cpp", -- Trigger only for C++ files
--   callback = function()
--     vim.keymap.set("n", "<C-b>", function()
--       -- Save the current file
--       vim.cmd ":w"
--
--       -- Variables for the file and output
--       local filename = vim.fn.expand "%"
--       local output = vim.fn.expand "%:r" -- Binary name (file without extension)
--
--       -- Command for compilation and execution with a prompt before exit
--       local compile_and_run_cmd = string.format(
--         [[g++ %s -o %s && ./%s; echo "Press any key to exit..." && read -n 1 && exit]],
--         filename,
--         output,
--         output
--       )
--
--       -- Open a terminal in a vertical split
--       vim.cmd "vsplit | terminal" -- Open a vertical terminal split
--       vim.cmd "wincmd L" -- Move the terminal to the right
--
--       -- Switch to terminal input mode and run the command interactively
--       vim.api.nvim_feedkeys("i" .. compile_and_run_cmd .. "\n", "n", false)
--     end, { noremap = true, silent = true, buffer = true })
--   end,
-- })
