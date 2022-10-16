--允许修改ip
vim.g.mkdp_open_to_the_world = 1
vim.g.mkdp_open_ip = '10.182.34.112'
vim.g.mkdp_filetypes = { "markdown"}
vim.g.mkdp_port = '9001'
-- 回显页面url
vim.g.mkdp_echo_preview_url = 1

vim.g.mkdp_auto_start = 1
vim.g.mkdp_refresh_slow = 1
vim.o.updatetime = 100

vim.g.mkdp_preview_options = {
    mkit = {},
    katex =  {},
    uml = {},
    maid = {},
    disable_sync_scroll = 0,
    sync_scroll_type  = 'middle',
    hide_yaml_meta = 1,
    sequence_diagrams = {},
    flowchart_diagrams = {},
   -- content_editable = v:false,
    disable_filename = 0,
     }
